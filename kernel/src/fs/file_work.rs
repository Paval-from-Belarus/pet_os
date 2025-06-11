use kernel_types::fs::{FileRequest, FileResponse};

use crate::{
    impl_work,
    object::{Handle, Object},
};

use super::IndexNode;

pub struct FileWork {
    pub request: spin::Mutex<Option<FileRequest>>,
    response: spin::Mutex<Option<FileResponse>>,
    object: Object,
}

impl_work! {
    FileWork,
    req: FileRequest,
    res: FileResponse,

    obj_kind: FileWork,
    slab: "file_work"
}
