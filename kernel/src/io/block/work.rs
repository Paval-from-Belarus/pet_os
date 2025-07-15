use kernel_types::{
    container_of,
    io::block::{Request, Response},
};

use crate::{
    impl_work,
    memory::Slab,
    object::{self, ObjectContainer},
};

pub struct BlockWork {
    pub request: spin::Mutex<Option<Request>>,
    object: object::Object,
    response: spin::Mutex<Option<Response>>,
}

impl_work! {
    BlockWork,
    req: Request,
    res: Response,

    obj_kind: BlockDeviceWork,
    slab: "io_work"
}
