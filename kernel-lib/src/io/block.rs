pub use kernel_types::io::block::*;

use kernel_types::{
    object::{KernelObject, RawHandle},
    syscall,
};

//todo: handle hardware and software request
//separately
#[derive(Debug, Clone)]
pub struct Operations {
    read: fn(sector: u32, buf: KernelBufMut),
    write: fn(sector: u32, buf: UserBuf),
    ioctl: fn(u32),
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

pub fn handle_ioctl() {}

pub fn handle_open() {}

pub fn handle_close() {}

pub struct BlockDevice;

impl From<RawHandle> for BlockDevice {
    fn from(_value: RawHandle) -> Self {
        todo!()
    }
}
