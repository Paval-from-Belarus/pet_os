#![allow(unused)]

use core::mem::{self, offset_of};

use kernel_types::Zeroed;
use static_assertions::const_assert_eq;

use crate::{current_task, memory::VirtualAddress, task::SCHEDULER};

use super::TASK_STACK_SIZE;

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
#[repr(C, packed)]
#[derive(Default, Clone, Debug)]
pub struct TaskContext {
    //registers saved via pusha
    pub edi: u32,
    pub esi: u32,
    pub ebp: u32,
    //value for esp should be used
    //to restore esp after popa
    pub esp: u32,
    pub ebx: u32,
    pub edx: u32,
    pub ecx: u32,
    pub eax: u32,

    //segment registers
    pub gs: u16,
    _reserved_1: Zeroed<u16>,
    pub fs: u16,
    _reserved_2: Zeroed<u16>,
    pub es: u16,
    _reserved_3: Zeroed<u16>,

    pub ds: u16,
    _reserved_4: Zeroed<u16>,

    //previous
    pub eip: VirtualAddress,

    //interrupt handling fields
    pub cs: u16,
    _reserved_5: Zeroed<u16>,
    pub eflags: u32,

    //saved during kernel-space user-space switching
    //but also duplicate kernel during switching
    pub user_esp: VirtualAddress,
    pub user_ss: u16,
    _reserved_6: Zeroed<u16>,
}

#[no_mangle]
pub unsafe extern "C" fn prepare_task() {
    // log::debug!("Prepare task#{}", current_task!().id);

    let context = &*current_task!().context_ptr();

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
        let context_size = self.size();

        unsafe {
            let source = self as *const TaskContext as *const u8;
            let target = context as *mut TaskContext as *mut u8;

            target.copy_from(source, context_size);
        }
    }

    //size in bytes
    pub const fn size(&self) -> usize {
        if self.is_user_space_context() {
            mem::size_of::<TaskContext>()
        } else {
            //skip user_esp and user_ss
            mem::size_of::<TaskContext>() - (4 + 4)
        }
    }

    pub const fn is_user_space_context(&self) -> bool {
        self.cs & 0x03 == 0x03
    }

    pub fn is_kernel_space_context(&self) -> bool {
        !self.is_user_space_context()
    }
}

extern "C" {
    pub fn switch_context();
}
