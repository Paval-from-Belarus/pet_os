use kernel_types::syscall::SyscallError;

use crate::memory;

#[derive(Debug, thiserror_no_std::Error)]
pub enum ModuleError {
    #[error("No Memory: {0}")]
    Alloc(#[from] memory::AllocError),

    #[error("Two modules with same name")]
    UniqueError,
}

impl From<ModuleError> for SyscallError {
    fn from(value: ModuleError) -> Self {
        match value {
            ModuleError::Alloc(_) => SyscallError::NoMemory,
            ModuleError::UniqueError => SyscallError::InvalidModuleParams,
        }
    }
}
