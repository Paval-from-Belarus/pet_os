use kernel_types::{
    object::{KernelObject, RawHandle},
    syscall,
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
    handle: RawHandle,
}

impl From<RawHandle> for TaskHandle {
    fn from(value: RawHandle) -> Self {
        Self { handle: value }
    }
}

impl KernelObject for TaskHandle {}

pub type FnTask = fn();

pub fn spawn(
    routine: FnTask,
    arg: *const (),
) -> Result<TaskHandle, syscall::SyscallError> {
    unsafe {
        let handle: usize;

        syscall! {
            syscall::Request::SpawnTask,
            ecx: routine,
            edx: arg,
            edx_out: handle
        }?;

        let handle = RawHandle::new_unchecked(handle);

        Ok(handle.into())
    }
}
