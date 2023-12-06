use core::ptr::NonNull;
use crate::memory::{OsAllocationError, PhysicalAllocator, VirtualAddress};
use crate::memory::paging::PageMarker;

struct MemBounds {
    lower: VirtualAddress,
    upper: VirtualAddress,
}

//allocator of current process session
//User process or Kernel session ― both have differently set allocator
pub struct SlabAllocator<'a> {
    data_bounds: MemBounds,
    stack_bounds: MemBounds,
    //no interest in stack bounds
    allocator: NonNull<PhysicalAllocator<'a>>,
}

pub struct SlabEntry {
    size: usize,
}


//each method of this struct is thread-safe
unsafe impl<'a> Send for SlabAllocator<'a> {}

impl<'a> SlabAllocator<'a> {
    pub fn new(allocator: &'a mut PhysicalAllocator, kernel_marker: PageMarker) -> SlabAllocator<'a> {
        Self {
            data_bounds: MemBounds { lower: 0, upper: 0 },
            stack_bounds: MemBounds { lower: 0, upper: 0 },
            allocator: NonNull::from(allocator),
        }
    }
    pub fn data_break(_offset: VirtualAddress) -> VirtualAddress {
        0
    }
}
