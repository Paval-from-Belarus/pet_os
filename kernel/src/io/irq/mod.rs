mod chain;
mod event;
mod hook;

pub use chain::*;
pub use event::IrqEvent;
pub use hook::*;

use crate::{
    drivers::ModuleId, io::pic, object::Handle, task::TaskContext,
    user::queue::Queue,
};

use super::IrqLine;

pub struct ModuleIrqContext {
    pub module_id: ModuleId,
    pub hook_op: Option<HookOperation>,
    pub line: IrqLine,
    //that's safe to handle in interrupt
    //as nested interrupts are not allowed
    pub queue: Handle<Queue<IrqEvent>>,
}

fn start_irq(_module_id: ModuleId) {
    todo!()
}

fn complete_irq(_module_id: ModuleId) {}

pub fn module_irq(
    _is_processed: bool,
    context: *mut (),
    _frame: &mut *mut TaskContext,
) -> bool {
    assert!(!context.is_null());

    let context = unsafe { &*(context as *const ModuleIrqContext) };

    start_irq(context.module_id);

    let Ok(event) = IrqEvent::new_boxed(context.line, &context.queue) else {
        log::error!("Failed to alloc memory for irq event");
        pic::complete(context.line.into());
        complete_irq(context.module_id);
        return true;
    };

    if let Some(hook_op) = context.hook_op {
        unsafe { hook::handle_irq(hook_op) };
    }

    if context.queue.try_push(event).is_err() {
        log::error!(
            "Module queue is full. Event is suppressed: {:?}",
            context.line
        );
    }

    pic::complete(context.line.into());

    complete_irq(context.module_id);

    true
}
