use core::sync::atomic::{AtomicBool, Ordering};

use crate::{
    impl_container,
    memory::AllocError,
    object::{alloc_root_object, runtime, Handle, Object, ObjectContainer},
};

pub struct Event {
    signal: AtomicBool,
    object: Object,
}

impl Event {
    pub fn new() -> Result<Handle<Event>, AllocError> {
        alloc_root_object(Self {
            signal: AtomicBool::new(false),
            object: Self::new_root_object(),
        })
    }

    pub fn set(&self) {
        runtime::critical_section(self.handle(), |event| {
            event.signal.store(true, Ordering::SeqCst);
        });
    }

    pub fn wait(&self) {
        runtime::critical_section(self.handle(), |event| {
            if event.signal.load(Ordering::SeqCst) {
                event.signal.store(false, Ordering::SeqCst);
                return;
            }

            runtime::block_on(event.handle()).unwrap();
        });
    }
}

impl_container! {
    Event,
    obj_kind: Event,
    slab: "event"
}
