use core::arch::asm;
use core::mem::MaybeUninit;
use core::sync::atomic::{AtomicUsize, Ordering};
use core::{mem, ptr};

use num_enum::{IntoPrimitive, TryFromPrimitive};

use kernel_types::{bitflags, declare_constants, Zeroed};

use crate::common::atomics::UnsafeLazyCell;

use crate::fs::{FileOpenMode, MountPoint, PathNode};

use crate::interrupts::CallbackInfo;
use crate::memory::{Page, SegmentSelector, ThreadRoutine, VirtualAddress};
use crate::task::scheduler::SchedulerLock;
use crate::{interrupts, memory, object};

mod arch;
mod clocks;
mod context;
mod fs;
mod futex;
mod pid;
mod scheduler;
mod state;

pub use context::*;
pub use fs::*;
pub use state::*;

#[derive(PartialOrd, PartialEq)]
pub enum TaskStatus {
    //never was in queue
    Embryo,
    //the task is currently running
    Running,
    //the task is waiting in queue
    Sleeping,
    //the task is blocked in waiting for something
    Blocked(object::Handle),
    //the task is died
    Killed,
}

impl TaskStatus {
    pub fn blocking_reason(&self) -> Option<&object::Handle> {
        match self {
            TaskStatus::Blocked(handle) => Some(handle),
            _ => None,
        }
    }
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

impl PartialOrd for TaskPriority {
    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
        self.into_raw().partial_cmp(&other.into_raw())
    }
}

impl Ord for TaskPriority {
    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
        self.into_raw().cmp(&other.into_raw())
    }
}

impl TaskPriority {
    pub fn into_raw(self) -> u16 {
        match self {
            TaskPriority::Idle => 0,
            TaskPriority::User(v) => v,
            TaskPriority::Module(v) => v,
            TaskPriority::Kernel => 31,
        }
    }
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

#[allow(unused)]
pub struct TaskFileSystem {
    mask: FileOpenMode,
    working_dir: &'static PathNode,
    file_system: &'static MountPoint,
    use_count: AtomicUsize,
}

#[allow(unused)]
fn default_thread_routine(_arg: *mut ()) {
    unsafe { interrupts::enable() };
}

//the calling convention is: eax, edx, ecx (default x8086)
//todo: each task should have stub before running to enable interrupts
pub fn new_task(
    routine: ThreadRoutine,
    arg: *mut (),
    priority: TaskPriority,
) -> &'static mut RunningTask {
    let kernel_stack = memory::virtual_alloc(TASK_STACK_SIZE);

    let task_id = NEXT_TASK_ID.fetch_add(1, Ordering::SeqCst);
    let task = Task::new_boxed(task_id, kernel_stack, priority);

    let task = task.into_node();

    let context = TaskContext::with_return_address(routine as VirtualAddress);

    let context_offset = task.kernel_stack + TASK_STACK_SIZE
        - mem::size_of::<TaskContext>()
        - interrupts::KERNEL_TRAP_SIZE;

    task.context = context_offset as *mut TaskContext;
    unsafe { task.context.write(context) };

    let arg_offset = (context_offset - mem::size_of_val(&arg)) as *mut *mut ();

    unsafe { arg_offset.write(arg) };

    task
}

pub fn submit_task(task: &'static mut RunningTask) {
    SCHEDULER.lock().push_working_task(task);
}

//run the kernel main loop
pub fn run() -> ! {
    log::debug!("Main loop");

    SCHEDULER.get().run();
}

//mark current task as sleeping
pub fn sleep(milliseconds: usize) {
    SCHEDULER.lock().sleep(milliseconds);
}

pub fn init() -> CallbackInfo {
    clocks::init();

    let idle = new_task(idle_task, ptr::null_mut(), TaskPriority::Idle);
    SCHEDULER.set(SchedulerLock::new(idle));

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
    SCHEDULER.lock().sleep(current_time)
}

fn on_timer(_is_processed: bool, _context: *mut ()) -> bool {
    log::debug!("On timer");

    clocks::update_time();

    SCHEDULER.lock().on_tick();

    true
}

static SCHEDULER: UnsafeLazyCell<SchedulerLock> = UnsafeLazyCell::empty();
static NEXT_TASK_ID: AtomicUsize = AtomicUsize::new(1);
