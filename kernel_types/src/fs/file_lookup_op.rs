#![allow(unused)]
use alloc::{string::String, vec::Vec};

use crate::{
    from_variant,
    object::{OpStatus, RawHandle},
    string::QuickString,
};

use super::IndexNodeInfo;

pub enum FileLookupRequest {
    LookupNode {
        sb: RawHandle,
        name: alloc::string::String,
    },

    DirectoryEnries {
        sb: RawHandle,
        name: alloc::string::String,
    },

    CreateFile {
        sb: RawHandle,
        name: String,
    },

    CreateDirectory {
        sb: RawHandle,
        name: String,
    },

    FlushNode {
        sb: RawHandle,
        file: RawHandle,
    },

    DestroyNode {
        sb: RawHandle,
        file: RawHandle,
    },
}

pub struct DirEntriesInfo {
    pub entries: Vec<String>,
}

pub enum FileLookupResponse {
    IndexNodeInfo(IndexNodeInfo),
    DirEntriesInfo(DirEntriesInfo),
    Completed,
    OpStatus(OpStatus),
}

from_variant!(FileLookupResponse, IndexNodeInfo);
from_variant!(FileLookupResponse, DirEntriesInfo);
from_variant!(FileLookupResponse, OpStatus);

impl FileLookupResponse {
    pub fn inode(self) -> Result<IndexNodeInfo, OpStatus> {
        match self {
            FileLookupResponse::IndexNodeInfo(node) => Ok(node),
            FileLookupResponse::Completed => Err(OpStatus::InvalidResponse),
            FileLookupResponse::OpStatus(status) => Err(status),
            FileLookupResponse::DirEntriesInfo(_) => {
                Err(OpStatus::InvalidResponse)
            }
        }
    }

    pub fn status(self) -> Result<(), OpStatus> {
        match self {
            FileLookupResponse::IndexNodeInfo(_) => {
                Err(OpStatus::InvalidResponse)
            }
            FileLookupResponse::Completed => Ok(()),
            FileLookupResponse::OpStatus(status) => Err(status),
            FileLookupResponse::DirEntriesInfo(_) => {
                Err(OpStatus::InvalidResponse)
            }
        }
    }

    pub fn dir_entries(self) -> Result<DirEntriesInfo, OpStatus> {
        match self {
            FileLookupResponse::IndexNodeInfo(_) => {
                Err(OpStatus::InvalidResponse)
            }
            FileLookupResponse::Completed => Err(OpStatus::InvalidResponse),
            FileLookupResponse::OpStatus(status) => Err(status),
            FileLookupResponse::DirEntriesInfo(entries) => Ok(entries),
        }
    }
}
