mod clocks;

use core::mem::MaybeUninit;
use core::arch::{asm, global_asm};
use core::{mem, ptr};
use core::ptr::NonNull;
use core::sync::atomic::{AtomicUsize, Ordering};
use crate::{bitflags, declare_constants, interrupts, log, memory};
use crate::drivers::Handle;
use crate::interrupts::{CallbackInfo, InterruptableLazyCell, IrqLine};
use crate::memory::{AddressSpace, Page, ProcessInfo, SegmentSelector, ThreadRoutine, VirtualAddress};
use crate::utils::atomics::SpinLockLazyCell;
use crate::utils::{LinkedList, ListNode, ListNodeWrapper, SimpleList, SimpleListNode, SpinBox, ToSimpleListNode, Zeroed};


#[derive(PartialOrd, PartialEq)]
pub enum TaskStatus {
    //never was in queue
    Embryo,
    //the task is currently running
    Active,
    //the task is waiting in queue
    Delayed,
    //the task is blocked in waiting for something
    Blocked,
    //the task is died
    Killed,
}


///The
#[repr(C)]
pub struct SysContext {
    edi: usize,
    esi: usize,
    ebx: usize,
    ds: u16,
    es: u16,
}

#[cfg(target_arch = "x86")]
#[repr(C)]
pub struct TaskState {
    last_task: Option<SegmentSelector>,
    reserved_1: Zeroed<u16>,
    esp0: u32,
    ss0: u16,
    reserved_2: Zeroed<u16>,
    esp1: u32,
    ss1: u16,
    reserved_3: Zeroed<u16>,
    esp2: u32,
    ss2: u16,
    reserved_4: Zeroed<u16>,
    cr3: u32,
    eip: u32,
    flags: u32,
    eax: u32,
    ecx: u32,
    edx: u32,
    ebx: u32,
    esp: u32,
    ebp: u32,
    esi: u32,
    edi: u32,
    es: u16,
    reserved_5: Zeroed<u16>,
    cs: u16,
    reserved_6: Zeroed<u16>,
    ss: u16,
    reserved_7: Zeroed<u16>,
    ds: u16,
    reserved_8: Zeroed<u16>,
    fs: u16,
    reserved_9: Zeroed<u16>,
    gs: u16,
    reserved_10: Zeroed<u16>,
    ldt: u16,
    reserved_11: Zeroed<u16>,
    debug_flag: u16,
    io_map_address: u16,
}

impl TaskState {
    pub const fn null() -> Self {
        unsafe { MaybeUninit::zeroed().assume_init() }
    }
    pub fn set_stack_selector(&mut self, ss0: SegmentSelector) {
        self.ss0 = u16::from(ss0);
    }
    pub fn set_io_map(&mut self, address: u16) {
        self.io_map_address = address;
    }
    pub fn set_kernel_stack(&mut self, esp0: usize) {
        self.esp0 = esp0 as u32;//the u32 is native word
    }
}
declare_constants!(
    pub usize,
    MAX_THREAD_COUNT = 200, "The maximal count of thread in system";
    TASK_STACK_SIZE = Page::SIZE, "The size of kernel stack for each thread";
);


pub struct ThreadTask {
    pub status: TaskStatus,
    //the bottom of the thread's kernel stack
    //that is, last byt is kernel_stack + TASK_STACK_SIZE
    pub kernel_stack: VirtualAddress,
    pub context: *mut TaskContext,
    //the unique identifier of thread
    pub id: usize,
    //the working time of thread (usize::max if too much)
    pub elapsed: usize,
    //the time when task should be started
    //the value should be greater then 0
    pub start_time: usize,
    //the process context for thread
    pub parent: Option<&'static mut ProcessInfo>,
    pub files: SimpleList<'static, FileHandle>,
}

impl ThreadTask {
    pub fn new(id: usize, kernel_stack: VirtualAddress) -> Self {
        Self {
            kernel_stack,
            id,
            status: TaskStatus::Embryo,
            context: ptr::null_mut(),
            elapsed: 0,
            start_time: 0,
            parent: None,
            files: SimpleList::empty(),
        }
    }
}

//the calling convention is: eax, edx, ecx (default x8086)
///todo: each task should have stub before running to enable interrupts
pub fn new_task(routine: ThreadRoutine, arg: *mut ()) -> &'static mut ListNode<ThreadTask> {
    let kernel_stack = memory::virtual_alloc(TASK_STACK_SIZE);
    let raw_task = memory::slab_alloc::<ListNode<ThreadTask>>();
    let task_id = NEXT_THREAD_ID.fetch_add(1, Ordering::SeqCst);
    let task = unsafe {
        let task_data = ThreadTask::new(task_id, kernel_stack);
        raw_task.write(ListNode::wrap_data(task_data))
    };
    let context = TaskContext::with_return_address(routine as VirtualAddress);
    task.context = (task.kernel_stack + TASK_STACK_SIZE - mem::size_of::<TaskContext>() - interrupts::KERNEL_TRAP_SIZE) as *mut TaskContext;
    unsafe { task.context.write(context) };
    let arg_offset = ((task.context as VirtualAddress) - mem::size_of_val(&arg)) as *mut *mut ();
    unsafe { arg_offset.write(arg) };
    task
}

pub fn submit_task(task: &'static mut ListNode<ThreadTask>) {
    SCHEDULER.get().add_task(task);
}

pub struct TaskScheduler {
    delayed: LinkedList<'static, ThreadTask>,
    current: Option<NonNull<ListNode<ThreadTask>>>,
    context: *mut TaskContext,
}

impl TaskScheduler {
    pub fn new() -> Self {
        Self {
            delayed: LinkedList::empty(),
            current: None,
            context: ptr::null_mut(),
        }
    }
    pub fn add_task(&mut self, task: &'static mut ListNode<ThreadTask>) {
        task.status = TaskStatus::Delayed;
        self.delayed.push_back(task);
    }
    //try fetch next task
    pub fn next_task(&mut self) -> Option<&'static mut ListNode<ThreadTask>> {
        let mut iterator = self.delayed.iter_mut();
        let mut next_task = None;
        while next_task.is_none() && let Some(task_node) = iterator.next() {
            if task_node.status == TaskStatus::Killed {
                let _ = iterator.unlink_watched();
                memory::slab_dealloc(task_node);
                continue;
            }
            assert!(task_node.status != TaskStatus::Active, "No active task can be in delayed queue");
            next_task = iterator.unlink_watched();
        }
        next_task
    }
    //replace current task and place it in delayed queue
    pub fn replace_current(&mut self, next: &'static mut ListNode<ThreadTask>) {
        if let Some(mut raw_current_task) = self.current {
            let current_task = unsafe { raw_current_task.as_mut() };
            current_task.status = TaskStatus::Delayed;
            self.add_task(current_task);
        }
        next.status = TaskStatus::Active;
        //if not current task is specified, simply set it
        self.current = Some(NonNull::from(next));
    }
    pub fn block_current(&mut self) -> &'static mut ListNode<ThreadTask> {
        if let Some(mut raw_current_task) = self.current {
            let current_task = unsafe { raw_current_task.as_mut() };
            current_task.status = TaskStatus::Blocked;
            current_task
        } else {
            unreachable!("Attempt to block empty task")
        }
    }
    pub fn unblock(&mut self, task: &'static mut ListNode<ThreadTask>) {
        self.add_task(task);
    }
}

///Blocking in waiting current task.
///The current task cannot be null
pub fn current_task() -> &'static ThreadTask {
    todo!()
}


#[cfg(target_arch = "x86")]
#[repr(C)]
#[derive(Default)]
pub struct TaskContext {
    ebp: u32,
    edi: u32,
    esi: u32,
    ebx: u32,
    eip: VirtualAddress,
}

impl TaskContext {
    pub fn with_return_address(eip: VirtualAddress) -> Self {
        Self {
            eip,
            ..Self::default()
        }
    }
}

#[inline(never)]
pub unsafe fn switch_context(old: &mut *mut TaskContext, new: *mut TaskContext) {
    asm!(
    "push ebx",
    "push esi",
    "push edi",
    "push ebp",
    "mov [eax], esp",
    "mov esp, edx",
    "pop ebp",
    "pop edi",
    "pop esi",
    "pop ebx",
    in("eax") old,
    in("edx") new,
    options(nostack));
}

//run the kernel main loop
pub fn run() -> ! {
    unsafe { interrupts::enable() };//previously, they were disabled
    loop {
        let mut scheduler = SCHEDULER.get();
        let next_task = scheduler.next_task();
        //next_task is valid task to be run
        if let Some(task) = next_task {
            let mut raw_task = NonNull::from(task);
            unsafe {
                scheduler.replace_current(raw_task.as_mut());
                memory::switch_to_task(raw_task.as_mut());
                switch_context(&mut scheduler.context, raw_task.as_mut().context);
                memory::switch_to_kernel();
            }
        }
    }
}

//mark current task as sleeping


pub fn sleep(milliseconds: usize) {
    let mut scheduler = SCHEDULER.get();
    let blocked = scheduler.block_current();
    blocked.start_time = clocks::get_time_since_boot() + milliseconds;
    let mut raw_blocked = NonNull::from(blocked);
    unsafe {
        SLEEPING_TASKS.get().push_back(raw_blocked.as_mut().as_simple());
        switch_context(&mut raw_blocked.as_mut().context, scheduler.context);
    }
}

pub fn init() -> CallbackInfo {
    clocks::init();
    SCHEDULER.set(TaskScheduler::new());
    SLEEPING_TASKS.set(SimpleList::empty());
    CallbackInfo::default(on_timer)
}

fn reschedule() {
    let scheduler = SCHEDULER.get();
    if let Some(mut raw_current) = scheduler.current {
        let current = unsafe { raw_current.as_mut() };
        unsafe { switch_context(&mut current.context, scheduler.context) };
    }
}

fn try_wakeup() {
    let mut scheduler = SCHEDULER.get();
    let mut tasks = SLEEPING_TASKS.get();
    let mut iter = tasks.iter_mut();
    let current_time = clocks::get_time_since_boot();
    while let Some(task) = iter.next() {
        if task.start_time < current_time {
            let _ = iter.unlink_watched();
            scheduler.unblock(task.as_node());
        }
    }
}

fn on_timer(_is_processed: bool, _context: *mut ()) -> bool {
    clocks::update_time();
    try_wakeup();
    true
}

static SLEEPING_TASKS: InterruptableLazyCell<SimpleList<'static, ListNodeWrapper<ThreadTask>>> = InterruptableLazyCell::empty();
static SCHEDULER: InterruptableLazyCell<TaskScheduler> = InterruptableLazyCell::empty();
static NEXT_THREAD_ID: AtomicUsize = AtomicUsize::new(1);

pub struct FileHandle {}
