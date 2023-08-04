mod paging;
mod allocators;

pub use allocators::{GlobalAllocator, KernelAllocator};
pub use paging::{PagingProperties, ToPhysicalAddress, ToVirtualAddress};
pub type PhysicalAddress = usize;
pub type VirtualAddress = usize;
pub struct Page;
pub struct PageInfoRec {
    next: *mut PageInfoRec,
    prev: *mut PageInfoRec,
    flags: u32,
    offset: PhysicalAddress, //it's easy to use in calculation
}
use paging::{CaptureAllocator, PageMarker, PageMarkerError};
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
impl PageInfoRec {
    pub fn next_entry(&self) -> Option<&mut PageInfoRec> {
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
    pub fn prev_entry(&self) -> Option<&mut PageInfoRec> {
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
