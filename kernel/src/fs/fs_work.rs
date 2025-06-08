use kernel_types::{
    container_of,
    fs::{FsRequest, FsResponse},
};

use crate::{
    memory::{slab_alloc, AllocError, Slab, SlabBox},
    object::{self, Object, ObjectContainer},
    user::queue::Queue,
};

//handle is the address of object
pub struct FsWork {
    pub request: FsRequest,
    pub response: Option<FsResponse>,
    object: Object,
}

impl FsWork {
    pub fn new_boxed(
        request: FsRequest,
        parent: &object::Handle<Queue<FsWork>>,
    ) -> Result<SlabBox<Self>, AllocError> {
        let object = Self::new_object(parent);

        slab_alloc(Self {
            request,
            response: None,
            object,
        })
    }

    pub fn exchange(&self) -> Option<FsResponse> {
        todo!()
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
