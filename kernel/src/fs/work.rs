use alloc::{boxed::Box, string::String};
use kernel_types::container_of;

use crate::object::{self, Object, ObjectContainer};

use super::FileId;

//handle is the address of object
pub struct FsWork {
    pub work: Work,
    object: Object,
}

impl FsWork {
    pub fn new_boxed(work: Work, parent: object::Handle) -> Box<Self> {
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
}

impl From<&'static mut FsWork> for &'static mut Object {
    fn from(value: &'static mut FsWork) -> Self {
        &mut value.object
    }
}
