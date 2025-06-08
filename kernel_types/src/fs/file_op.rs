use crate::{
    io::{KernelBuf, KernelBufMut},
    object::{OpStatus, RawHandle},
};

use super::NodeId;

pub enum FileRequest {
    Command { file: RawHandle, command: usize },
    Read { file: RawHandle, buf: KernelBufMut },
    Write { file: RawHandle, buf: KernelBuf },
}

pub enum FileResponse {
    File(NodeId),
    Status(OpStatus),
}

impl FileResponse {
    pub fn file(self) -> Result<NodeId, OpStatus> {
        match self {
            FileResponse::File(id) => Ok(id),
            FileResponse::Status(status) => Err(status),
        }
    }
}
