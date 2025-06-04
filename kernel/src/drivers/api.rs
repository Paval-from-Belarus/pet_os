use kernel_types::{
    io::{block::BlockDeviceInfo, char::CharDeviceInfo},
    syscall::SyscallError,
};

pub fn reg_blk_dev(dev: &BlockDeviceInfo) -> Result<(), SyscallError> {
    log::debug!("blk dev: {dev:?}");
    Ok(())
}

pub fn reg_chr_dev(dev: &CharDeviceInfo) -> Result<(), SyscallError> {
    Ok(())
}
