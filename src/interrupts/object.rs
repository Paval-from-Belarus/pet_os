use core::arch::asm;
use crate::interrupts::InterruptStackFrame;
use crate::memory;

pub struct InterruptHandler {}

pub struct InterruptChainHandler {}

extern "x86-interrupt" fn dispatch(frame: &mut InterruptStackFrame) {
    unsafe { enter_kernel_trap() };

    unsafe { leave_kernel_trap() };
}

extern "x86-interrupt" fn dispatch_with_error_code(frame: &mut InterruptStackFrame, error_code: usize) {
    unsafe { enter_kernel_trap() };

    unsafe { leave_kernel_trap() };
}

unsafe fn enter_kernel_trap() {
    asm!(
    "push es",
    "push ds",
    "push fs",
    "push gs",
    "pusha",
    "push ax", //save ax from future changing
    options(preserves_flags));
    asm!(
    "mov ds, ax",
    "mov es, ax",
    "pop ax",
    in("ax") u16::from(memory::SegmentSelector::DATA),
    options(preserves_flags));
}

unsafe fn leave_kernel_trap() {
    asm!(
    "popa",
    "pop gs",
    "pop fs",
    "pop ds",
    "pop es",
    options(preserves_flags));
}