use kernel_types::{container_of, io::block::Request};

use crate::{
    memory::Slab,
    object::{self, ObjectContainer},
};

pub struct BlockWork {
    object: object::Object,
    pub request: Request,
}

impl ObjectContainer for BlockWork {
    const KIND: object::Kind = object::Kind::BlockDeviceWork;

    fn container_of(object: *mut object::Object) -> *mut Self {
        container_of!(object, BlockWork, object)
    }

    fn object(&self) -> &object::Object {
        &self.object
    }

    fn object_mut(&mut self) -> &mut object::Object {
        &mut self.object
    }
}

impl Slab for BlockWork {
    const NAME: &str = "io_work";
}
