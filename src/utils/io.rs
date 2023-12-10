#![allow(dead_code)]

use core::arch::asm;
use crate::utils::io;
#[macro_export]
macro_rules! syscall {
    ($syscall_id:expr $(, eax: $eax:expr)? $(, ecx: $ecx:expr)? $(, edx: $edx:expr)?) => {
        println!("Syscall_id: {}", $syscall_id);
        $(println!("eax: {}", $eax);)?
        $(println!("ecx: {}", $ecx);)?
        $(println!("edx: {}", $edx);)?
    };
}

pub unsafe fn wait() {
    outb(0x80u16, 0); //writing to any unused operation to skip time
}

pub unsafe fn outb(port: u16, value: u8) {
    asm!(
    "out dx, al", in("dx") port, in("al") value,
    options(preserves_flags, nomem, nostack));
}

pub unsafe fn outw(port: u16, value: u16) {
    asm!(
    "out dx, ax", in("dx") port, in("ax") value,
    options(preserves_flags, nomem, nostack));
}

pub unsafe fn inb(port: u16) -> u8 {
    let value: u8;
    asm!(
    "in al, dx", in("dx") port, out("al") value,
    options(preserves_flags, nomem, nostack));
    value
}

pub unsafe fn inw(port: u16) -> u16 {
    let value: u16;
    asm!(
    "in ax, dx", in("dx") port, out("ax") value,
    options(preserves_flags, nomem, nostack));
    value
}