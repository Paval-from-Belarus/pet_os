use crate::object::{KernelObject, RawHandle};

use super::{FileId, FileOperations};

pub struct IndexNode {
    handle: RawHandle,
}
pub struct IndexNodeInfo {
    pub ops: FileOperations,
}

impl IndexNode {
    pub fn id(&self) -> FileId {
        todo!()
    }

    pub fn context<T: Send + Sync>(&self) -> *const T {
        todo!()
    }
}

impl From<RawHandle> for IndexNode {
    fn from(value: RawHandle) -> Self {
        Self { handle: value }
    }
}

impl KernelObject for IndexNode {}
