use kernel_types::{
    io::{
        block::BlockDeviceInfo, char::CharDeviceInfo, IoOperation, MemoryRemap,
    },
    string::MutString,
    syscall::{Request, SyscallError},
};

use crate::{
    current_task, drivers, io, log_module,
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

pub fn handle(
    request: Request,
    edx: usize,
    ecx: usize,
) -> Result<(), SyscallError> {
    match request {
        Request::PrintK => {
            let string: &MutString = validate_ref(edx)?;

            log_module!("{string}");
        }
        Request::MemRemap => {
            let remap = validate_ref::<MemoryRemap>(edx)?;

            let Some(process) = current_task!().process.clone() else {
                return Err(SyscallError::KernelSpaceCall);
            };

            let remap = remap.clone();

            unsafe { memory::switch_to_kernel() };

            memory::remap(&process, remap.into())
                .inspect_err(|cause| log::warn!("Failed to remap: {cause}"))?;

            unsafe { memory::switch_to_task(current_task!()) };
            // let state = procces.state.try_lock().unwrap();
            // state.find_region(remap.virtual_start)

            // procces.state
        }
        Request::RegBlockDevice => {
            let blk_dev = validate_ref::<BlockDeviceInfo>(edx)?.clone();

            unsafe { memory::switch_to_kernel() };

            drivers::api::reg_blk_dev(&blk_dev)?;

            unsafe { memory::switch_to_task(current_task!()) };
        }
        Request::RegCharDevice => {
            let chr_dev = validate_ref::<CharDeviceInfo>(edx)?.clone();

            unsafe { memory::switch_to_kernel() };

            drivers::api::reg_chr_dev(&chr_dev)?;

            unsafe { memory::switch_to_task(current_task!()) };
        }
        Request::IoOperation => {
            let len = ecx;
            let _ = validate_ref::<IoOperation>(edx)?;

            let ops = unsafe {
                core::slice::from_raw_parts(edx as *const IoOperation, len)
            };

            io::start_op_tx();

            for op in ops.iter() {
                unsafe { io::interpretate_op(op) };
            }

            io::end_op_tx();
        }
    }

    Ok(())
}

impl From<AllocError> for SyscallError {
    fn from(_value: AllocError) -> Self {
        SyscallError::NoMemory
    }
}
