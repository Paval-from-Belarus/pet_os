mod chain;
mod context;
mod event;

pub use chain::*;
pub use context::ModuleIrqContext;
pub use event::IrqEvent;

use crate::{
    drivers::ModuleId,
    io::{interpretate_op, pic},
    task::TaskContext,
};

fn start_irq(_module_id: ModuleId) {
    todo!()
}

fn complete_irq(_module_id: ModuleId) {}

pub fn module_irq(
    _is_processed: bool,
    context: *const (),
    _frame: &mut *mut TaskContext,
) -> bool {
    assert!(!context.is_null());

    let context = unsafe { &*(context as *const ModuleIrqContext) };

    start_irq(context.module_id);

    if let Err(cause) = context.notify() {
        log::warn!("Failed to notify process via irq: {cause}");
    }

    pic::complete(context.line.into());
    complete_irq(context.module_id);

    true
}
