use crate::{
    current_task,
    drivers::{current_module, ModuleOperations},
    fs::FileOperation,
    memory, task, user,
};

#[no_mangle]
pub extern "C" fn module_task() {
    let Some(module) = current_module() else {
        log::warn!("Failed to lookup module for module task");
        terminate_module();
    };

    log::debug!("Module task is started");

    loop {
        assert!(memory::address_space().is_user());

        match &module.ops {
            ModuleOperations::CharDeviceModule(module) => {
                let Some(event) = module.queue.blocking_pop() else {
                    break;
                };

                let event = *event;

                unsafe { memory::switch_to_task(current_task!()) };

                start_module_tx();

                match event.op {
                    FileOperation::Read { file, buf } => {
                        let read = module.ops.read;
                    }

                    FileOperation::Write { file, buf } => {}

                    FileOperation::Command { file, command } => {}
                }

                end_module_tx();
            }
        }
        log::debug!("Module task is awaken");
    }

    terminate_module()
}

fn terminate_module() -> ! {
    unsafe { memory::switch_to_kernel() };

    let Some(process) = current_task!().process.clone() else {
        task::terminate();
    };

    user::terminate(process.id);
}

//go to user space
fn start_module_tx() {
    unsafe {
        memory::switch_to_task(current_task!());
        core::arch::asm! {
            "push (3 shl 3) or 3",
            "pop cs"
        }
    }
}

fn end_module_tx() {}
