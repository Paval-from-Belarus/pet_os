mod file;
mod file_lookup_op;
mod file_op;
mod fs_op;
mod index_node;
mod super_block;

pub use file::*;
pub use file_lookup_op::*;
pub use file_op::*;
pub use fs_op::*;
pub use index_node::*;
pub use super_block::*;

use crate::{object::RawHandle, syscall};

const MAX_FILE_SYSTEM_NAME: usize = 32;

pub type FsId = usize;

#[repr(C)]
pub struct Work<T> {
    pub request: Option<T>,
    pub handle: RawHandle,
}

impl<T> Work<T> {
    pub fn send_response<K>(&self, response: K) -> syscall::Result<()> {
        unsafe {
            syscall! {
                syscall::Request::SetWorkResponse,
                ecx: &response,
                edx: self.handle.syscall()
            }?;
        }

        Ok(())
    }
}

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

pub type NodeId = u32;

pub struct MountedDevice {
    pub lba_offset: u32,
    pub device_id: u32,
}
