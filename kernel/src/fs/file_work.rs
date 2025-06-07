use kernel_types::{
    container_of,
    io::{KernelBuf, KernelBufMut},
};

use crate::{
    memory::Slab,
    object::{self, Handle, Object, ObjectContainer},
};

use super::IndexNodeItem;

pub struct FileWork {
    pub op: FileOperation,
    object: Object,
}

pub enum FileOperation {
    Command {
        file: Handle<IndexNodeItem>,
        command: usize,
    },
    Read {
        file: Handle<IndexNodeItem>,
        buf: KernelBufMut,
    },
    Write {
        file: Handle<IndexNodeItem>,
        buf: KernelBuf,
    },
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
