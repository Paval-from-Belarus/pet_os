use crate::{
    from_variant,
    object::{OpStatus, RawHandle},
};

use super::NodeId;

#[derive(Debug)]
pub enum FileRequest {
    Command { file: RawHandle, command: u32 },
    Read { file: RawHandle, buf: RawHandle },
    Write { file: RawHandle, buf: RawHandle },
}

#[derive(Debug, Clone)]
pub enum FileResponse {
    File(NodeId),
    OpStatus(OpStatus),
    Completed,
}

from_variant!(FileResponse, OpStatus);

impl FileResponse {
    pub fn file(self) -> Result<NodeId, OpStatus> {
        match self {
            FileResponse::File(id) => Ok(id),
            FileResponse::OpStatus(status) => Err(status),
            FileResponse::Completed => Err(OpStatus::InvalidResponse),
        }
    }

    pub fn status(self) -> Result<(), OpStatus> {
        match self {
            FileResponse::File(_) => Err(OpStatus::InvalidResponse),
            FileResponse::OpStatus(status) => Err(status),
            FileResponse::Completed => Ok(()),
        }
    }
}
