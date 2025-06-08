#![allow(unused)]

pub use file::*;
pub use file_work::*;
pub use fs_work::*;
pub use index_node::*;
use kernel_types::fs::{FileSystem, FsId, FsRequest};
use kernel_types::object::RawHandle;
pub use mount_point::*;
pub use path::*;
pub use super_block::*;

use kernel_types::declare_constants;
use kernel_types::drivers::Device;

use crate::current_task;
use crate::object::{self, Handle};
use crate::user::queue::Queue;

mod file;
mod file_work;
mod fs_work;
mod index_node;
mod mount_point;
mod path;
mod super_block;
mod system_fs;

use system_fs::SystemMountPoints;

pub type Result<T> = core::result::Result<T, FsError>;

#[derive(Debug, thiserror_no_std::Error)]
pub enum FsError {
    #[error("Failed to alloc memory")]
    AllocError(#[from] core::alloc::AllocError),

    #[error("Out of memory: {0}")]
    NoMemory(#[from] crate::memory::AllocError),

    #[error("File is not found")]
    NotFound,

    #[error("Operation is not supported")]
    NotSupported,

    #[error("Invalid file handle")]
    InvalidFileHandle,
}

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

pub fn register_fs(fs: FileSystem) -> Result<FsId> {
    let fs_id = FILE_SYSTEMS.register(fs)?;

    Ok(fs_id)
}

pub fn fs_queue(id: FsId) -> Option<Handle<Queue<FsWork>>> {
    FILE_SYSTEMS.fs_queue(id)
}

pub fn unregister_fs(id: FsId) -> Result<()> {
    FILE_SYSTEMS.unregister(id)
}

pub unsafe fn mount_dev_fs() -> Result<()> {
    let work = FILE_SYSTEMS
        .fs_by_name("dev-fs", move |fs| {
            fs.send_request(FsRequest::Mount {
                device: RawHandle::null(),
            })
        })
        .expect("Failed to mount dev-fs");

    let sb_info = work.exchange().unwrap().super_block().unwrap();

    let sb = SuperBlock::new_boxed(sb_info)?;

    let mount_point = MountPoint::new_boxed(sb)?;

    FILE_SYSTEMS.set_dev_fs(mount_point.into_node());

    Ok(())
}

pub fn mount(path: &str, fs_name: &str, dev_name: &str) -> Result<()> {
    FILE_SYSTEMS.fs_by_name(fs_name.as_ref(), |fs| Ok(()))?;

    Ok(())
}

pub fn open<T: AsRef<str>>(path: T) -> object::Handle<FsWork> {
    let (name, fs) = FILE_SYSTEMS.lookup_fs(path);
    todo!()
}

pub fn read(
    file_handle: usize,
    _dest: *mut u8,
    _count: usize,
) -> Result<object::Handle<FileWork>> {
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
) -> Result<object::RawHandle> {
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

pub fn close(file_handle: usize) -> Result<object::RawHandle> {
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
