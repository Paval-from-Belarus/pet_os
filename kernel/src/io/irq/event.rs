use crate::{
    impl_container,
    io::IrqLine,
    memory::{AllocError, SlabBox},
    object::{alloc_root_object, runtime, Handle, Object, ObjectContainer},
    user::queue::Queue,
};

pub struct IrqEvent {
    pub line: IrqLine,
    object: Object,
}

impl IrqEvent {
    pub fn new_detached(line: IrqLine) -> Result<SlabBox<Self>, AllocError> {
        crate::memory::slab_alloc(Self {
            line,
            object: Self::new_root_object(),
        })
    }
    pub fn new_boxed(
        line: IrqLine,
        parent: &Handle<Queue<IrqEvent>>,
    ) -> Result<SlabBox<Self>, AllocError> {
        crate::memory::slab_alloc(Self {
            object: Self::new_object(parent),
            line,
        })
    }
}

impl_container! {
    IrqEvent,
    obj_kind: IrqEvent,
    slab: "irq_event"
}
