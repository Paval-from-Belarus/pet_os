use crate::{
    object::{OperationStatus, RawHandle},
    string::QuickString,
};

use super::{IndexNodeInfo, SuperBlockInfo};

pub enum FsRequest {
    Mount {
        device: RawHandle,
    },

    Unmount {
        fs: RawHandle,
    },

    LookupNode {
        fs: RawHandle,
        file: RawHandle,
        name: QuickString<'static>,
    },

    CreateFile {
        fs: RawHandle,
        file: RawHandle,
        name: QuickString<'static>,
    },

    CreateDirectory {
        fs: RawHandle,
        file: RawHandle,
        name: QuickString<'static>,
    },

    FlushNode {
        fs: RawHandle,
        file: RawHandle,
    },

    DestroyNode {
        fs: RawHandle,
        file: RawHandle,
    },
}

pub enum FsResponse {
    SuperBlock(SuperBlockInfo),
    IndexNode(IndexNodeInfo),
    Status(OperationStatus),
}

impl FsResponse {
    pub fn super_block(self) -> Result<SuperBlockInfo, OperationStatus> {
        match self {
            FsResponse::SuperBlock(block) => Ok(block),
            FsResponse::Status(status) => Err(status),
            FsResponse::IndexNode(_) => Err(OperationStatus::InvalidResponse),
        }
    }

    pub fn index_node(self) -> Result<IndexNodeInfo, OperationStatus> {
        match self {
            FsResponse::IndexNode(node) => Ok(node),
            FsResponse::Status(status) => Err(status),
            FsResponse::SuperBlock(_) => Err(OperationStatus::InvalidResponse),
        }
    }
}
