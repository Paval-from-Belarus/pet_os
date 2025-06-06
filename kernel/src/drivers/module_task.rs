use crate::{current_task, task, user};

#[no_mangle]
pub extern "C" fn module_task() {
    log::debug!("Module task is started");

    loop {
        task::sleep(10);
        log::debug!("Module task is awaken");
    }

    let Some(process) = current_task!().process.clone() else {
        task::terminate();
    };

    user::terminate(process.id);
}
