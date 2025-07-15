use kernel_types::fs::{FileLookupRequest, FileLookupResponse};

use crate::{
    impl_work,
    object::{runtime, Handle, Object, ObjectContainer},
};

use super::SuperBlock;

pub struct FileLookupWork {
    pub request: spin::Mutex<Option<FileLookupRequest>>,
    pub sb: Handle<SuperBlock>,
    response: spin::Mutex<Option<FileLookupResponse>>,
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

impl FileLookupWork {
    fn dsfas(&self) -> FileLookupResponse {
        runtime::critical_section(self.handle(), |work| loop {
            if let Some(res) = work.response.try_lock().unwrap().take() {
                break res;
            }

            runtime::block_on(work.handle()).unwrap();
        });
        todo!()
    }
}
