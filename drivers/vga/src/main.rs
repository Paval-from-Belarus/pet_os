#![no_std]
#![no_main]

use kernel_lib::{KernelModule, ModuleError};

kernel_lib::module! {
    module: VgaDriver,
    name: "vga",
}

pub struct VgaDriver {}

impl KernelModule for VgaDriver {
    fn init() -> Result<Self, ModuleError> {
        loop {
            log::info!("From vga driver");
        }

        Ok(Self {})
    }
}
