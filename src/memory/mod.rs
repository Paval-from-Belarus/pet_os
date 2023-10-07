use core::marker::PhantomData;
use core::ops::{Add, AddAssign};
use core::ptr;

mod paging;
mod allocators;
mod atomics;

pub use allocators::{PageAllocator};
pub use paging::{PagingProperties, ToPhysicalAddress, ToVirtualAddress};

pub use atomics::AtomicCell;
use crate::memory::paging::{CaptureAllocator, PageMarker};
use crate::memory::allocators::PageList;
use crate::{bitflags};

pub type PhysicalAddress = usize;
pub type VirtualAddress = usize;
bitflags!(
    //something info about range???
    pub MemRangeFlag(usize),
    ACCESSED = 0b100_000,
    CACHE_DISABLED = 0b10_000,
    WRITE_THROUGH = 0b1000,
    NO_PRIVILEGE = 0b100,
    WRITABLE = 0b10,
    PRESENT = 0b1,
    EMPTY = 0b0
);
bitflags!(
    pub PageRecFlag(usize),
    PRESENT = 0b10,
    USABLE = 0b10_00,
    DEVICE = 0b01_00
);
/// What is a PageLayout table? PageLayout table is solid array (table) of PageRec in memory
pub struct MemoryLayoutRec {
    ///offset of data segment
    ///It's redundant to store any information about last page ― it's can be easily calculated from heap_offset as:<br>
    ///<code> heap_offset % Page::SIZE </code> <br>
    ///index of last touched page in PageLayout Table
    heap_offset: VirtualAddress,
    //I believe that heap_offset should be aligned to Page::SIZE. Practically, space will be access
    //offset of stack memory -> used for erasing stack memory
    stack_offset: VirtualAddress,
    last_page_index: usize,
    heap_pages: PageList,
    stack_pages: PageList,
    flags: MemRangeFlag,
    //Write | NoPrivilege
    marker: PageMarker,
}

pub struct Page;

pub struct PageRec {
    next: *mut PageRec,
    prev: *mut PageRec,
    flags: PageRecFlag,
    offset: PhysicalAddress, //it's easy to use in calculation
}

///Return crucial structures for kernel
///Without them, it's impossible
pub fn init_kernel_space(allocator: CaptureAllocator, mut marker: PageMarker) -> (PageAllocator, MemoryLayoutRec) {
    let (allocator, heap_offset) = PageAllocator::new(allocator, &mut marker, paging::get_heap_initial_offset());
    let layout = MemoryLayoutRec {
        heap_offset,
        stack_offset: 0, //what about stack
        last_page_index: 0,
        heap_pages: PageList::empty(),
        stack_pages: PageList::empty(),
        flags: KERNEL_LAYOUT_FLAGS,
        marker,
    };
    return (allocator, layout);
}

const KERNEL_LAYOUT_FLAGS: MemRangeFlag = MemRangeFlag(MemRangeFlag::WRITABLE | MemRangeFlag::WRITE_THROUGH);

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
