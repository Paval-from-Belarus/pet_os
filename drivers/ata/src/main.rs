#![no_std]
#![no_main]

mod ide;

use kernel_lib::{
    io::{
        self,
        block::{self, BlockDeviceInfo},
    },
    object::{KernelBufMut, UserBuf},
    KernelModule, ModuleError,
};

const DEVICE_NAME: &str = "ata";

kernel_lib::module! {
    module: AtaDriver,
    name: "ata-disk",
}

pub struct AtaDriver;

fn handle_request(request: block::Request) -> io::Result<()> {
    match request.work {
        block::Work::Read { sector, mut buffer } => {}

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

fn read(sector: u32, mut buffer: KernelBufMut) -> io::Result<()> {
    assert!(buffer.remaining_capacity() % 512 == 0);

    let sector_count = buffer.remaining_capacity() / 512;

    for i in 0..sector_count {
        let sector = sector + i as u32;
        ide::read_sector(0, 0, sector, &mut buffer)?;
    }

    Ok(())
}

fn write(sector: u32, buf: UserBuf) -> io::Result<()> {}

fn ioctl(cmd: u32) -> io::Result<()> {
    todo!()
}

impl KernelModule for AtaDriver {
    fn init() -> Result<Self, ModuleError> {
        let _ = block::register_device(BlockDeviceInfo {
            name: DEVICE_NAME.into(),
            sector_size: 512,
            queue_size: 10,
        });

        log::info!("Ata driver is initialized");

        Ok(Self)
    }

    fn ops() -> kernel_lib::ModuleOperations {
        block::Operations { write, read, ioctl }.into()
    }
}
