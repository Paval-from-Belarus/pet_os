use crate::{
    impl_container,
    memory::AllocError,
    object::{self, runtime, Handle, Object, ObjectContainer},
};

pub struct Event {
    object: Object,
}

impl Event {
    pub fn new() -> Result<Handle<Self>, AllocError> {
        object::alloc_root_object(Self {
            object: Self::new_root_object(),
        })
    }

    pub fn wait(&self) {
        runtime::block_on(self.handle()).expect("Failed to block on event")
    }

    pub fn notify(&self) {}
}

impl_container! {
    Event,
    obj_kind: Event,
    slab: "event"
}
