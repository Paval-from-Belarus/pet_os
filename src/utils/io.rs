#![allow(dead_code)]

use core::arch::asm;

pub unsafe fn outb(port: u16, value: u8) {
    asm!(
    "out dx, al",
    in("dx") port,
    in("al")value,
    options(preserves_flags, nomem, nostack));
}

pub unsafe fn inb(port: u16) -> u8 {
    let value: u8;
    asm!(
    "in al, dx",
    in("dx") port,
    out("al")value,
    options(preserves_flags, nomem, nostack));
    value
}