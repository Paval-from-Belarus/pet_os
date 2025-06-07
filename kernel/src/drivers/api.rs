use kernel_types::{
    drivers::ModuleKind,
    io::{block::BlockDeviceInfo, char::CharModuleInfo},
    syscall::SyscallError,
};

use super::init_module;

pub fn reg_blk_module(dev: &BlockDeviceInfo) -> Result<(), SyscallError> {
    init_module(&dev.name, ModuleKind::Block, dev.queue_size).inspect_err(
        |cause| {
            log::warn!("Failed to init new module: {cause}");
        },
    )?;

    Ok(())
}

pub fn reg_chr_module(dev: &CharModuleInfo) -> Result<(), SyscallError> {
    init_module(&dev.name, ModuleKind::Char, 10).inspect_err(|cause| {
        log::warn!("Failed to init new module: {cause}");
    })?;

    Ok(())
}
