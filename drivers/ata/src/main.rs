#![no_std]
#![no_main]

mod ide;

use kernel_lib::{
    io::{
        self,
        block::{self, BlockDeviceInfo},
    },
    KernelModule, ModuleError,
};

const DEVICE_NAME: &str = "ata";

kernel_lib::module! {
    module: AtaDriver,
    name: "ata-disk",
}

pub struct AtaDriver {}

fn handle_request(request: block::Request) -> io::Result<()> {
    match request.work {
        block::Work::Read { sector, mut buffer } => {
            assert!(buffer.remaining_capacity() % 512 == 0);

            let sector_count = buffer.remaining_capacity() / 512;

            for i in 0..sector_count {
                let sector = sector + i as u32;
                ide::read_sector(0, request.disk as u8, sector, &mut buffer)?;
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

        block::Work::Passthrough { .. } => Err(io::Error::NotSupported),
    }
}

impl KernelModule for AtaDriver {
    fn init() -> Result<(), ModuleError> {
        kernel_lib::log::init().expect("Failed to set logger");

        block::register_device(BlockDeviceInfo {
            name: DEVICE_NAME.into(),
            sector_size: 512,
            queue_size: 10,
            ops: block::Operations {
                request: handle_request,
                ..block::default_operations()
            },
        })?;

        Ok(())
    }
}

impl Drop for AtaDriver {
    fn drop(&mut self) {}
}

#[export_name = "init"]
extern "C" fn init() -> i32 {
    kernel_lib::log::init().unwrap();

    log::info!("From ata driver");

    0
}

#[export_name = "exit"]
extern "C" fn exit() {}
