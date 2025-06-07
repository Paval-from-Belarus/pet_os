use core::mem::MaybeUninit;

use kernel_types::{drivers::Module, syscall};

use crate::process;

pub fn module_task() -> ! {
    let module = match module_info() {
        Ok(module) => module,
        Err(cause) => {
            log::error!("Failed to access module info: {cause:?}");
            process::exit(32);
        }
    };

    loop {}

    process::exit(33);
}

pub fn module_info() -> syscall::Result<Module> {
    let module = unsafe {
        let mut module = MaybeUninit::<Module>::uninit();

        syscall! {
            syscall::Request::GetModuleInfo,
            edx: module.as_mut_ptr()
        }?;

        module.assume_init()
    };

    Ok(module)
}
