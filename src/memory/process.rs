use core::mem::MaybeUninit;
use crate::{bitflags};
use crate::memory::{AddressSpace, SegmentSelector, VirtualAddress};
use crate::utils::Zeroed;

pub struct Context {}

bitflags!(
    pub ThreadStatus(usize),
);
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

pub struct TaskHandle {
    info: ThreadInfo,
    status: ThreadStatus,
    kernel_stack_offset: VirtualAddress,
    id: usize,
    address: AddressSpace,
    files: FileHandle,
}

pub struct ThreadInfo {}

pub struct FileHandle {}