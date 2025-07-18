use alloc::boxed::Box;
use kernel_types::{
    drivers::UserModule,
    fs::{
        FileInfo, FileLookupRequest, FileRequest, FileResponse, FsRequest, Work,
    },
    io::{
        block::BlockDeviceInfo, char::CharModuleInfo, IoOperation, IrqHandler,
        IrqMessage, MemBuf, MemoryRemap,
    },
    string::MutString,
    syscall::{Request, SyscallError},
    task::TaskParams,
};

use crate::{
    current_task,
    drivers::{self, current_module, run_process_task},
    fs::{FileLookupWork, FileWork, FsWork, IndexNode},
    io::{
        self,
        block::{self, BlockWork},
        pic::PicLine,
        IrqEvent,
    },
    log_module,
    memory::{self, AllocError, VirtualAddress},
    object::{runtime, AnyObject, Handle, Object, ObjectContainer, UserHandle},
    task::{self, Event, MutexObject, TaskPriority},
    user,
};

use super::{kernel_buf::KernelBuf, queue::Queue};

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

            log_module!("M! {string}");
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

            drivers::api::reg_blk_module(&blk_dev)?;

            unsafe { memory::switch_to_task(current_task!()) };
        }
        Request::RegCharDevice => {
            let chr_dev = validate_ref::<CharModuleInfo>(edx)?.clone();

            unsafe { memory::switch_to_kernel() };

            drivers::api::reg_chr_module(&chr_dev)?;

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

            unsafe { ptr.write(module) };
        }
        Request::TerminateCurrentTask => {
            task::terminate(edx as i32);
        }
        Request::TerminateCurrentProcess => {
            user::exit(edx as i32);
        }
        Request::QueueBlockingGet => {
            unsafe { memory::switch_to_kernel() };

            let queue: UserHandle<Queue<AnyObject>> =
                unsafe { UserHandle::from_addr_unchecked(ecx) };

            match queue.kind() {
                crate::object::Kind::BlockDeviceWork => unsafe {
                    blocking_pop(&queue, |work: Handle<BlockWork>| {
                        let request = work.take_request().into();

                        let user_work = Work {
                            request,
                            handle: work.into_raw(),
                        };

                        memory::switch_to_task(current_task!());

                        let ptr = edx as *mut Work<block::Request>;

                        ptr.write(user_work);
                    })?;
                },
                crate::object::Kind::FsWork => unsafe {
                    blocking_pop(&queue, |work: Handle<FsWork>| {
                        let request = work.take_request().into();

                        let user_work = Work {
                            handle: work.into_raw(),
                            request,
                        };

                        memory::switch_to_task(current_task!());

                        let ptr = edx as *mut Work<FsRequest>;

                        ptr.write(user_work);
                    })?;
                },

                crate::object::Kind::FileLookupWork => unsafe {
                    blocking_pop(&queue, |work: Handle<FileLookupWork>| {
                        let request = work.take_request().into();

                        let user_work = Work {
                            request,
                            handle: work.into_raw(),
                        };

                        memory::switch_to_task(current_task!());

                        let ptr = edx as *mut Work<FileLookupRequest>;

                        ptr.write(user_work);
                    })?;
                },

                crate::object::Kind::FileWork => unsafe {
                    blocking_pop(&queue, |work: Handle<FileWork>| {
                        let request = work.take_request().into();

                        log::debug!("File Work: {request:?}");

                        let user_work = Work {
                            handle: work.into_raw(),
                            request,
                        };

                        memory::switch_to_task(current_task!());

                        let ptr = edx as *mut Work<FileRequest>;

                        ptr.write(user_work);
                    })?;
                },

                crate::object::Kind::IrqEvent => unsafe {
                    log::debug!(
                        "task !!. Stack size before: {}. ESP= 0x{:x?}",
                        current_task!().stack_size(),
                        unsafe { current_task!().context().esp }
                    );

                    let Some(handle) = queue.cast::<IrqEvent>().blocking_pop()
                    else {
                        return Err(SyscallError::QueueIsEmpty);
                    };

                    log::debug!(
                        "task !!. Stack size after: {}. ESP = 0x{:x?}",
                        current_task!().stack_size(),
                        unsafe { current_task!().context().esp }
                    );

                    let event = handle.into_owned().unwrap();
                    let message = (&*event).into();

                    let module = current_module().unwrap();

                    let irq_ctx = module.irq_ctx().unwrap();

                    irq_ctx.restore_event(event);

                    memory::switch_to_task(current_task!());

                    log::debug!(
                        "task !!. Stack size somewhere: {}. ESP = 0x{:x?}",
                        current_task!().stack_size(),
                        unsafe { current_task!().context().esp }
                    );

                    let ptr = edx as *mut IrqMessage;

                    ptr.write(message);
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
                    let _ = Handle::<block::BlockWork>::from_addr_unchecked(
                        raw_handle,
                    );
                }
                crate::object::Kind::FsWork => {
                    let _ = Handle::<FsWork>::from_addr_unchecked(raw_handle);
                }
                crate::object::Kind::FileLookupWork => {
                    let _ = Handle::<FileLookupWork>::from_addr_unchecked(
                        raw_handle,
                    );
                }
                crate::object::Kind::FileWork => {
                    let _ = Handle::<FileWork>::from_addr_unchecked(raw_handle);
                }
                crate::object::Kind::IrqEvent => {
                    let _ = Handle::<IrqEvent>::from_addr_unchecked(raw_handle);
                }

                crate::object::Kind::File => {
                    let _ =
                        Handle::<IndexNode>::from_addr_unchecked(raw_handle);
                }

                crate::object::Kind::Queue => {
                    let _ = Handle::<Queue<AnyObject>>::from_addr_unchecked(
                        raw_handle,
                    );
                }

                crate::object::Kind::KernelBuf => {
                    let handle =
                        Handle::<KernelBuf>::from_addr_unchecked(raw_handle);

                    drop(handle);
                }

                crate::object::Kind::Event => {
                    let handle =
                        Handle::<Event>::from_addr_unchecked(raw_handle);

                    drop(handle);
                }

                crate::object::Kind::SuperBlock => todo!(),
                crate::object::Kind::Mutex => todo!(),
            }
        },
        Request::CloneHandle => {
            //clone handle
            let handle = Handle::<FsWork>::from_addr(edx).unwrap();

            //prevent droping handle
            let _ = unsafe { handle.into_addr() };
        }
        Request::GetObjectInfo => {
            let kind = validate_ref::<Object>(edx)?.kind;

            log::debug!("obj kind: {kind:?}");

            match kind {
                crate::object::Kind::KernelBuf => {
                    let handle = unsafe {
                        UserHandle::<KernelBuf>::from_addr_unchecked(edx)
                    };

                    let ptr = ecx as *mut MemBuf;

                    unsafe {
                        ptr.write(MemBuf {
                            ptr: core::ptr::null_mut(),
                            len: handle.len(),
                            capacity: handle.capacity(),
                        });
                    }
                }
                crate::object::Kind::File => {
                    let handle = unsafe {
                        UserHandle::<IndexNode>::from_addr_unchecked(edx)
                    };

                    let ptr = ecx as *mut FileInfo;

                    unsafe {
                        ptr.write(FileInfo {
                            ctx: handle.ctx,
                            offset: 0,
                        });
                    }
                }

                _ => todo!(),
            }
        }
        Request::KernelCopy => {
            let kernel_buf =
                unsafe { UserHandle::<KernelBuf>::from_addr_unchecked(edx) };

            let mem_buf: &MemBuf = validate_ref(ecx)?;

            let bytes = unsafe {
                core::slice::from_raw_parts_mut(mem_buf.ptr, mem_buf.capacity)
            };

            kernel_buf.copy_to(bytes)?;
        }
        Request::UserCopy => {
            let mem_buf = validate_ref::<MemBuf>(ecx)?.clone();

            let kernel_buf =
                unsafe { UserHandle::<KernelBuf>::from_addr_unchecked(edx) };

            let bytes = unsafe {
                core::slice::from_raw_parts(mem_buf.ptr, mem_buf.len)
            };

            kernel_buf.copy_from(bytes)?;
        }
        Request::QueueTryGet => todo!(),
        Request::SpawnTask => {
            let params = validate_ref::<TaskParams>(ecx)?.clone();

            unsafe {
                memory::switch_to_kernel();
            }

            let priority = if current_module().is_some() {
                TaskPriority::Module(params.nice)
            } else {
                TaskPriority::User(params.nice)
            };

            let params =
                Box::try_new(params).map_err(|_| SyscallError::NoMemory)?;

            let routine_task = task::new_task(
                run_process_task,
                Box::into_raw(params) as *const (),
                priority,
            )?;

            routine_task.process = current_task!().process.clone();

            task::submit_task(routine_task);

            unsafe {
                memory::switch_to_task(current_task!());
            }

            let ptr = edx as *mut VirtualAddress;

            unsafe {
                ptr.write(current_task!().id);
            }
        }
        Request::SetIrqHandler => {
            let handler = validate_ref::<IrqHandler>(edx)?.clone();

            let Ok(pic_line) = PicLine::try_from(handler.line) else {
                return Err(SyscallError::InvalidData);
            };

            unsafe {
                memory::switch_to_kernel();
            }

            let queue = crate::io::set_irq(pic_line.into(), handler.hook)?;

            unsafe {
                memory::switch_to_task(current_task!());
            }

            let ptr = ecx as *mut VirtualAddress;

            unsafe { ptr.write(queue.into_addr()) };
        }

        Request::EventNew => {
            unsafe { memory::switch_to_kernel() };

            let event = Event::new()?;

            unsafe { memory::switch_to_task(current_task!()) };

            let ptr = edx as *mut VirtualAddress;

            unsafe {
                ptr.write(event.into_addr());
            }
        }
        Request::EventBlock => {
            log::debug!("Event block");

            let event =
                unsafe { UserHandle::<Event>::from_addr_unchecked(edx) };

            runtime::block_on(event.to_owned())?;
        }
        Request::EventNotifyOne | Request::EventNotifyAll => {
            log::debug!("Event notify");

            let event =
                unsafe { UserHandle::<Event>::from_addr_unchecked(edx) };

            runtime::notify(event.to_owned());
        }
        Request::MutexNew => {
            let mutex = MutexObject::new()?;

            let ptr = edx as *mut kernel_types::object::RawHandle;
            unsafe { ptr.write(mutex.into_raw()) };
        }
        Request::MutexAcquire => {
            log::debug!("MutexAcquire: 0x{edx:x}");

            let mutex =
                unsafe { UserHandle::<MutexObject>::from_addr_unchecked(edx) };

            mutex.acquire();
        }
        Request::MutexRelease => {
            log::debug!("MutexRelease: 0x{edx:x}");

            let mutex =
                unsafe { UserHandle::<MutexObject>::from_addr_unchecked(edx) };

            mutex.release();
        }
        Request::SetWorkResponse => {
            let raw_object = edx as *const Object;

            let raw_handle = edx;
            let kind = unsafe { (*raw_object).kind };

            match kind {
                crate::object::Kind::FsWork => todo!(),
                crate::object::Kind::FileLookupWork => todo!(),
                crate::object::Kind::BlockDeviceWork => unsafe {
                    let response =
                        validate_ref::<block::Response>(ecx)?.clone();

                    let handle = UserHandle::<BlockWork>::from_addr_unchecked(
                        raw_handle,
                    );

                    log::debug!("Setting: {response:?} for {raw_handle}");

                    handle.send_response(response);
                },
                crate::object::Kind::FileWork => unsafe {
                    let response = validate_ref::<FileResponse>(ecx)?.clone();

                    let handle =
                        UserHandle::<FileWork>::from_addr_unchecked(raw_handle);

                    log::debug!("Setting: {response:?} for {raw_handle}");

                    handle.send_response(response);
                },

                _ => return Err(SyscallError::InvalidObjectKind),
            }
        }
    }

    Ok(())
}

impl From<AllocError> for SyscallError {
    fn from(_value: AllocError) -> Self {
        SyscallError::NoMemory
    }
}
unsafe fn blocking_pop<T, F>(
    queue: &Queue<AnyObject>,
    mut op: F,
) -> Result<(), SyscallError>
where
    T: ObjectContainer,
    F: FnMut(Handle<T>),
{
    let Some(handle) = queue.cast::<T>().blocking_pop() else {
        return Err(SyscallError::QueueIsEmpty);
    };

    op(handle);

    Ok(())
}
