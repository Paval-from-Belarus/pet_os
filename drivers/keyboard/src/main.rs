#![no_std]
#![no_main]

use kernel_lib::io::BlockDevice;

#[no_mangle]
static DRIVER_ID: usize = Driver;

static DEVICE_NAME: &str = "disk";

#[cfg(not(test))]
#[panic_handler]
pub fn panic(info: &core::panic::PanicInfo) -> ! {
    kernel_lib::panic(info)
}

// fn handle_request()

#[export_name = "init"]
extern "C" fn driver_init() -> i32 {
    kernel_lib::log::init().expect("Failed to set logger");

    let Ok(queue) = kernel_lib::io::register_block_device(BlockDevice {
        name: DEVICE_NAME.into(),
        sector_size: 512,
        irq_line: None,
    }) else {
        return -1;
    };

    log::info!("Driver is configured");

    0
}

#[export_name = "init"]
fn driver_exit() {}
