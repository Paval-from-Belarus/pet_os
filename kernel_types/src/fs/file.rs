use crate::{
    io::{UserBuf, UserBufMut},
    object::{Handle, KernelObject},
};

use super::{IndexNode, SuperBlock};

#[derive(Debug, Clone)]
#[repr(C)]
pub struct File {
    pub offset: usize,
}

impl File {
    pub fn context<T: Send + Sync>(&self) -> *const T {
        todo!()
    }
}

impl KernelObject for File {}

pub type FnRead =
    fn(Handle<SuperBlock>, Handle<IndexNode>, UserBufMut) -> super::Result<()>;
pub type FnWrite =
    fn(Handle<SuperBlock>, Handle<IndexNode>, UserBuf) -> super::Result<()>;

pub struct FileOperations {
    pub write: FnWrite,
    pub read: FnRead,
}
