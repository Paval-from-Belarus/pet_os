use kernel_types::{container_of, fs::FileOperation};

use crate::{
    memory::Slab,
    object::{self, Object, ObjectContainer},
};

pub struct FileWork {
    pub op: FileOperation,
    object: Object,
}

impl Slab for FileWork {
    const NAME: &str = "file_work";
}

impl ObjectContainer for FileWork {
    const KIND: object::Kind = object::Kind::FileWork;

    fn container_of(object: *mut Object) -> *mut Self {
        container_of!(object, FileWork, object)
    }

    fn object(&self) -> &Object {
        &self.object
    }

    fn object_mut(&mut self) -> &mut Object {
        &mut self.object
    }
}
