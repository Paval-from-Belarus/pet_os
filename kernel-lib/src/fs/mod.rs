mod file;
mod index_node;

pub use index_node::*;
pub use kernel_types::fs::*;
use kernel_types::object::{KernelObject, RawHandle};

use crate::{
    io::block::BlockDevice,
    object::{UserBuf, UserBufMut},
};

#[derive(Debug, thiserror_no_std::Error)]
pub enum FsError {
    #[error("Not supported")]
    NotSupported,
}

pub type Result<T> = core::result::Result<T, FsError>;

// pub type FnMount = fn(Handle<block::BlockDevice>) -> Result<SuperBlockInfo>;
// pub type FnUnmount = fn(Handle<SuperBlock>) -> Result<()>;

pub fn register(_fs: FileSystem) -> Result<()> {
    Ok(())
}

pub fn noop_write(_file: File, _buf: UserBuf) -> Result<()> {
    Ok(())
}

pub fn not_supported_write(_file: File, _buf: UserBuf) -> Result<()> {
    Err(FsError::NotSupported)
}

pub fn not_supported_read(_file: File, _buf: UserBufMut) -> Result<()> {
    Err(FsError::NotSupported)
}

pub struct SuperBlock {}

// pub type FnLookup = fn(
//     Handle<SuperBlock>,
//     Handle<IndexNode>,
//     QuickString<'_>,
// ) -> Result<IndexNodeInfo>;

// pub type FnFlush = fn(Handle<SuperBlock>, Handle<IndexNode>) -> Result<()>;

#[repr(C)]
pub struct SuperBlockOperations {
    // pub lookup_node: FnLookup,
    // pub create_file: FnLookup,

    // pub create_directory: FnLookup,
    //
    // //mark the node as dirty because its data was modified
    // //this method also flush changes on the disk
    // pub flush_node: FnFlush,
    // pub destroy_node: FnFlush,
}

impl From<RawHandle> for SuperBlock {
    fn from(_: RawHandle) -> Self {
        todo!()
    }
}

impl KernelObject for SuperBlock {}

impl SuperBlock {
    pub fn context<T: Send + Sync>(&self) -> *const T {
        todo!()
    }

    pub fn disk(&self) -> BlockDevice {
        todo!()
    }
}

#[derive(Debug)]
#[repr(C)]
pub struct File {
    pub offset: usize,
    pub handle: RawHandle,
}

impl File {
    pub fn context<T: Send + Sync>(&self) -> *const T {
        todo!()
    }
}

impl From<RawHandle> for File {
    fn from(_value: RawHandle) -> Self {
        todo!()
    }
}

impl KernelObject for File {}

pub type FnRead = fn(File, UserBufMut) -> Result<()>;
pub type FnWrite = fn(File, UserBuf) -> Result<()>;

pub struct FileOperations {
    pub write: FnWrite,
    pub read: FnRead,
}
