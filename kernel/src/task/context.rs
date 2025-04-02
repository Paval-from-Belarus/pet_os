#![allow(unused)]

use kernel_types::Zeroed;

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
    wrapper_eip: VirtualAddress,
    eip: VirtualAddress,
    arg: VirtualAddress,
}

#[no_mangle]
#[naked]
pub unsafe extern "C" fn prepare_thread() {
    core::arch::naked_asm! {
        "pop edx",
        "pop eax",
        "call edx"
    }
}

impl TaskContext {
    pub fn new(eip: VirtualAddress, arg: *mut ()) -> Self {
        Self {
            wrapper_eip: prepare_thread as VirtualAddress,
            arg: arg as VirtualAddress,
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
