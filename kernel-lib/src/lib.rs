#![no_std]

pub mod fs;
pub mod io;

#[cfg(feature = "log")]
pub mod log;

pub mod alloc;
pub mod object;
pub mod string;

pub fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}
