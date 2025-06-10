use kernel_types::fs::{FileRequest, FileResponse};

use crate::{
    impl_work,
    object::{Handle, Object},
};

use super::IndexNode;

pub struct FileWork {
    pub request: FileRequest,
    pub inode: Handle<IndexNode>,
    response: spin::Mutex<Option<FileResponse>>,
    object: Object,
}

impl_work! {
    FileWork,
    req: FileRequest,
    res: FileResponse,

    obj_kind: FileWork,
    slab: "file_work",
    args: [inode: Handle<IndexNode>]
}
