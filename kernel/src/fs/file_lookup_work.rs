use kernel_types::fs::{FileLookupRequest, FileLookupResponse};

use crate::{impl_work, object::Object};

pub struct FileLookupWork {
    pub request: FileLookupRequest,
    response: Option<FileLookupResponse>,
    object: Object,
}

impl_work! {
    FileLookupWork,
    req: FileLookupRequest,
    res: FileLookupResponse,

    obj_kind: FileLookupWork,
    slab: "f_lup_work"
}
