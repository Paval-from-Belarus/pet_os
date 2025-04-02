#![allow(unused)]

use crate::{memory::VirtualAddress, task::SCHEDULER};

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

#[inline(never)]
pub unsafe fn switch_context(
    old: &mut *mut TaskContext,
    new: *mut TaskContext,
) {
    core::arch::asm! {
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

        options(nostack)
    }
}
