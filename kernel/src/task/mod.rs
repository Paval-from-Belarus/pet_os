use core::arch::asm;
use core::mem::MaybeUninit;
use core::ptr;
use core::sync::atomic::{AtomicUsize, Ordering};

use kernel_types::task::FnTask;
use num_enum::{IntoPrimitive, TryFromPrimitive};

use kernel_types::{bitflags, declare_constants, Zeroed};

use crate::common::atomics::UnsafeLazyCell;

use crate::error::KernelError;
use crate::fs::{FileOpenMode, MountPoint, PathNode};

use crate::io::{pic, CallbackInfo};
use crate::memory::{
    MemoryAllocationFlag, Page, SegmentSelector, VirtualAddress,
};
use crate::task::scheduler::SchedulerLock;
use crate::{memory, object};

mod arch;
pub mod clocks;
mod context;
mod event;
mod fs;
mod mutex;
mod pid;
mod priority;
mod scheduler;
mod state;

pub use context::*;
pub use event::*;
pub use fs::*;
pub use mutex::*;
pub use priority::*;
pub use state::*;

#[macro_export]
macro_rules! current_task {
    () => {
        $crate::task::SCHEDULER.access_lock().current_task()
    };
}

#[derive(PartialOrd, PartialEq)]
pub enum TaskStatus {
    //never was in queue
    Embryo,
    //the task is currently running
    Running,
    //the task is waiting in queue
    Sleeping,
    //the task is blocked in waiting for something
    Blocked(object::RawHandle),
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

#[cfg(target_arch = "x86")]
#[repr(C)]
pub struct TaskState {
    last_task: SegmentSelector,
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
    ssp: u32,
}

impl TaskState {
    pub const fn null() -> Self {
        unsafe { MaybeUninit::zeroed().assume_init() }
    }

    pub fn set_stack_selector(&mut self, ss0: SegmentSelector) {
        self.ss0 = u16::from(ss0);
    }

    pub fn set_code_selector(&mut self, cs: SegmentSelector) {
        self.cs = cs.into();
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

//the calling convention is: eax, edx, ecx (default x8086)
//todo: each task should have stub before running to enable interrupts
#[inline(never)]
pub fn new_task(
    routine: FnTask,
    arg: *const (),
    priority: TaskPriority,
) -> Result<&'static mut RunningTask, KernelError> {
    let kernel_stack = memory::virtual_alloc(
        TASK_STACK_SIZE,
        MemoryAllocationFlag::CONTINOUS
            | MemoryAllocationFlag::ZEROED
            | MemoryAllocationFlag::READ_WRITE,
    )?;

    let task_id = NEXT_TASK_ID.fetch_add(1, Ordering::SeqCst);
    let task = Task::new_boxed(task_id, kernel_stack, priority);

    let task = task.into_node();

    let context = task.context_mut();

    context.eax = (arg as VirtualAddress) as u32;

    context.eip = routine as VirtualAddress;
    context.cs = *SegmentSelector::KERNEL_CODE;

    context.ds = *SegmentSelector::KERNEL_DATA;
    context.es = *SegmentSelector::KERNEL_DATA;

    context.fs = *SegmentSelector::USER_DATA;
    context.gs = *SegmentSelector::USER_DATA;

    context.esp = (kernel_stack + TASK_STACK_SIZE - 1) as u32;

    context.eflags = 0x200; //enable interrupts for each task

    log::debug!("Kernel Stack={:X}", kernel_stack);

    context.esp -= 4; //put the argument to the stack

    unsafe {
        let arg_ptr = context.esp as *mut VirtualAddress;
        arg_ptr.write(arg as VirtualAddress);
    }

    context.esp -= 4; //align argument position

    log::debug!("Context size = {}", context.size());

    context.esp -= context.size() as u32; //copy task context to the stack top

    unsafe {
        let top_context_ptr = context.esp as *mut TaskContext;
        context.copy_to(&mut *top_context_ptr);
        context.esp += 32; //popa is performing from stack bottom
    }

    Ok(task)
}

pub fn submit_task(task: &'static mut RunningTask) {
    log::debug!("Submitting task#{}", task.id);

    SCHEDULER.access_lock().push_task(task);
}

pub fn terminate(_code: i32) -> ! {
    todo!()
}

//run the kernel main loop
pub fn run() -> ! {
    SCHEDULER.get().run();
}

//mark current task as sleeping
pub fn sleep(milliseconds: usize) {
    SCHEDULER.switch_lock().sleep(milliseconds);
}

pub fn init() -> CallbackInfo {
    clocks::init();

    let idle = new_task(idle_task, 42 as _, TaskPriority::Idle)
        .expect("Failed to alloc idle task");

    SCHEDULER.set(SchedulerLock::new(idle));

    CallbackInfo::new(on_timer, ptr::null_mut())
}

#[no_mangle]
extern "C" fn idle_task(arg: *const ()) {
    let v: usize;

    unsafe {
        core::arch::asm!(
            "mov edx, eax",
            "add edx, 1",
            in("eax") arg,
            out("edx") v,
        )
    }
    log::debug!("Idle task param: {v}");

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

fn on_timer(
    _is_processed: bool,
    _context: *const (),
    frame: &mut *mut TaskContext,
) -> bool {
    clocks::update_time();
    let old_context = current_task!().context_ptr();

    SCHEDULER.access_lock().on_tick();

    let new_context = current_task!().context_ptr();

    if !ptr::eq(old_context, new_context) {
        log::trace!("Interrupt switching");

        unsafe {
            log::trace!("Old context: {:?}", &*old_context);
            {
                let frame: &TaskContext = &**frame;
                log::trace!("Current context: {:?}", frame);
            }
            log::trace!("New context: {:?}", &*new_context);

            (**frame).copy_to(&mut *old_context);

            memory::switch_to_task(current_task!());

            *frame = new_context;

            log::trace!("IRET Frame After: {:?}", &**frame);
        }
    }

    pic::complete(pic::PicLine::IRQ0);

    true
}

pub static SCHEDULER: UnsafeLazyCell<SchedulerLock> = UnsafeLazyCell::empty();
static NEXT_TASK_ID: AtomicUsize = AtomicUsize::new(1);
