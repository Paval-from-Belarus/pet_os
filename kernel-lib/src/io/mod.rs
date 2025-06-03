pub mod block;
pub mod char;
pub mod spin;

pub use kernel_types::io::op::*;
use kernel_types::io::MemoryRemap;
pub use kernel_types::io::Result;
use kernel_types::syscall;
use kernel_types::syscall::Request;

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

//set callback handler on irq
pub fn set_irq<T: Send + Sync>(
    _line: u8,
    _handler: FnIrq<T>,
    _context: *const T,
) -> Result<()> {
    Ok(())
}

pub fn remap(
    physical_memory: usize,
    virtual_memory: *mut u8,
    len: usize,
) -> Result<()> {
    let remap = MemoryRemap {
        physical_start: physical_memory as usize,
        virtual_start: virtual_memory as usize,
        len,
    };

    unsafe {
        syscall!(Request::MemRemap, edx: &remap)?;
    }

    Ok(())
}
