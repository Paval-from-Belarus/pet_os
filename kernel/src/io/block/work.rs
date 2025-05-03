use kernel_types::container_of;

use crate::object::{self, ObjectContainer};

pub struct WorkObject {
    object: object::Object,
    pub work: Work,
}

#[derive(Debug, Clone)]
pub enum Work {
    Read {
        sector: u64,       // Starting sector (LBA)
        sector_count: u32, // Number of sectors to read
        buffer: *mut u8,   // Data buffer (raw pointer for simplicity)
    },
    Write {
        sector: u64,       // Starting sector (LBA)
        sector_count: u32, // Number of sectors to write
        buffer: *const u8, // Data buffer (read-only for write)
    },
    Passthrough {
        cmd: u32, // Command code (e.g., for flush or ioctl)
    },
}

impl ObjectContainer for WorkObject {
    const KIND: object::Kind = object::Kind::IoWork;

    fn container_of(object: *mut object::Object) -> *mut Self {
        container_of!(object, WorkObject, object)
    }

    fn object(&self) -> &object::Object {
        &self.object
    }
}
