use alloc::string::String;
use kernel_types::container_of;

use crate::object::{self, Object, ObjectContainer};

use super::FileId;

//handle is the address of object
pub struct WorkObject {
    work: Work,
    object: Object,
}

impl WorkObject {
    pub fn new(work: Work) -> Self {
        Self {
            work,
            object: Object::new_in_progress(object::Kind::FsWork),
        }
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

impl ObjectContainer for WorkObject {
    fn container_of(object: *const Object) -> *const Self {
        container_of!(object, WorkObject, object)
    }
}
