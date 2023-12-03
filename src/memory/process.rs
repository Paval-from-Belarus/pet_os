use core::cell::UnsafeCell;
use core::mem::MaybeUninit;
use core::ptr;
use crate::{bitflags, interrupts};
use crate::drivers::Handle;
use crate::interrupts::{CallbackInfo, IrqLine};
use crate::memory::{AddressSpace, ProcessMemory, SegmentSelector, VirtualAddress};
use crate::utils::atomics::SpinLockLazyCell;
use crate::utils::Zeroed;

pub struct Context {}

pub enum ThreadStatus {
    Active,
    Stopped,
    Delayed,
    Killed,
}

#[repr(C)]
pub struct TaskContext {}

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
    ss2: u16,
    reserved_4: Zeroed<u16>,
    cr3: u32,
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
    ldt: SegmentSelector,
    reserved_11: Zeroed<u16>,
    debug_flag: u16,
    io_map_address: u16,
}

impl TaskState {
    pub const fn null() -> Self {
        unsafe { MaybeUninit::zeroed().assume_init() }
    }
}


pub struct ThreadInfo {
    status: ThreadStatus,
    //the last offset of thread for kernel stack
    kernel_stack: VirtualAddress,
    //the unique identifier of thread
    id: usize,
    //the working time of thread (usize::max if too much)
    elapsed: usize,
    //the process context for thread
    process: UnsafeCell<ProcessMemory>,
    files: FileHandle,
}

static THREAD_SCHEDULER: SpinLockLazyCell<ThreadScheduler> = SpinLockLazyCell::empty();

pub struct ThreadScheduler {}

pub fn init_scheduler() {
    let info = CallbackInfo::new(Handle::KERNEL, on_timer, ptr::null_mut());
    interrupts::registry(Handle::KERNEL, IrqLine::SYS_TIMER, info);
}

fn on_timer(is_processed: bool, context: *mut ()) -> bool {
    false
}

pub struct FileHandle {}
