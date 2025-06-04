mod device;

use crate::io::{Error, KernelBuf, KernelBufMut};
pub use device::*;

#[derive(Debug)]
pub enum Work {
    Read {
        sector: u32, // Starting sector (LBA)
        buffer: KernelBufMut,
    },
    Write {
        sector: u32, // Starting sector (LBA)
        buffer: KernelBuf,
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

#[derive(Debug, Clone)]
pub struct BlockDeviceInfo {
    pub name: heapless::String<12>,
    pub sector_size: usize,
    //deseriable queue size
    pub queue_size: usize,
    pub ops: Operations,
}

//todo: handle hardware and software request
//separately
#[derive(Debug, Clone)]
pub struct Operations {
    pub open: fn(),
    pub close: fn(),
    pub ioctl: fn(),
    pub request: fn(Request) -> Result<(), Error>,
}
