//какие типы операций могут быть:
//из одного куска памяти в другой (memcopy)
//из порта в какой-то один кусок памяти (один раз)
//из порта в какой-то кусок памяти (много раз), увеличение буфера

use kernel_types::{object::OpStatus, syscall::SyscallError};

#[derive(Debug, thiserror_no_std::Error)]
pub enum IoError {
    #[error("Not Supported Operation")]
    NotSupported,
    #[error("Syscall is failed: {0:?}")]
    SyscallFailed(#[from] SyscallError),
}

impl From<IoError> for OpStatus {
    fn from(value: IoError) -> Self {
        match value {
            IoError::NotSupported => OpStatus::NotSupported,
            IoError::SyscallFailed(_) => OpStatus::Failed,
        }
    }
}
