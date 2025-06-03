use kernel_types::{
    io::MemoryRemap,
    string::MutString,
    syscall::{Request, SyscallError},
};

use crate::{
    current_task, get_edx, log_module,
    memory::{self, AllocError, VirtualAddress},
};

pub fn validate_ref<'a, T: Sized>(
    offset: VirtualAddress,
) -> Result<&'a T, SyscallError> {
    let ptr = offset as *const T;

    if ptr.is_null() {
        return Err(SyscallError::InvalidData);
    }

    Ok(unsafe { &*ptr })
}

pub fn handle(request: Request) -> Result<(), SyscallError> {
    match request {
        Request::PrintK => {
            let string: &MutString = unsafe {
                let ptr = get_edx!();
                validate_ref(ptr)?
            };

            log_module!("{string}");
        }

        Request::MemRemap => {
            let remap: &MemoryRemap = unsafe {
                let ptr = get_edx!();
                validate_ref(ptr)?
            };

            let Some(process) = current_task!().process.clone() else {
                return Err(SyscallError::KernelSpaceCall);
            };

            memory::remap(&process, remap.into())?;

            // let state = procces.state.try_lock().unwrap();
            // state.find_region(remap.virtual_start)

            // procces.state
        }
    }

    Ok(())
}

impl From<AllocError> for SyscallError {
    fn from(_value: AllocError) -> Self {
        SyscallError::NoMemory
    }
}
