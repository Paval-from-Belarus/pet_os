mod ops;
mod file;

const MAX_FILE_SYSTEM_NAME: usize = 32;

/// user-space structure to register file system
#[repr(C)]
pub struct FileSystem {
    pub name: heapless::String<MAX_FILE_SYSTEM_NAME>,
    pub kind: FileSystemKind,
    //the limitation of file system about max file size
    pub max_file_size: Option<usize>,
}

bitflags::bitflags! {
    pub struct FileSystemKind: usize {
        const READ_ONLY = 0b01;
    }
}

pub type FileId = u32;

pub struct Work {
    pub kind: WorkKind,
    pub block_device: FileId,
}

pub enum WorkKind {
    Open {
        name: &'static str,
    },
    Close {
        file: FileId,
    },
    Read {
        file: FileId,
        buffer: *mut u8,
        count: usize,
    },
    Write {
        file: FileId,
        buffer: *const u8,
        count: usize,
    },
}

pub struct MountedDevice {
    pub lba_offset: u32,
    pub device_id: u32,
}

#[derive(Debug, Clone)]
#[repr(C)]
pub struct File {
    pub offset: usize,
}

#[derive(Debug, Clone)]
pub struct IndexNode;

impl File {
    pub fn context<T: Send + Sync>(&self) -> *const T {
        todo!()
    }
}

impl IndexNode {
    pub fn context<T: Send + Sync>(&self) -> *const T {
        todo!()
    }
}
