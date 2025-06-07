use kernel_types::container_of;

use crate::{
    io::IrqLine,
    memory::{Alignment, AllocContext, AllocError, Slab, SlabBox},
    object::{Handle, Kind, Object, ObjectContainer},
    user::queue::Queue,
};

pub struct IrqEvent {
    pub line: IrqLine,
    object: Object,
}

impl IrqEvent {
    pub fn new_boxed(
        line: IrqLine,
        parent: &Handle<Queue<IrqEvent>>,
    ) -> Result<SlabBox<Self>, AllocError> {
        crate::memory::slab_alloc(Self {
            line,
            object: Self::new_object(parent),
        })
    }
}

impl ObjectContainer for IrqEvent {
    const KIND: Kind = Kind::IrqEvent;

    fn container_of(object: *mut Object) -> *mut Self {
        container_of!(object, IrqEvent, object)
    }

    fn object(&self) -> &Object {
        &self.object
    }

    fn object_mut(&mut self) -> &mut Object {
        &mut self.object
    }
}

impl Slab for IrqEvent {
    const NAME: &str = "irq_event";
    const ALIGNMENT: Alignment = Alignment::Word;
    const CONTEXT: AllocContext = AllocContext::Interrupt;
}
