use kernel_types::{
    syscall,
    task::{FnTask, TaskParams},
};

pub fn terminate(code: i32) -> ! {
    unsafe {
        core::arch::asm! {
            "int 80h",
            in("eax") syscall::Request::TerminateCurrentTask as u32,
            in("edx") code,
            options(noreturn)
        }
    }
}

#[allow(unused)]
pub struct TaskHandle {
    pub id: usize,
}

// impl From<RawHandle> for TaskHandle {
//     fn from(value: RawHandle) -> Self {
//         Self { handle: value }
//     }
// }

// impl KernelObject for TaskHandle {}

pub fn spawn(
    routine: FnTask,
    args: *const (),
    nice: u16,
) -> Result<TaskHandle, syscall::SyscallError> {
    let params = TaskParams {
        routine,
        args,
        nice,
    };

    unsafe {
        let mut handle: usize = 0;

        syscall! {
            syscall::Request::SpawnTask,
            ecx: &params,
            edx: &mut handle
        }?;

        // let handle = RawHandle::new_unchecked(handle);

        Ok(TaskHandle { id: handle })
        // Ok(handle.into())
    }
}
