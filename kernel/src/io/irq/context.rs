use core::ops::DerefMut;

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
    reserved_events: spin::Mutex<LinkedList<'static, Object>>,
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
            reserved_events: spin::Mutex::new(reserved_events),
            queue,
            hook_op: hook,
            module_id: module.id,
        })?;

        Ok(ctx)
    }

    pub fn notify(&self) -> Result<(), KernelError> {
        assert!(memory::is_irq_context());

        let mut events = self.reserved_events.try_lock().unwrap();

        let mut maybe_event =
            events.remove_first().and_then(|obj_event| unsafe {
                let event = IrqEvent::container_of(obj_event.deref_mut());

                let _ = obj_event;

                Some(memory::into_boxed((&mut *event).into()))
            });

        if let Some(event) = maybe_event.as_mut() {
            event.attach_to_parent(&self.queue);
        }

        if maybe_event.is_none() {
            maybe_event = Some(IrqEvent::new_boxed(self.line, &self.queue)?);
        }

        let event = maybe_event.expect("Should be initialized");

        self.queue.push(event);

        Ok(())
    }
}
