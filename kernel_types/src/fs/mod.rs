use crate::{io::block, object::Handle};

mod file;
mod file_op;
mod fs_op;
mod index_node;
mod super_block;

pub use file::*;
pub use file_op::*;
pub use fs_op::*;
pub use index_node::*;
pub use super_block::*;

const MAX_FILE_SYSTEM_NAME: usize = 32;

pub type Result<T> = core::result::Result<T, FsError>;

pub type FnMount = fn(Handle<block::BlockDevice>) -> Result<SuperBlockInfo>;
pub type FnUnmount = fn(Handle<SuperBlock>) -> Result<()>;

#[derive(Debug, thiserror_no_std::Error)]
pub enum FsError {
    #[error("Io operation failed")]
    Io(#[from] crate::io::Error),

    #[cfg(feature = "alloc")]
    #[error("Failed to alloc memory")]
    AllocError(#[from] core::alloc::AllocError),

    #[error("File is not found")]
    NotFound,

    #[error("Operation is not supported")]
    NotSupported,
}

/// user-space structure to register file system
#[repr(C)]
pub struct FileSystem {
    pub name: heapless::String<MAX_FILE_SYSTEM_NAME>,
    pub kind: FileSystemKind,

    pub mount: FnMount,
    pub unmount: FnUnmount,
}

bitflags::bitflags! {
    pub struct FileSystemKind: usize {
        const NORMAL = 0b00;
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
