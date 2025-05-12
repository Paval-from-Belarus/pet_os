use crate::object;

use super::op::KernelBuffer;

#[derive(Debug)]
pub enum Work {
    Read {
        sector: u32, // Starting sector (LBA)
        buffer: KernelBuffer,
    },
    Write {
        sector: u32, // Starting sector (LBA)
        buffer: KernelBuffer,
    },
    Passthrough {
        cmd: u32, // Command code (e.g., for flush or ioctl)
    },
}

pub struct Request {
    //unique id for device
    pub disk: usize,
    pub work: Work,
}

pub struct Device {
    pub name: &'static str,
    pub sector_size: usize,
    //deseriable queue size
    pub queue_size: usize,
    pub ops: Operations,
}

#[derive(thiserror_no_std::Error)]
pub enum OpError {
    #[error("This operation is not supported")]
    NotSupported,
}

//todo: handle hardware and software request
//separately
pub struct Operations {
    pub open: fn(),
    pub close: fn(),
    pub ioctl: fn(),
    pub request: fn(Request) -> Result<(), OpError>,
}
