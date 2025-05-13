use kernel_types::container_of;

use crate::{
    memory::Slab,
    object::{self, ObjectContainer},
};

pub use kernel_types::io::block::Work;

pub struct IoWork {
    object: object::Object,
    pub work: Work,
}

impl ObjectContainer for IoWork {
    const KIND: object::Kind = object::Kind::IoWork;

    fn container_of(object: *mut object::Object) -> *mut Self {
        container_of!(object, IoWork, object)
    }

    fn object(&self) -> &object::Object {
        &self.object
    }

    fn object_mut(&mut self) -> &mut object::Object {
        &mut self.object
    }
}

impl Slab for IoWork {
    const NAME: &str = "io_work";
}
