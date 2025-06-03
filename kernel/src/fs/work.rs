use alloc::{boxed::Box, string::String};
use kernel_types::container_of;

use crate::{
    memory::Slab,
    object::{self, Object, ObjectContainer},
    user::queue::Queue,
};

use super::FileId;

//handle is the address of object
pub struct FsWork {
    pub work: Work,
    object: Object,
}

impl FsWork {
    pub fn new_boxed(
        work: Work,
        parent: &object::Handle<Queue<FsWork>>,
    ) -> Box<Self> {
        let object = Self::new_object(parent);

        Box::new(Self { work, object })
    }
}

pub enum Work {
    Open {
        name: String,
    },
    Close {
        file: FileId,
    },
    Read {
        file: FileId,
        buffer: *mut u8,
        count: usize,
    },
    Write {
        file: FileId,
        buffer: *const u8,
        count: usize,
    },
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
