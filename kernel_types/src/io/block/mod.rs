use crate::io::{KernelBuf, KernelBufMut};

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
}
