use crate::{
    from_variant,
    object::{OpStatus, RawHandle},
};

use super::SuperBlockInfo;

#[derive(Debug)]
pub enum FsRequest {
    Mount { device: RawHandle },
    //super_block
    Unmount { fs: RawHandle },

    FsQueue { queue: RawHandle },
}

#[derive(Debug)]
pub enum FsResponse {
    SuperBlockInfo(SuperBlockInfo),
    OpStatus(OpStatus),
    Completed,
}

from_variant!(FsResponse, SuperBlockInfo);
from_variant!(FsResponse, OpStatus);

impl FsResponse {
    pub fn super_block(self) -> Result<SuperBlockInfo, OpStatus> {
        match self {
            FsResponse::SuperBlockInfo(block) => Ok(block),
            FsResponse::OpStatus(status) => Err(status),
            FsResponse::Completed => Err(OpStatus::InvalidResponse),
        }
    }

    pub fn status(self) -> Result<(), OpStatus> {
        match self {
            FsResponse::SuperBlockInfo(_) => Err(OpStatus::InvalidResponse),
            FsResponse::OpStatus(status) => Err(status),
            FsResponse::Completed => Ok(()),
        }
    }
}
