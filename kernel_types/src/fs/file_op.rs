use crate::{
    io::{KernelBuf, KernelBufMut},
    object::{OpStatus, RawHandle},
};

use super::FileId;

pub enum FileRequest {
    Command { file: RawHandle, command: usize },
    Read { file: RawHandle, buf: KernelBufMut },
    Write { file: RawHandle, buf: KernelBuf },
}

pub enum FileResponse {
    File(FileId),
    Status(OpStatus),
}

impl FileResponse {
    pub fn file(self) -> Result<FileId, OpStatus> {
        match self {
            FileResponse::File(id) => Ok(id),
            FileResponse::Status(status) => Err(status),
        }
    }
}
