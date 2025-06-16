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

fn handle_read(sector: u32, mut buffer: KernelBufMut) -> io::Result<()> {
    assert!(buffer.remaining_capacity() % 512 == 0);

    let sector_count = buffer.remaining_capacity() / 512;

    for i in 0..sector_count {
        let sector = sector + i as u32;
        ide::read_sector(0, 0, sector, &mut buffer)?;
    }

    Ok(())
}

fn handle_write(_sector: u32, _buf: UserBuf) -> io::Result<()> {
    todo!()
}

fn ioctl(_cmd: u32) -> io::Result<()> {
    Err(io::IoError::NotSupported)
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
        block::Operations {
            write: handle_write,
            read: handle_read,
            ioctl,
        }
        .into()
    }
}
