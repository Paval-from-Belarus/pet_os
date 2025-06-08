#![allow(unused)]
use crate::{
    from_variant,
    object::{OpStatus, RawHandle},
    string::QuickString,
};

use super::IndexNodeInfo;

pub enum FileLookupRequest {
    LookupNode {
        fs: RawHandle,
        name: alloc::string::String,
    },

    CreateFile {
        fs: RawHandle,
        name: QuickString<'static>,
    },

    CreateDirectory {
        fs: RawHandle,
        name: QuickString<'static>,
    },

    FlushNode {
        file: RawHandle,
    },

    DestroyNode {
        file: RawHandle,
    },
}

pub enum FileLookupResponse {
    IndexNodeInfo(IndexNodeInfo),
    Completed,
    OpStatus(OpStatus),
}

from_variant!(FileLookupResponse, IndexNodeInfo);

impl FileLookupResponse {
    pub fn inode(self) -> Result<IndexNodeInfo, OpStatus> {
        match self {
            FileLookupResponse::IndexNodeInfo(node) => Ok(node),
            FileLookupResponse::Completed => Err(OpStatus::InvalidResponse),
            FileLookupResponse::OpStatus(status) => Err(status),
        }
    }

    pub fn status(self) -> Result<(), OpStatus> {
        match self {
            FileLookupResponse::IndexNodeInfo(_) => {
                Err(OpStatus::InvalidResponse)
            }
            FileLookupResponse::Completed => Ok(()),
            FileLookupResponse::OpStatus(status) => Err(status),
        }
    }
}
