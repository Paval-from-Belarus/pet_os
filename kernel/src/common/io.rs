#![allow(dead_code)]

use core::arch::asm;

pub unsafe fn wait() {
    outb(0x80u16, 0); //writing to any unused operation to skip time
}

pub unsafe fn outb(port: u16, value: u8) {
    asm!(
    "out dx, al", in("dx") port, in("al") value,
    options(preserves_flags, nostack));
}

pub unsafe fn outw(port: u16, value: u16) {
    asm!(
    "out dx, ax", in("dx") port, in("ax") value,
    options(preserves_flags, nostack));
}

pub unsafe fn inb(port: u16) -> u8 {
    let value: u8;
    asm!(
    "in al, dx", in("dx") port, out("al") value,
    options(preserves_flags, nostack));
    value
}

pub unsafe fn inw(port: u16) -> u16 {
    let value: u16;
    asm!(
    "in ax, dx", in("dx") port, out("ax") value,
    options(preserves_flags, nostack));
    value
}
