use crate::memory::{AllocError, PageMarkerError};

#[derive(Debug, thiserror_no_std::Error)]
pub enum KernelError {
    #[error("Failed to alloc memory: {0}")]
    Alloc(#[from] AllocError),

    #[error("PageMarker failed: {0}")]
    PageMarker(#[from] PageMarkerError),

    #[error("No pid is availabel")]
    NoPidAvailable,
}
