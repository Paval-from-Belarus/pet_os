use bitflags::bitflags;

mod paging;
mod allocators;

pub use allocators::{UtilsAllocator, PageAllocator};
pub use paging::{PagingProperties, ToPhysicalAddress, ToVirtualAddress};

pub type PhysicalAddress = usize;
pub type VirtualAddress = usize;

pub struct Page; //something info about range???
bitflags! {
    pub struct PageRecFlag: usize {
        const PRESENT = 0b10;
    }
}
bitflags! {
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
    pub fn next_entry(&self) -> Option<&mut PageRec> {
        let entry;
        if !self.next.is_null() {
            unsafe {
                entry = Some(&mut *self.next);
            }
        } else {
            entry = None;
        }
        return entry;
    }
    pub fn prev_entry(&self) -> Option<&mut PageRec> {
        let entry;
        if !self.prev.is_null() {
            unsafe {
                entry = Some(&mut *self.prev);
            }
        } else {
            entry = None;
        }
        return entry;
    }
}
