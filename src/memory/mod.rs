use core::ptr;
use bitflags::bitflags;
use spin::{Barrier, MutexGuard, Spin};

mod paging;
mod allocators;
mod atomics;

pub use allocators::{UtilsAllocator, PageAllocator};
pub use paging::{PagingProperties, ToPhysicalAddress, ToVirtualAddress};

pub use atomics::AtomicCell;
pub type PhysicalAddress = usize;
pub type VirtualAddress = usize;

pub struct Page; //something info about range???
bitflags! {
    #[derive(Clone)]
    pub struct PageRecFlag: usize {
        const PRESENT = 0b10;
    }
}
bitflags! {
    #[derive(Clone, Copy)]
    pub struct MemRangeFlag: usize { //flags that used to mark specific memory range
        const ACCESSED = 0b100_000;
        const CACHE_DISABLED = 0b10_000;
        const WRITE_THROUGH = 0b1000;
        const NO_PRIVILEGE = 0b100;
        const WRITABLE = 0b10;
        const PRESENT = 0b1;
        const EMPTY = 0b0;
    }
}
pub struct PageRec {
    next: *mut PageRec,
    prev: *mut PageRec,
    flags: PageRecFlag,
    offset: PhysicalAddress, //it's easy to use in calculation
}

//todo! carefully check in mutlti threaded environment
impl Page {
    pub const SIZE: usize = 4096;
    pub const fn upper_bound(byte_size: usize) -> usize {
        return (byte_size + Page::SIZE - 1) / Page::SIZE;
    }
    pub const fn lower_bound(byte_size: usize) -> usize {
        return byte_size / Page::SIZE;
    }
}
impl PageRec {
    pub fn set_next(&mut self, next: *mut PageRec) {
        self.next = next;
    }
    pub fn set_prev(&mut self, prev: *mut PageRec) {
        self.prev = prev;
    }
    pub fn next_ref(&self) -> Option<&'static mut PageRec> {
        let result;
        unsafe {
            if self.next.is_null() {
               result = None;
            } else {
                result = Some(&mut *self.next);
            }
        }
        return result;
    }
    pub fn prev_ref(&self) -> Option<&'static mut PageRec> {
        let result;
        unsafe {
            if self.prev.is_null() {
                result = None;
            } else {
                result = Some(&mut *self.prev);
            }
        }
        return result;
    }
    pub fn next_ptr(&self) -> *mut PageRec {
        self.next
    }
    pub fn prev_ptr(&self) -> *mut PageRec {
        self.prev
    } 
    pub fn read_only(page: &mut PageRec) -> &PageRec {
        return page as &PageRec;
    }
}
