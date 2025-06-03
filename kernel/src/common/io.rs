#![allow(dead_code)]

use core::arch::asm;

#[macro_export]
macro_rules! get_eax {
    () => ({
        let value;
        core::arch::asm!(
          "",
          out("eax") value,
          options(preserves_flags, nomem, nostack)
        );
        value
    });
}

#[macro_export]
macro_rules! set_eax {
    ($value : expr) => ({
        core::arch::asm!(
          "",
          in("eax") $value,
          options(preserves_flags, nomem, nostack)
        );
    });
}

#[macro_export]
macro_rules! get_edx {
    () => ({
        let value;
        core::arch::asm!(
          "",
          out("edx") value,
          options(preserves_flags, nomem, nostack)
        );
        value
    });
}

#[macro_export]
macro_rules! set_edx {
    ($value : expr) => ({
        core::arch::asm!(
          "",
          in("edx") $value,
          options(preserves_flags, nomem, nostack)
        );
    });
}

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
