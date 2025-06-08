use kernel_types::fs::{FileLookupRequest, FileLookupResponse};

use crate::{
    impl_work,
    object::{Handle, Object},
};

use super::SuperBlock;

pub struct FileLookupWork {
    pub request: FileLookupRequest,
    pub sb: Handle<SuperBlock>,
    response: Option<FileLookupResponse>,
    object: Object,
}

impl_work! {
    FileLookupWork,
    req: FileLookupRequest,
    res: FileLookupResponse,

    obj_kind: FileLookupWork,
    slab: "f_lup_work",
    args: [sb: Handle<SuperBlock> ]
}
