use crate::{
    from_variant,
    object::{OpStatus, RawHandle},
};

#[derive(Debug)]
pub enum Work {
    Read {
        sector: u32,       // Starting sector (LBA)
        buffer: RawHandle, //read buffer
    },
    Write {
        sector: u32, // Starting sector (LBA)
        buffer: RawHandle,
    },
    Passthrough {
        cmd: u32, // Command code (e.g., for flush or ioctl)
    },
}

#[derive(Debug)]
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

#[derive(Debug, Clone)]
pub enum Response {
    Completed,
    OpStatus(OpStatus),
}

impl Response {
    pub fn status(self) -> Result<(), OpStatus> {
        match self {
            Response::Completed => Ok(()),
            Response::OpStatus(status) => Err(status),
        }
    }
}

from_variant!(Response, OpStatus);
