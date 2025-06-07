#![allow(unused)]

pub use error::*;
pub use file::*;
pub use file_work::*;
pub use fs_work::*;
pub use index_node::*;
use kernel_types::fs::{FileSystem, FsOperation};
pub use mount_point::*;
pub use path::*;
pub use super_block::*;

use kernel_types::declare_constants;
use kernel_types::drivers::Device;

use crate::current_task;
use crate::object::{self};

mod error;
mod file;
mod file_work;
mod fs_work;
mod index_node;
mod mount_point;
mod path;
mod super_block;
mod system_fs;

use system_fs::{FileSystemId, SystemMountPoints};

declare_constants!(
    pub usize,
    MAX_FILE_NAME_LEN = 255, "The maximal length for file name";
    MAX_FILES_COUNT = 15, "The count of files for process";
);

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

pub fn init() {}

pub fn register_fs(fs: FileSystem) -> Result<FileSystemId, ()> {
    let fs_id = FILE_SYSTEMS.register(fs)?;

    Ok(fs_id)
}

pub fn fs_queue(id: FileSystemId) -> Result<object::RawHandle, ()> {
    match FILE_SYSTEMS.fs_queue(id) {
        Some(h) => Ok(h),
        None => Err(()),
    }
}

pub fn unregister_fs(id: FileSystemId) -> Result<(), ()> {
    FILE_SYSTEMS.unregister(id)
}

pub fn open<T: AsRef<str>>(path: T) -> object::RawHandle {
    let (name, fs) = FILE_SYSTEMS.lookup_fs(path);

    fs.super_block().work(FsOperation::Open { name }).into_raw()
}

pub fn read(
    file_handle: usize,
    _dest: *mut u8,
    _count: usize,
) -> Result<object::RawHandle, FsError> {
    let Some(_file) = current_task!().opened_files.get(file_handle) else {
        return Err(FsError::InvalidFileHandle);
    };

    // let op_handle = file.super_block().work(Fileo::Read {
    //     file: file.id(),
    //     buffer: dest,
    //     count,
    // });

    // Ok(op_handle.as_raw())
    todo!()
}

pub fn write(
    file_handle: usize,
    _source: *const u8,
    _count: usize,
) -> Result<object::RawHandle, FsError> {
    let Some(_file) = current_task!().opened_files.get(file_handle) else {
        return Err(FsError::InvalidFileHandle);
    };
    todo!()

    // let op_handle = file.super_block().work(FsOperation::Write {
    //     file: file.id(),
    //     buffer: source,
    //     count,
    // });
    //
    // Ok(op_handle.as_raw())
}

pub fn close(file_handle: usize) -> Result<object::RawHandle, FsError> {
    let Some(_file) = current_task!().opened_files.get(file_handle) else {
        return Err(FsError::InvalidFileHandle);
    };
    todo!()

    // let op_handle = file
    //     .super_block()
    //     .work(FsOperation::Close { file: file.id() });
    //
    // Ok(op_handle.as_raw())
}
