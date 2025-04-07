#![allow(unused)]

use core::mem::{self, offset_of};

use kernel_types::Zeroed;

use crate::{current_task, memory::VirtualAddress, task::SCHEDULER};

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
    //registers saved via pusha
    pub edi: u32,
    pub esi: u32,
    pub ebp: u32,
    pub esp: u32, //ignored as another esp used
    pub ebx: u32,
    pub edx: u32,
    pub ecx: u32,
    pub eax: u32,

    //segment registers
    pub gs: u16,
    pub fs: u16,
    pub es: u16,
    pub ds: u16,

    //previous
    pub eip: VirtualAddress,

    //interrupt handling fields
    pub cs: u16,
    pub eflags: u32,

    //saved during kernel-space user-space switching
    //but also duplicate kernel during switching
    pub user_esp: VirtualAddress,
    pub user_ss: u16,
}

#[no_mangle]
pub unsafe extern "C" fn prepare_task() {
    log::debug!("Prepared task");

    let context = &*current_task!().context;

    core::arch::asm! {
        "",
        in("eax") context.eax,
        options(nostack)
    }
}

impl TaskContext {
    pub fn zeroed() -> Self {
        Self::default()
    }

    pub fn copy_to(&self, context: &mut TaskContext) {
        //only user space context has rinq = 3
        let is_user_space_context = self.cs & 0x03 == 0x03;

        let context_size = if is_user_space_context {
            mem::size_of::<TaskContext>()
        } else {
            //skip user_esp and user_ss
            mem::size_of::<TaskContext>() - (4 + 2)
        };

        assert!(context_size % 2 == 0, "Context is not aligned to 2 bytes");

        // let self_bytes: *const u16 = mem::transmute
        // let source = core::slice::from_raw_parts(data, len)
    }
}

extern "C" {
    pub fn switch_context();
}

// #[inline(never)]
// pub unsafe fn switch_context(
//     old: &mut *mut TaskContext,
//     new: *mut TaskContext,
// ) {
//     core::arch::asm! {
//         "push gs",
//         "push fs",
//         "push es",
//         "push ds",
//
//         "pusha",
//
//
//         "mov [eax], esp",
//         "mov esp, edx",
//
//         "pop ebp",
//         "pop edi",
//         "pop esi",
//         "pop ebx",
//
//         in("eax") old,
//         in("edx") new,
//
//         options(nostack)
//     }
// }
