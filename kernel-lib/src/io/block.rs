pub use kernel_types::io::block::*;

use kernel_types::{
    object::{KernelObject, RawHandle},
    syscall,
};

//todo: handle hardware and software request
//separately
#[derive(Debug, Clone)]
pub struct Operations {
    pub open: fn(),
    pub close: fn(),
    pub ioctl: fn(),
    pub request: fn(Request) -> Result<()>,
}

use crate::io::Result;

use super::IoError;

pub fn register_device(device: BlockDeviceInfo) -> Result<()> {
    unsafe {
        syscall! {
            syscall::Request::RegBlockDevice,
            edx: &device
        }?;
    }
    Ok(())
}

pub fn default_operations() -> Operations {
    Operations {
        request: handle_request,
        open: handle_open,
        close: handle_close,
        ioctl: handle_ioctl,
    }
}

pub fn handle_ioctl() {}

pub fn handle_open() {}

pub fn handle_close() {}

pub fn handle_request(_work: Request) -> Result<()> {
    Err(IoError::NotSupported)
}

pub struct BlockDevice;

impl From<RawHandle> for BlockDevice {
    fn from(_value: RawHandle) -> Self {
        todo!()
    }
}

impl KernelObject for BlockDevice {}

impl BlockDevice {
    pub fn sector_size(&self) -> usize {
        512
    }

    pub fn read_sector(
        &self,
        _offset: usize,
        _buffer: &mut [u8],
        // ) -> Result<IoEvent> {
    ) -> Result<()> {
        todo!()
    }
}
