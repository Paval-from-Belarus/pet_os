use kernel_types::io::IrqMessage;

use crate::{
    impl_container,
    io::IrqLine,
    memory::{AllocError, SlabBox},
    object::{Handle, Object, ObjectContainer},
    user::queue::Queue,
};

#[derive(Debug)]
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

impl<'a> From<&'a IrqEvent> for IrqMessage {
    fn from(value: &'a IrqEvent) -> Self {
        Self {
            line: value.line.line.into()
        }
    }
}
