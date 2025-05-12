pub mod block;

use crate::object;

pub use kernel_types::io::op::*;

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
