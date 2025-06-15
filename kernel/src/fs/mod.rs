#![allow(unused)]

pub use file::*;
pub use file_lookup_work::*;
pub use file_work::*;
pub use fs_work::*;
pub use index_node::*;
use kernel_types::fs::{
    FileLookupRequest, FileRequest, FileSystem, FsId, FsRequest,
};
use kernel_types::object::RawHandle;
use kernel_types::string::QuickString;
pub use mount_point::*;
pub use path::*;
pub use super_block::*;

use kernel_types::declare_constants;
use kernel_types::drivers::Device;

use crate::common::atomics::UnsafeLazyCell;
use crate::current_task;
use crate::object::{self, Handle, ObjectContainer};
use crate::user::kernel_buf::KernelBuf;
use crate::user::queue::Queue;

mod file;
mod file_lookup_work;
mod file_work;
mod fs_work;
mod index_node;
mod mount_point;
mod path;
mod super_block;
mod system_fs;

use system_fs::SystemMountPoints;

pub type Result<T> = core::result::Result<T, FsError>;
pub type FileId = usize;

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

    #[error("FS is not responding")]
    FsIsDead,

    #[error("Invalid file handle")]
    InvalidFileHandle,

    #[error("The process has reached max files limit")]
    MaxOpenedFiles,

    #[error("Invalid file name")]
    InvalidFileName,
}

declare_constants!(
    pub usize,
    MAX_FILE_NAME_LEN = 255, "The maximal length for file name";
    MAX_FILES_COUNT = 15, "The count of files for process";
);

static FILE_SYSTEMS: UnsafeLazyCell<SystemMountPoints> =
    UnsafeLazyCell::empty();

pub fn init() {
    let fs = SystemMountPoints::new().expect("Failed to creaate mount points");

    FILE_SYSTEMS.set(fs);
}

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
            log::debug!("sending dev-fs mount");

            fs.send_request(FsRequest::Mount {
                device: RawHandle::null(),
            })
        })
        .expect("Failed to mount dev-fs");

    let sb_info = work.wait().unwrap().super_block().unwrap();
    log::debug!("dev fs sb is taken");

    let mount_point = MountPoint::new_boxed(sb_info, "/dev")?;

    let queue = mount_point.queue().into_raw();

    let work = FILE_SYSTEMS
        .fs_by_name("dev-fs", |fs| {
            log::debug!("Sending dev-fs queue");
            fs.send_request(FsRequest::FsQueue { queue })
        })
        .unwrap();

    work.wait().unwrap().status().unwrap();

    log::info!("Mounting dev-fs");

    FILE_SYSTEMS.set_dev_fs(mount_point.into_node());

    Ok(())
}

pub fn mount(path: &str, fs_name: &str, dev_name: &str) -> Result<()> {
    FILE_SYSTEMS.fs_by_name(fs_name.as_ref(), |fs| Ok(()))?;

    Ok(())
}

pub fn resolve(handle: Handle<FileLookupWork>) -> Result<usize> {
    log::debug!("Resolving");

    let Some(res) = handle.wait() else {
        return Err(FsError::FsIsDead);
    };

    let Some(file_index) = current_task!().opened_files.alloc_index() else {
        return Err(FsError::MaxOpenedFiles);
    };

    let inode_info = res.inode().unwrap();

    let sb = handle.sb.clone();

    let file_handle = sb.resolve(inode_info)?;

    current_task!().opened_files.set(file_index, file_handle);

    Ok(file_index)
}

pub fn open<T: AsRef<str>>(path: T) -> Result<Handle<FileLookupWork>> {
    FILE_SYSTEMS.lookup_fs(path, |name, fs| fs.open(name))
}

pub fn read(
    file_handle: usize,
    buf: Handle<KernelBuf>,
) -> Result<object::Handle<FileWork>> {
    let Some(file) = current_task!().opened_files.get(file_handle) else {
        return Err(FsError::InvalidFileHandle);
    };

    let res = FileRequest::Read {
        file: file.handle().into_raw(),
        buf: buf.into_raw(),
    };

    file.send_request(res)
}

pub fn write(
    file_handle: usize,
    buf: Handle<KernelBuf>,
) -> Result<Handle<FileWork>> {
    let Some(file) = current_task!().opened_files.get(file_handle) else {
        return Err(FsError::InvalidFileHandle);
    };

    let req = FileRequest::Write {
        buf: buf.into_raw(),
        file: file.handle().into_raw(),
    };

    file.send_request(req)
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
