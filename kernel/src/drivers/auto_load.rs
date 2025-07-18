use crate::{
    current_task,
    error::KernelError,
    task::{self, TaskPriority},
};

pub fn spawn_task() -> Result<(), KernelError> {
    let task_handle = task::new_task(
        autoload_task,
        core::ptr::null_mut(),
        TaskPriority::Kernel,
    )?;

    task::submit_task(task_handle);

    Ok(())
}

extern "C" fn autoload_task(_arg: *const ()) {
    log::debug!("Autoload task#{} started", current_task!().id);

    loop {
        task::sleep(300);
        log::debug!("Autoload task");
    }
}
