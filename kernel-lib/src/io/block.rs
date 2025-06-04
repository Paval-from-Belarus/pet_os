pub use kernel_types::io::block::*;

use kernel_types::{
    io::{Error, Result},
    syscall,
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
    Err(Error::NotSupported)
}
