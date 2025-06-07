use kernel_types::{
    drivers::UserModule,
    fs::{FileOperation, FsOperation},
    io::{
        block::BlockDeviceInfo, char::CharDeviceInfo, IoOperation, MemoryRemap,
    },
    string::MutString,
    syscall::{Request, SyscallError},
};

use crate::{
    current_task, drivers,
    fs::{File, FileWork, FsWork},
    io::{
        self,
        block::{self, WorkObject},
        IrqEvent, IrqLine,
    },
    log_module,
    memory::{self, AllocError, SlabBox, VirtualAddress},
    object::{AnyObject, Handle, Object, ObjectContainer},
    task, user,
};

use super::queue::Queue;

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

        Request::RegFs => {}

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

        Request::GetModuleInfo => {
            let ptr = edx as *mut UserModule;

            unsafe { memory::switch_to_kernel() };

            let Some(module) = drivers::current_module() else {
                return Err(SyscallError::ModuleIsNotFound);
            };

            let module = module.as_user_module();

            unsafe { memory::switch_to_task(current_task!()) };

            unsafe { *ptr = module };
        }

        Request::TerminateCurrentTask => {
            task::terminate(edx as i32);
        }

        Request::TerminateCurrentProcess => {
            user::exit(edx as i32);
        }

        Request::QueueBlockingGet => {
            unsafe { memory::switch_to_kernel() };

            let queue: Handle<Queue<AnyObject>> =
                Handle::from_raw(ecx).unwrap();

            match queue.kind() {
                crate::object::Kind::BlockDeviceWork => unsafe {
                    blocking_pop(&queue, |work: WorkObject| {
                        memory::switch_to_task(current_task!());
                        let ptr = edx as *mut block::Request;
                        *ptr = work.request;
                    })?;
                },
                crate::object::Kind::FsWork => unsafe {
                    blocking_pop(&queue, |work: FsWork| {
                        memory::switch_to_task(current_task!());
                        let ptr = edx as *mut FsOperation;
                        *ptr = work.op;
                    })?;
                },
                crate::object::Kind::FileWork => unsafe {
                    blocking_pop(&queue, |work: FileWork| {
                        memory::switch_to_task(current_task!());
                        let ptr = edx as *mut FileOperation;
                        *ptr = work.op;
                    })?;
                },
                crate::object::Kind::IrqEvent => unsafe {
                    blocking_pop(&queue, |event: IrqEvent| {
                        memory::switch_to_task(current_task!());
                        let ptr = edx as *mut IrqLine;
                        *ptr = event.line;
                    })?;
                },
                _ => {
                    return Err(SyscallError::InvalidQueueKind);
                }
            }
        }

        Request::FreeKernelObject => unsafe {
            let raw_object = edx as *const Object;
            let raw_handle = edx;
            let kind = (*raw_object).kind;

            match kind {
                crate::object::Kind::BlockDeviceWork => {
                    let _ = Handle::<block::WorkObject>::from_raw_unchecked(
                        raw_handle,
                    );
                }
                crate::object::Kind::FsWork => {
                    let _ = Handle::<FsWork>::from_raw_unchecked(raw_handle);
                }
                crate::object::Kind::FileWork => {
                    let _ = Handle::<FileWork>::from_raw_unchecked(raw_handle);
                }
                crate::object::Kind::IrqEvent => {
                    let _ = Handle::<IrqEvent>::from_raw_unchecked(raw_handle);
                }
                crate::object::Kind::File => {
                    let _ = Handle::<File>::from_raw_unchecked(raw_handle);
                }

                crate::object::Kind::Queue => {
                    let _ = Handle::<Queue<AnyObject>>::from_raw_unchecked(
                        raw_handle,
                    );
                }

                crate::object::Kind::Mutex => todo!(),
                crate::object::Kind::Exchange => todo!(),
            }
        },
        Request::QueueTryGet => todo!(),
    }

    Ok(())
}

impl From<AllocError> for SyscallError {
    fn from(_value: AllocError) -> Self {
        SyscallError::NoMemory
    }
}
unsafe fn blocking_pop<T: ObjectContainer, F: FnMut(T)>(
    queue: &Queue<AnyObject>,
    mut op: F,
) -> Result<(), SyscallError> {
    let Some(data) = queue.cast::<T>().blocking_pop() else {
        return Err(SyscallError::QueueIsEmpty);
    };

    op(*data);

    Ok(())
}
