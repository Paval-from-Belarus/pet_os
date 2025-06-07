use alloc::boxed::Box;
use kernel_types::{container_of, fs::FsOperation};

use crate::{
    memory::Slab,
    object::{self, Object, ObjectContainer},
    user::queue::Queue,
};

//handle is the address of object
pub struct FsWork {
    pub op: FsOperation,
    object: Object,
}

impl FsWork {
    pub fn new_boxed(
        work: FsOperation,
        parent: &object::Handle<Queue<FsWork>>,
    ) -> Box<Self> {
        let object = Self::new_object(parent);

        Box::new(Self { op: work, object })
    }
}

impl ObjectContainer for FsWork {
    const KIND: object::Kind = object::Kind::FsWork;

    fn container_of(object: *mut Object) -> *mut Self {
        container_of!(object, FsWork, object)
    }

    fn object(&self) -> &Object {
        &self.object
    }

    fn object_mut(&mut self) -> &mut Object {
        &mut self.object
    }
}

impl Slab for FsWork {
    const NAME: &str = "fs_work";
}
