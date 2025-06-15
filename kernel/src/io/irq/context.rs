use core::ops::DerefMut;

use alloc::sync::Arc;
use kernel_types::{
    collections::LinkedList, drivers::ModuleId, io::IoOperation,
};

use crate::{
    drivers::current_module,
    error::KernelError,
    io::{InterruptableLazyCell, IrqLine},
    memory::{self, SlabBox},
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
    queue: Handle<Queue<IrqEvent>>,

    //the list of reserved irq events
    reserved_events: InterruptableLazyCell<LinkedList<'static, Object>>,
}

#[derive(Debug, thiserror_no_std::Error)]
pub enum ContextError {
    #[error("Queue is busy")]
    QueueIsBusy,
    #[error("Kernel alloc failed: {0}")]
    AllocFailed(#[from] crate::memory::AllocError),
    #[error("Rust alloc failed: {0}")]
    RustAllocFailed(#[from] alloc::alloc::AllocError),
}

const RESERVED_EVENTS_COUNT: usize = 20;

impl ModuleIrqContext {
    pub fn new(
        line: IrqLine,
        hook: Option<IoOperation>,
        queue: Handle<Queue<IrqEvent>>,
    ) -> Result<Arc<ModuleIrqContext>, KernelError> {
        let Some(module) = current_module() else {
            return Err(KernelError::NotModule);
        };

        let mut reserved_events = LinkedList::empty();

        for _ in 0..RESERVED_EVENTS_COUNT {
            let event = IrqEvent::new_detached(line)?;
            let event = unsafe { &mut *SlabBox::into_raw(event) };
            reserved_events.push_back(event.object_mut());
        }

        let ctx = Arc::try_new(Self {
            line,
            reserved_events: InterruptableLazyCell::new(reserved_events),
            queue,
            hook_op: hook,
            module_id: module.id,
        })?;

        Ok(ctx)
    }

    pub fn notify(&self) -> Result<(), ContextError> {
        assert!(memory::is_irq_context());

        let mut events = self.reserved_events.lock();

        let mut maybe_event = events.remove_first().map(|obj_event| unsafe {
            let event = IrqEvent::container_of(obj_event.deref_mut());

            memory::into_boxed((&mut *event).into())
        });

        if let Some(event) = maybe_event.as_mut() {
            event.attach_to_parent(&self.queue);
        }

        if maybe_event.is_none() {
            maybe_event = Some(IrqEvent::new_boxed(self.line, &self.queue)?);
        }

        let event = maybe_event.expect("Should be initialized");

        if let Err(cause) = self.queue.try_push(event) {
            log::warn!("Failed to push irq event: {cause:?}");
            return Err(ContextError::QueueIsBusy);
        }

        log::info!("irq event pushed");

        Ok(())
    }

    pub fn restore_event(&self, event: SlabBox<IrqEvent>) {
        let mut events = self.reserved_events.lock();

        let raw_event = SlabBox::into_raw(event);

        let event = unsafe { &mut *raw_event };

        events.push_front(event.object_mut());
    }
}
