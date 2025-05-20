use crate::object::KernelObject;

use super::{FileId, FileOperations};

pub struct IndexNode {}
pub struct IndexNodeInfo {
    pub ops: FileOperations
}

impl IndexNode {
    pub fn id(&self) -> FileId {
        todo!()
    }

    pub fn context<T: Send + Sync>(&self) -> *const T {
        todo!()
    }
}

impl KernelObject for IndexNode {}
