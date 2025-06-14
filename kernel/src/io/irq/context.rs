use alloc::boxed::Box;
use kernel_types::{
    collections::LinkedList, drivers::ModuleId, io::IoOperation,
};

use crate::{
    drivers::current_module,
    error::KernelError,
    io::IrqLine,
    memory::{self, AllocError, SlabBox},
    object::{Handle, Object, ObjectContainer},
    user::queue::Queue,
};

use super::IrqEvent;

pub struct ModuleIrqContext {
    pub module_id: ModuleId,
    pub hook_op: Option<IoOperation>,
    pub line: IrqLine,
    //that's safe to handle in interrupt
    //as nested interrupts are not allowed
    pub queue: Handle<Queue<IrqEvent>>,

    //the list of reserved irq events
    reserved_events: LinkedList<'static, Object>,
}

const RESERVED_EVENTS_COUNT: usize = 5;

impl ModuleIrqContext {
    pub fn new_boxed(
        line: IrqLine,
        hook: Option<IoOperation>,
        queue: Handle<Queue<IrqEvent>>,
    ) -> Result<Box<ModuleIrqContext>, KernelError> {
        let Some(module) = current_module() else {
            return Err(KernelError::NotModule);
        };

        let mut reserved_events = LinkedList::empty();

        for _ in 0..RESERVED_EVENTS_COUNT {
            let event = IrqEvent::new_detached(line)?;
            let event = unsafe { &mut *SlabBox::into_raw(event) };
            reserved_events.push_back(event.object_mut());
        }

        let ctx = Box::try_new(Self {
            line,
            reserved_events,
            queue,
            hook_op: hook,
            module_id: module.id,
        })?;

        Ok(ctx)
    }
}
