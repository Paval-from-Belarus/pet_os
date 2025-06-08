mod file;
mod file_lookup_op;
mod file_op;
mod fs_op;
mod index_node;
mod super_block;

pub use file_lookup_op::*;
pub use file_op::*;
pub use fs_op::*;
pub use index_node::*;
pub use super_block::*;

const MAX_FILE_SYSTEM_NAME: usize = 32;

pub type FsId = usize;

/// user-space structure to register file system
#[repr(C)]
pub struct FileSystem {
    pub name: heapless::String<MAX_FILE_SYSTEM_NAME>,
    pub kind: FileSystemKind,
}

bitflags::bitflags! {
    pub struct FileSystemKind: usize {
        const NORMAL = 0b00;
        const READ_ONLY = 0b01;
    }
}

pub type FileId = u32;

pub struct MountedDevice {
    pub lba_offset: u32,
    pub device_id: u32,
}
