mod clocks;
mod scheduler;
mod pid;

use core::mem::{MaybeUninit, offset_of};
use core::arch::{asm, global_asm};
use core::{mem, ptr};
use core::cell::UnsafeCell;
use core::ptr::{addr_of_mut, NonNull};
use core::sync::atomic::{AtomicUsize, Ordering};
use num_enum::{FromPrimitive, IntoPrimitive, TryFromPrimitive};
use crate::{bitflags, declare_constants, interrupts, list_node_data, log, memory};
use crate::interrupts::{CallbackInfo, InterruptableLazyCell};
use crate::memory::{AddressSpace, Page, ProcessInfo, SegmentSelector, ThreadRoutine, VirtualAddress};
use crate::process::scheduler::TaskScheduler;
use crate::utils::{BorrowingLinkedList, LinkedList, ListNode, ListNodePivots, TinyLinkedList, TinyListNode, Zeroed, ListNodePivot, ListNodeData};
use crate::utils::atomics::UnsafeLazyCell;


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
bitflags!(
    pub TaskSignalMask(u8),
    NO_USER1 = TaskSignal::User1
);
#[derive(PartialOrd, PartialEq, IntoPrimitive, TryFromPrimitive)]
#[repr(u8)]
pub enum TaskSignal {
    //the termination signal
    Kill = 0x01,
    //the default signal to terminate process
    Termination = 0x02,
    //the thread is killed by kernel (invalid syscall parameters)
    Sys = 0x04,
    //the thread is killed by invalid access to memory
    SegFault = 0x08,
    //user defined signals
    User1 = 0x10,
    User2 = 0x20,
}

//consider to merge status and priority into single field
pub enum TaskPriority {
    LOW,
    HIGH,
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

#[cfg(target_arch = "x86")]
#[repr(C)]
#[derive(Default)]
pub struct TaskContext {
    ebp: u32,
    edi: u32,
    esi: u32,
    ebx: u32,
    eip: VirtualAddress,
    wrapper_eip: VirtualAddress,
}

pub fn prepare_thread() {
    log!("prepare thread");
    unsafe { SCHEDULER.get().unlock() };
}

impl TaskContext {
    pub fn with_return_address(eip: VirtualAddress) -> Self {
        Self {
            wrapper_eip: prepare_thread as VirtualAddress,
            eip,
            ..Self::default()
        }
    }
}
list_node_data!(
    pub ThreadTask(node);
    RunnableTask(runnable);
    SiblingTask(sibling);
);
#[repr(C)]
pub struct ThreadTask {
    node: ListNode<ThreadTask>,
    //the pivots in scheduler list
    runnable: ListNode<RunnableTask>,
    sibling: ListNodePivots<SiblingTask>,
    pub priority: TaskPriority,
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
    pub files: NonNull<FilePool>,
}

impl ThreadTask {
    pub fn new(id: usize, kernel_stack: VirtualAddress, priority: TaskPriority) -> Self {
        Self {
            kernel_stack,
            id,
            priority,
            status: TaskStatus::Embryo,
            context: ptr::null_mut(),
            elapsed: 0,
            start_time: 0,
            parent: None,
            files: NonNull::dangling(),
            ..Default::default()
        }
    }
}

fn default_thread_routine(arg: *mut ()) {
    unsafe { interrupts::enable() };
}

//the calling convention is: eax, edx, ecx (default x8086)
//todo: each task should have stub before running to enable interrupts
pub fn new_task(routine: ThreadRoutine, arg: *mut (), priority: TaskPriority) -> &'static mut ListNode<ThreadTask> {
    let kernel_stack = memory::virtual_alloc(TASK_STACK_SIZE);
    let raw_task = memory::slab_alloc::<ListNode<ThreadTask>>();
    let task_id = NEXT_THREAD_ID.fetch_add(1, Ordering::SeqCst);
    let task = unsafe {
        let task_data = ThreadTask::new(task_id, kernel_stack, priority);
        raw_task.write(ListNode::new(task_data))
    };

    let context = TaskContext::with_return_address(routine as VirtualAddress);
    task.context = (task.kernel_stack + TASK_STACK_SIZE - mem::size_of::<TaskContext>() - interrupts::KERNEL_TRAP_SIZE) as *mut TaskContext;
    unsafe { task.context.write(context) };
    let arg_offset = ((task.context as VirtualAddress) - mem::size_of_val(&arg)) as *mut *mut ();
    unsafe { arg_offset.write(arg) };
    task
}

pub fn submit_task(task: &'static mut ThreadTask) {
    SCHEDULER.get().add_task(task);
}

//run the kernel main loop
pub fn run() -> ! {
    SCHEDULER.get().run();
}

//mark current task as sleeping
pub fn sleep(milliseconds: usize) {
    SCHEDULER.get().sleep(milliseconds);
}

pub fn init() -> CallbackInfo {
    clocks::init();
    let idle = new_task(idle_task, ptr::null_mut(), TaskPriority::HIGH);
    SCHEDULER.set(TaskScheduler::new(idle));
    CallbackInfo::default(on_timer)
}

fn idle_task(args: *mut ()) {
    loop {
        log!("Idle task");
        unsafe {
            asm!(
            "hlt",
            options(preserves_flags, nomem, nostack));
        }
    }
}

fn try_wakeup() {
    let current_time = clocks::get_time_since_boot();
    SCHEDULER.wakeup(current_time)
}

fn on_timer(_is_processed: bool, _context: *mut ()) -> bool {
    clocks::update_time();
    try_wakeup();
    true
}


static SCHEDULER: UnsafeLazyCell<TaskScheduler> = UnsafeLazyCell::empty();
static NEXT_THREAD_ID: AtomicUsize = AtomicUsize::new(1);

pub struct Futex {
    inner: UnsafeCell<NonNull<FutexInner>>,
}

impl Futex {
    pub fn new(capacity: usize) -> Self {
        let raw_futex = memory::slab_alloc::<FutexInner>();
        let futex = raw_futex.write(FutexInner {
            count: AtomicUsize::new(0),
            max_count: capacity,
            waiting: LinkedList::empty(),
        });
        let inner = UnsafeCell::new(NonNull::from(futex));
        Self {
            inner
        }
    }
    pub fn mutex() -> Self {
        Self::new(1)
    }
    pub fn acquire(&self) {
        SCHEDULER.lock();
        unsafe {
            //if failed to acquire
            let futex = self.inner();
            loop {
                if futex.try_acquire().is_ok() {
                    break;
                }
                let current = SCHEDULER.block_current();
                //we are not in queue now, therefore we should put ourself in queue again
                futex.wait(current);
                SCHEDULER.switch();
            }
            SCHEDULER.unlock();
        }
    }
    pub fn release(&self) {
        SCHEDULER.lock();
        unsafe {
            let futex = self.inner();
            let waiting_option = futex.release();
            if let Some(waiting) = waiting_option {
                SCHEDULER.add_task(waiting);
            }
            SCHEDULER.unlock();
        }
    }
    fn inner(&self) -> &mut FutexInner {
        unsafe { (*self.inner.get()).as_mut() }
    }
}

///the struct is absolutely not thread-safe
struct FutexInner {
    count: AtomicUsize,
    max_count: usize,
    waiting: LinkedList<'static, ThreadTask>,
}

impl FutexInner {
    pub fn try_acquire(&mut self) -> Result<(), ()> {
        if self.count.load(Ordering::Acquire) == self.max_count {
            return Err(());
        }
        self.count.fetch_add(1, Ordering::Release);
        Ok(())
    }
    pub fn wait(&mut self, task: &'static mut ListNode<ThreadTask>) {
        task.status = TaskStatus::Blocked;
        self.waiting.push_back(task);
    }
    fn release(&mut self) -> Option<&'static mut ListNode<ThreadTask>> {
        self.count.fetch_sub(1, Ordering::Release);
        self.waiting.remove_first()
    }
}

pub struct File {
    pub ref_count: AtomicUsize,
}

pub struct FilePool {
    //the current count of open files
    file_count: usize,
    //the next index of file
    next_file: usize,
}
