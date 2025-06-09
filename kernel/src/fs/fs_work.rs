use kernel_types::fs::{FsRequest, FsResponse};

use crate::{impl_work, object::Object};

//handle is the address of object
pub struct FsWork {
    pub request: FsRequest,
    response: spin::Mutex<Option<FsResponse>>,
    object: Object,
}

impl_work! {
    FsWork,
    req: FsRequest,
    res: FsResponse,

    obj_kind: FsWork,
    slab: "fs_work"
}
