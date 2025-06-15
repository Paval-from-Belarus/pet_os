mod batch;
pub mod block;
pub mod char;
mod error;
pub mod spin;

pub use batch::*;
pub use kernel_types::io::op::*;
pub use kernel_types::io::{IrqEvent, IrqHandler, MemoryRemap};
use kernel_types::object::{Queue, RawHandle};
use kernel_types::syscall;

pub use error::*;

pub type Result<T> = core::result::Result<T, IoError>;

//set callback handler on irq
pub fn set_irq(line: u8, hook: Option<IoOperation>) -> Result<Queue<IrqEvent>> {
    let handler = IrqHandler { hook, line };
    let mut queue: usize = 0;

    unsafe {
        syscall!(
            syscall::Request::SetIrqHandler,
            ecx: &mut queue,
            edx: &handler,
        )?;
    }

    log::debug!("Irq Queue Handle: {queue:X?}");

    let queue = unsafe { RawHandle::new_unchecked(queue) };

    Ok(queue.into())
}

pub fn remap(
    physical_memory: usize,
    virtual_memory: *mut u8,
    len: usize,
) -> Result<()> {
    let remap = MemoryRemap {
        physical_start: physical_memory,
        virtual_start: virtual_memory as usize,
        len,
    };

    unsafe {
        syscall!(syscall::Request::MemRemap, edx: &remap)?;
    }

    Ok(())
}
