//какие типы операций могут быть:
//из одного куска памяти в другой (memcopy)
//из порта в какой-то один кусок памяти (один раз)
//из порта в какой-то кусок памяти (много раз), увеличение буфера

use kernel_types::syscall::SyscallError;

#[derive(Debug, thiserror_no_std::Error)]
pub enum IoError {
    #[error("Not Supported Operation")]
    NotSupported,
    #[error("Syscall is failed")]
    SyscallFailed(#[from] SyscallError),
}
