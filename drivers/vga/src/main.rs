#![no_std]
#![no_main]

use kernel_lib::{
    io::{
        self,
    },
    KernelModule, ModuleError,
};

kernel_lib::module! {
    module: VgaDriver,
    name: "vga",
}

pub struct VgaDriver {}

impl KernelModule for VgaDriver {
    fn init() -> Result<(), ModuleError> {
        Ok(())
    }
}

impl Drop for VgaDriver {
    fn drop(&mut self) {}
}

#[export_name = "init"]
extern "C" fn init() -> i32 {
    kernel_lib::logging::init().unwrap();

    loop {
        log::info!("From vga driver");
    }
}

#[export_name = "exit"]
extern "C" fn exit() {}
