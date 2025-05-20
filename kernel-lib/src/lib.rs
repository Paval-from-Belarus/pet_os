#![no_std]

pub mod fs;
pub mod io;

#[cfg(feature = "log")]
pub mod log;

pub mod alloc;
pub mod object;
pub mod string;

#[cfg(not(test))]
#[panic_handler]
pub fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}

#[macro_export]
macro_rules! module {
    (
        module: $ty:ty,
        name: $name:literal,
    ) => {};
}

#[derive(Debug)]
pub enum ModuleError {}

impl From<io::Error> for ModuleError {
    fn from(_value: io::Error) -> Self {
        todo!()
    }
}

impl From<fs::FsError> for ModuleError {
    fn from(_value: fs::FsError) -> Self {
        todo!()
    }
}

#[allow(drop_bounds)]
pub trait KernelModule: Drop {
    fn init() -> Result<(), ModuleError>;
}
