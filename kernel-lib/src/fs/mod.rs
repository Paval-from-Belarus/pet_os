pub use kernel_types::fs::*;
use kernel_types::{
    io::{KernelBuf, KernelBufMut},
    object::Handle,
};

pub fn register(_fs: FileSystem) -> Result<()> {
    Ok(())
}

pub fn noop_write(_file: Handle<File>, _buf: KernelBuf) -> Result<()> {
    Ok(())
}

pub fn not_supported_write(_file: Handle<File>, _buf: KernelBuf) -> Result<()> {
    Err(FsError::NotSupported)
}

pub fn not_supported_read(
    _file: Handle<File>,
    _buf: KernelBufMut,
) -> Result<()> {
    Err(FsError::NotSupported)
}
