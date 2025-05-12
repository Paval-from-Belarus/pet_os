pub use kernel_types::io::block::*;

pub fn register_device(_device: Device) -> Result<(), ()> {
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

pub fn handle_request(_work: Request) -> Result<(), OpError> {
    Err(OpError::NotSupported)
}
