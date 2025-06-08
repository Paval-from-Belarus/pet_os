use crate::{
    from_variant,
    object::{OpStatus, RawHandle},
};

use super::SuperBlockInfo;

pub enum FsRequest {
    Mount { device: RawHandle },
    //super_block
    Unmount { fs: RawHandle },
}

pub enum FsResponse {
    SuperBlockInfo(SuperBlockInfo),
    OpStatus(OpStatus),
}

from_variant!(FsResponse, SuperBlockInfo);
from_variant!(FsResponse, OpStatus);

impl FsResponse {
    pub fn super_block(self) -> Result<SuperBlockInfo, OpStatus> {
        match self {
            FsResponse::SuperBlockInfo(block) => Ok(block),
            FsResponse::OpStatus(status) => Err(status),
        }
    }
}
