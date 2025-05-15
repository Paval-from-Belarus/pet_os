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

#[macro_export]
macro_rules! module {
    ($name: expr) => {
        #[link_section = ".modinfo"]
        #[used]
        pub static MODINFO_NAME: [u8; $name.len()] = *$name;
    };
}
