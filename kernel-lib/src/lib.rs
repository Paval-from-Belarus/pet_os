#![no_std]
#![feature(allocator_api)]

pub use kernel_types::syscall;
use rt::module_task;
pub use rt::ModuleOperations;

pub mod fs;
pub mod io;

pub mod logging;

#[cfg(feature = "alloc")]
extern crate alloc;

#[cfg(feature = "alloc")]
mod allocator;

pub mod drivers;
pub mod object;
pub mod process;
mod rt;
pub mod string;
pub mod task;

#[cfg(not(test))]
#[panic_handler]
pub fn panic(info: &core::panic::PanicInfo) -> ! {
    log::error!("Panic is detected: {info}");
    loop {}
}

#[macro_export]
macro_rules! module {
    (
        module: $ty:ident,
        name: $name:literal$(,)?
    ) => {
        static mut MODULE: Option<$ty> = None;
        #[export_name = "init"]
        extern "C" fn init() {
            $crate::logging::init().unwrap();

            match $ty::init() {
                Ok(data) => {
                    unsafe { MODULE = Some(data) };
                    $crate::complete($ty::ops());
                }

                Err(cause) => {
                    log::error!("Failed init: {cause}");
                    $crate::exit(cause.into());
                }
            }
        }

        #[export_name = "exit"]
        extern "C" fn exit() {
            let module = unsafe { MODULE.take() };

            if core::mem::needs_drop::<$ty>() {
                if let Some(module) = module {
                    let _ = module;
                }
            }
        }
    };
}

#[derive(Debug, thiserror_no_std::Error)]
pub enum ModuleError {
    #[error("Io Op failed: {0}")]
    Io(#[from] io::IoError),

    #[error("Fs Op failed: {0}")]
    Fs(#[from] fs::FsError),

    #[error("SysCall is failed")]
    Syscall(#[from] syscall::SyscallError),

    #[cfg(feature = "alloc")]
    #[error("Failed to perform memory allocation: {0}")]
    Alloc(#[from] core::alloc::AllocError),
}

pub fn exit(code: Option<ModuleError>) -> ! {
    let code = if code.is_some() { 1 } else { 0 };

    unsafe {
        core::arch::asm! {
            "mov eax, {0}",
            "int 81h",
            in(reg) code,
            options(noreturn, nostack)
        }
    }
}

pub fn complete(ops: ModuleOperations) -> ! {
    module_task(ops)
}

pub trait KernelModule: Sized {
    fn init() -> Result<Self, ModuleError>;
    fn ops() -> ModuleOperations;
}
