pub mod block;
pub mod char;
mod error;
pub mod spin;
mod transaction;

pub use kernel_types::io::op::*;
use kernel_types::io::{IrqHandler, MemoryRemap};
use kernel_types::object::{Queue, RawHandle};
use kernel_types::syscall;
pub use transaction::*;

pub use error::*;

pub type Result<T> = core::result::Result<T, IoError>;

#[repr(C)]
pub struct FileOperations {
    // pub open: fn(&mut IndexNode, &mut File),
    // pub flush: fn(&mut File),
    // pub close: fn(&mut IndexNode, &mut File),
    // pub read: fn(&mut File, *mut u8, usize),
    // pub write: fn(&mut File, *const u8, usize),
    // pub seek: fn(&mut File, mode: FileSeekMode, offset: usize),
    // #[doc = "for devices only"]
    // pub ioctl: fn(&mut IndexNode, &mut File, usize),
    //consider additionally implement file_lock and mmap handler
}

pub type FnIrq<T> = fn(*const T);

pub struct IrqEvent(u8);

//set callback handler on irq
pub fn set_irq(line: u8, hook: Option<IoOperation>) -> Result<Queue<IrqEvent>> {
    let handler = IrqHandler { hook, line };
    let queue: usize;

    unsafe {
        syscall!(
            syscall::Request::SetIrqHandler,
            edx: &handler,
            edx_out: queue
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
