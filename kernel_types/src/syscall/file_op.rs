use crate::{fs::FileRequest, object::RawHandle};

#[repr(C)]
pub struct FileOperation {
    pub request: FileRequest,
    pub file: RawHandle,
}

