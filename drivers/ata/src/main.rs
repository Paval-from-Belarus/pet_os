#![no_std]
#![no_main]

mod ide;

use kernel_lib::io::block::{self, OpError};

#[no_mangle]
static DRIVER_ID: usize = 0;

const DEVICE_NAME: &str = "disk";

#[cfg(not(test))]
#[panic_handler]
pub fn panic(info: &core::panic::PanicInfo) -> ! {
    kernel_lib::panic(info)
}

fn handle_request(request: block::Request) -> Result<(), OpError> {
    match request.work {
        block::Work::Read { sector, mut buffer } => {
            assert!(buffer.size() % 512 == 0);

            let sector_count = buffer.size() / 512;

            for i in 0..sector_count {
                let sector = sector + i as u32;
                ide::read_sector(0, request.disk as u8, sector, &buffer)?;

                buffer.move_bytes(512).unwrap();
            }

            Ok(())
        }
        block::Work::Write { sector, mut buffer } => {
            assert!(buffer.size() % 512 == 0);

            let sector_count = buffer.size() / 512;

            for i in 0..sector_count {
                let sector = sector + i as u32;
                ide::write_sector(0, request.disk as u8, sector, &buffer)?;

                buffer.move_bytes(512).unwrap();
            }

            Ok(())
        }

        block::Work::Passthrough { .. } => Err(OpError::NotSupported),
    }
}

#[export_name = "init"]
extern "C" fn init() -> i32 {
    kernel_lib::log::init().expect("Failed to set logger");

    let Ok(()) = block::register_device(block::Device {
        name: DEVICE_NAME.into(),
        sector_size: 512,
        queue_size: 10,
        ops: block::Operations {
            request: handle_request,
            ..block::default_operations()
        },
    }) else {
        return -1;
    };

    log::info!("Driver is configured");

    0
}
