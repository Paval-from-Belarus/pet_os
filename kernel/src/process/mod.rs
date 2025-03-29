use core::arch::asm;
use core::cell::UnsafeCell;
use core::mem::MaybeUninit;
use core::ptr::NonNull;
use core::sync::atomic::{AtomicUsize, Ordering};
use core::{mem, ptr};

use alloc::sync::Arc;
use num_enum::{IntoPrimitive, TryFromPrimitive};

use kernel_macro::ListNode;
use kernel_types::collections::{
    BorrowingLinkedList, BoxedNode, LinkedList, ListNode, TinyListNode,
};
use kernel_types::{bitflags, declare_constants, Zeroed};
use static_assertions::const_assert;

use crate::file_system::{
    File, FileOpenMode, MountPoint, PathNode, MAX_FILES_COUNT,
};
use crate::interrupts::CallbackInfo;
use crate::memory::{
    slab_alloc, Kernel, Page, ProcessState, SegmentSelector, Slab, SlabBox,
    ThreadRoutine, VirtualAddress,
};
use crate::process::scheduler::TaskScheduler;
use crate::utils::atomics::UnsafeLazyCell;
use crate::{interrupts, log, memory};

mod clocks;
mod pid;
mod scheduler;

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
    NO_USER1 = TaskSignal::User1 as u8
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
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u16)]
pub enum TaskPriority {
    Idle,
    User(u16),
    Module(u16),
    Kernel,
}

impl From<TaskPriority> for u16 {
    fn from(value: TaskPriority) -> Self {
        match value {
            TaskPriority::Idle => 0,
            TaskPriority::User(v) => v,
            TaskPriority::Module(v) => v,
            TaskPriority::Kernel => 31,
        }
    }
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
        self.esp0 = esp0 as u32; //the u32 is native word
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
    log::debug!("prepare thread");
    SCHEDULER.get().unlock();
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

pub type ThreadTaskBox = RunningTaskBox;

pub struct RunningTaskBox {
    node: SlabBox<RunningTask>,
}

impl RunningTaskBox {
    pub fn into_node(self) -> &'static mut ListNode<RunningTask> {
        unsafe { &mut *SlabBox::into_raw(self.node) }.as_node()
    }
}

impl BoxedNode for RunningTask {
    type Target = RunningTaskBox;

    fn into_boxed(
        node: &mut <RunningTask as kernel_types::collections::TinyListNodeData>::Item,
    ) -> Self::Target {
        let node = unsafe { SlabBox::from_raw_in(node, Kernel) };

        Self::Target { node }
    }
}

#[derive(ListNode)]
pub struct RunningTask {
    #[list_pivots]
    node: ListNode<RunningTask>,
    pub lock: Arc<spin::RwLock<ThreadTask>>,
}

impl Clone for RunningTask {
    fn clone(&self) -> Self {
        Self {
            node: ListNode::empty(),
            lock: Arc::clone(&self.lock),
        }
    }
}

#[repr(C)]
pub struct TaskMetrics {
    /// The kernel lock's count
    pub lock_count: usize,
    /// The count of full execution
    pub exec_count: usize,
    /// the working time of thread (usize::max if too much)
    pub elapsed: usize,

    //the ratio to incrase time quantum according
    //task history
    pub jump_ratio: usize,
}

#[repr(C)]
pub struct ThreadTask {
    //the pivots in scheduler list
    pub priority: TaskPriority,
    pub status: TaskStatus,
    //the bottom of the thread's kernel stack
    //that is, last byt is kernel_stack + TASK_STACK_SIZE
    pub kernel_stack: VirtualAddress,
    pub context: *mut TaskContext,
    //the unique identifier of thread
    pub id: usize,
    //the time when task should be started
    //the value should be greater then 0
    pub start_time: usize,
    //the process context for thread
    pub state: Option<&'static mut ProcessState>,
    pub file_system: NonNull<TaskFileSystem>,

    /// The base execution duration for task
    pub base_duration: u32,
    pub metrics: TaskMetrics,

    pub files: NonNull<FilePool>,
    //todo: consider to add namespace field
}

impl Slab for ThreadTask {
    const NAME: &str = "task";
}

const_assert!(mem::size_of::<ThreadTask>() < Page::SIZE);

pub struct TaskFileSystem {
    mask: FileOpenMode,
    working_dir: &'static PathNode,
    file_system: &'static MountPoint,
    use_count: AtomicUsize,
}

impl ThreadTask {
    pub fn new_boxed(
        id: usize,
        kernel_stack: VirtualAddress,
        priority: TaskPriority,
    ) -> ThreadTaskBox {
        let lock = Arc::new(spin::RwLock::new(ThreadTask {
            kernel_stack,
            id,
            priority,
            status: TaskStatus::Embryo,
            context: ptr::null_mut(),
            start_time: 0,
            state: None,
            files: NonNull::dangling(),
            file_system: NonNull::dangling(),

            base_duration: 100,
            metrics: TaskMetrics {
                elapsed: 0,
                lock_count: 0,
                exec_count: 0,
                jump_ratio: 0,
            },
        }));

        ThreadTaskBox {
            node: slab_alloc(RunningTask {
                node: ListNode::empty(),
                lock,
            })
            .unwrap(),
        }
    }
}

fn default_thread_routine(_arg: *mut ()) {
    unsafe { interrupts::enable() };
}

//the calling convention is: eax, edx, ecx (default x8086)
//todo: each task should have stub before running to enable interrupts
pub fn new_task(
    routine: ThreadRoutine,
    arg: *mut (),
    priority: TaskPriority,
) -> ThreadTaskBox {
    let kernel_stack = memory::virtual_alloc(TASK_STACK_SIZE);

    let task_id = NEXT_THREAD_ID.fetch_add(1, Ordering::SeqCst);
    let task = ThreadTask::new_boxed(task_id, kernel_stack, priority);

    let task_node = task.into_node();
    let mut task = task_node.lock.write();

    let context = TaskContext::with_return_address(routine as VirtualAddress);

    let context_offset = task.kernel_stack + TASK_STACK_SIZE
        - mem::size_of::<TaskContext>()
        - interrupts::KERNEL_TRAP_SIZE;

    task.context = context_offset as *mut TaskContext;
    unsafe { task.context.write(context) };

    let arg_offset = (context_offset - mem::size_of_val(&arg)) as *mut *mut ();

    unsafe { arg_offset.write(arg) };

    drop(task);

    task_node.into_boxed()
}

pub fn submit_task(task: ThreadTaskBox) {
    // let tiny_node = unsafe { task.as_sibling().as_mut() };
    // let raw_tiny_node = NonNull::from(tiny_node);
    SCHEDULER.get().add_task(task);
}

fn accept(_task: &'static ThreadTask) {}

//run the kernel main loop
pub fn run() -> ! {
    log::debug!("Main loop");

    SCHEDULER.get().run();
}

//mark current task as sleeping
pub fn sleep(milliseconds: usize) {
    SCHEDULER.get().sleep(milliseconds);
}

pub fn init() -> CallbackInfo {
    clocks::init();

    let idle = new_task(idle_task, ptr::null_mut(), TaskPriority::Idle);
    SCHEDULER.set(TaskScheduler::new(idle));

    CallbackInfo::default(on_timer)
}

fn idle_task(_args: *mut ()) {
    loop {
        log::debug!("Idle task");

        unsafe {
            asm! {
                "hlt",
                options(preserves_flags, nomem, nostack)
            }
        }
    }
}

fn try_wakeup() {
    let current_time = clocks::get_time_since_boot();
    SCHEDULER.wakeup(current_time)
}

fn on_timer(_is_processed: bool, _context: *mut ()) -> bool {
    log::debug!("On timer");

    clocks::update_time();

    try_wakeup();

    true
}

static SCHEDULER: UnsafeLazyCell<TaskScheduler> = UnsafeLazyCell::empty();
static NEXT_THREAD_ID: AtomicUsize = AtomicUsize::new(1);

pub struct Futex {
    inner: UnsafeCell<NonNull<FutexInner>>,
}

impl Slab for FutexInner {
    const NAME: &str = "futex";
}

impl Futex {
    pub fn new(capacity: usize) -> Self {
        let raw_futex = memory::slab_alloc_old::<FutexInner>(
            memory::AllocationStrategy::Kernel,
        )
        .expect("Failed to alloc futex");
        let futex = raw_futex.write(FutexInner {
            count: AtomicUsize::new(0),
            max_count: capacity,
            waiting: LinkedList::empty(),
        });
        let inner = UnsafeCell::new(NonNull::from(futex));
        Self { inner }
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
                SCHEDULER.add_task(waiting.into_boxed());
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
    waiting: LinkedList<'static, RunningTask>,
}

impl FutexInner {
    pub fn try_acquire(&mut self) -> Result<(), ()> {
        if self.count.load(Ordering::Acquire) == self.max_count {
            return Err(());
        }
        self.count.fetch_add(1, Ordering::Release);
        Ok(())
    }
    pub fn wait(&mut self, task: &'static mut RunningTask) {
        task.lock.write().status = TaskStatus::Blocked;

        self.waiting.push_back(task.as_node())
    }
    fn release(&mut self) -> Option<&'static mut ListNode<RunningTask>> {
        self.count.fetch_sub(1, Ordering::Release);
        self.waiting.remove_first()
    }
}

pub struct FilePool {
    opened_files_count: usize,
    //the next index of file
    next_index: Option<usize>,
    files: [NonNull<File>; MAX_FILES_COUNT],
}
