use kernel_types::{
    container_of,
    fs::{FileRequest, FileResponse},
};

use crate::{
    memory::{slab_alloc, AllocError, Slab, SlabBox},
    object::{self, Handle, Object, ObjectContainer},
    user::queue::Queue,
};

pub struct FileWork {
    pub request: FileRequest,
    pub response: Option<FileResponse>,
    object: Object,
}

impl FileWork {
    pub fn new_boxed(
        request: FileRequest,
        parent: &Handle<Queue<FileWork>>,
    ) -> Result<SlabBox<Self>, AllocError> {
        slab_alloc(Self {
            request,
            response: None,
            object: Self::new_object(parent),
        })
    }
}

impl FileWork {
    pub fn exchange(&self) -> Option<FileResponse> {
        todo!()
    }
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
