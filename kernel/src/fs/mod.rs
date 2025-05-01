use alloc::string::{String};
pub use error::*;
pub use file::*;
pub use index_node::*;
pub use mount_point::*;
pub use super_block::*;
pub use path::*;

use kernel_types::drivers::Device;
use kernel_types::{declare_constants};

use crate::current_task;
use crate::drivers::{BlockDeviceBox, CharDeviceBox};
use crate::object::{self, Object};

mod error;
mod file;
mod index_node;
mod mount_point;
mod path;
mod super_block;
mod system_fs;

use system_fs::SystemMountPoints;

declare_constants!(
    pub usize,
    MAX_FILE_NAME_LEN = 255, "The maximal length for file name";
    MAX_FILES_COUNT = 15, "The count of files for process";
);

bitflags::bitflags! {
    pub struct FileSystemKind: usize {
        const READ_ONLY = 0b01;
    }
}

pub enum NodeState {
    Locked,
}

pub enum DeviceKind {
    BlockDevice(BlockDeviceBox),
    CharDevice(CharDeviceBox),
}

bitflags::bitflags! {
    #[derive(Debug, Clone, Copy)]
    #[repr(C)]
    pub struct NodeKind: usize {
        const FILE = 0x01;
        const BLOCK = 0x02;
        const CHAR = 0x04;
    }
}

static FILE_SYSTEMS: SystemMountPoints = SystemMountPoints::new();

pub fn open<T: AsRef<str>>(path: T) -> object::Handle {
    let (name, fs) = FILE_SYSTEMS.lookup_fs(path);

    fs.super_block().work(Work::Open { name })
}

pub fn read(
    file_handle: usize,
    dest: *mut u8,
    count: usize,
) -> Result<object::Handle, FsError> {
    let Some(file) = current_task!().opened_files.get(file_handle) else {
        return Err(FsError::InvalidFileHandle);
    };

    let op_handle = file.super_block().work(Work::Read {
        file: file.id(),
        buffer: dest,
        count,
    });

    Ok(op_handle)
}

pub fn write(
    file_handle: usize,
    source: *mut u8,
    count: usize,
) -> Result<object::Handle, FsError> {
    let Some(file) = current_task!().opened_files.get(file_handle) else {
        return Err(FsError::InvalidFileHandle);
    };

    let op_handle = file.super_block().work(Work::Write {
        file: file.id(),
        buffer: source,
        count,
    });

    Ok(op_handle)
}

pub fn close(file_handle: usize) -> Result<object::Handle, FsError> {
    let Some(file) = current_task!().opened_files.get(file_handle) else {
        return Err(FsError::InvalidFileHandle);
    };

    let op_handle = file.super_block().work(Work::Close { file: file.id() });

    Ok(op_handle)
}

//handle is the address of object
pub struct WorkObject {
    work: Work,
    object: Object,
}

pub enum Work {
    Open {
        name: String,
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

pub fn init() {}
