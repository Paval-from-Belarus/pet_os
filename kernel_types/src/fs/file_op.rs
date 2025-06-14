use crate::object::{OpStatus, RawHandle};

use super::NodeId;

#[derive(Debug)]
pub enum FileRequest {
    Command { file: RawHandle, command: usize },
    Read { file: RawHandle, buf: RawHandle },
    Write { file: RawHandle, buf: RawHandle },
}

#[derive(Debug)]
pub enum FileResponse {
    File(NodeId),
    Status(OpStatus),
    Completed,
}

impl FileResponse {
    pub fn file(self) -> Result<NodeId, OpStatus> {
        match self {
            FileResponse::File(id) => Ok(id),
            FileResponse::Status(status) => Err(status),
            FileResponse::Completed => Err(OpStatus::InvalidResponse),
        }
    }

    pub fn status(self) -> Result<(), OpStatus> {
        match self {
            FileResponse::File(_) => Err(OpStatus::InvalidResponse),
            FileResponse::Status(status) => Err(status),
            FileResponse::Completed => Ok(()),
        }
    }
}
