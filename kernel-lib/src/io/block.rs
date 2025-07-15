pub use kernel_types::io::block::*;

use kernel_types::{object::RawHandle, syscall};

//todo: handle hardware and software request
//separately
#[derive(Debug, Clone)]
pub struct Operations {
    pub read: fn(sector: u32, buf: KernelBufMut) -> Result<()>,
    pub write: fn(sector: u32, buf: UserBuf) -> Result<()>,
    pub ioctl: fn(u32) -> Result<()>,
}

use crate::{
    io::Result,
    object::{KernelBufMut, UserBuf},
};

pub fn register_device(device: BlockDeviceInfo) -> Result<()> {
    unsafe {
        syscall! {
            syscall::Request::RegBlockDevice,
            edx: &device
        }?;
    }
    Ok(())
}

pub struct BlockDevice;

impl From<RawHandle> for BlockDevice {
    fn from(_value: RawHandle) -> Self {
        todo!()
    }
}
