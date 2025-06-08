use kernel_types::fs::{FileRequest, FileResponse};

use crate::{impl_work, object::Object};

pub struct FileWork {
    pub request: FileRequest,
    response: Option<FileResponse>,
    object: Object,
}

impl_work! {
    FileWork,
    req: FileRequest,
    res: FileResponse,

    obj_kind: FileWork,
    slab: "file_work"
}
