mod chain;
mod context;
mod event;

use core::sync::atomic::AtomicUsize;

pub use chain::*;
pub use context::ModuleIrqContext;
pub use event::IrqEvent;

use crate::{
    drivers::ModuleId,
    io::{interpretate_op, pic},
    task::TaskContext,
};

pub fn current_irq_module() -> Option<ModuleId> {
    todo!()
}

static IRQ_MODULE: AtomicUsize = AtomicUsize::new(0);

fn start_irq(module_id: ModuleId) {
    IRQ_MODULE.store(module_id, core::sync::atomic::Ordering::SeqCst);
}

fn complete_irq() {
    IRQ_MODULE.store(0, core::sync::atomic::Ordering::SeqCst);
}

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

    if let Some(op) = context.hook_op.as_ref() {
        unsafe { interpretate_op(op) };
    }

    pic::complete(context.line.into());
    complete_irq();

    true
}
