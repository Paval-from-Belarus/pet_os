use kernel_types::{container_of, io::block::BlockDeviceOperation};

use crate::{
    memory::Slab,
    object::{self, ObjectContainer},
};

pub struct WorkObject {
    object: object::Object,
    pub work: BlockDeviceOperation,
}

impl ObjectContainer for WorkObject {
    const KIND: object::Kind = object::Kind::IoWork;

    fn container_of(object: *mut object::Object) -> *mut Self {
        container_of!(object, WorkObject, object)
    }

    fn object(&self) -> &object::Object {
        &self.object
    }

    fn object_mut(&mut self) -> &mut object::Object {
        &mut self.object
    }
}

impl Slab for WorkObject {
    const NAME: &str = "io_work";
}
