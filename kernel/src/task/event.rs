use crate::{
    impl_container,
    memory::AllocError,
    object::{alloc_root_object, Handle, Object, ObjectContainer},
};

pub struct Event {
    object: Object,
}

impl Event {
    pub fn new() -> Result<Handle<Event>, AllocError> {
        alloc_root_object(Self {
            object: Self::new_root_object(),
        })
    }
}

impl_container! {
    Event,
    obj_kind: Event,
    slab: "event"
}
