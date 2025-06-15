use kernel_types::syscall::SyscallError;

use crate::memory::{AllocError, PageMarkerError};

#[derive(Debug, thiserror_no_std::Error)]
pub enum KernelError {
    #[error("Rust Alloc failed: {0}")]
    RustAlloc(#[from] alloc::alloc::AllocError),

    #[error("Failed to alloc memory: {0}")]
    Alloc(#[from] AllocError),

    #[error("PageMarker failed: {0}")]
    PageMarker(#[from] PageMarkerError),

    #[error("No pid is availabel")]
    NoPidAvailable,

    #[error("Operations is not permitted for not module")]
    NotModule,

    #[error("cast to own type from handle is invalid")]
    ManyOwners,
}

impl From<KernelError> for SyscallError {
    fn from(value: KernelError) -> Self {
        log::warn!("Failed to perform syscall: {value}");

        Self::Failed
    }
}
