use crate::{
    fs,
    io::{KernelBuf, KernelBufMut},
    object::{Handle, KernelObject, RawHandle},
};

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

pub type FnRead = fn(Handle<File>, KernelBufMut) -> fs::Result<()>;
pub type FnWrite = fn(Handle<File>, KernelBuf) -> fs::Result<()>;

pub struct FileOperations {
    pub write: FnWrite,
    pub read: FnRead,
}
