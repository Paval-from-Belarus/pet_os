use core::ptr::NonNull;
use crate::memory::{OsAllocationError, PhysicalAllocator, VirtualAddress};
use crate::memory::paging::PageMarker;

struct MemBounds {
    lower: VirtualAddress,
    upper: VirtualAddress,
}

//allocator of current process session
//User process or Kernel session ― both have differently set allocator
pub struct SlabAllocator {
    data_bounds: MemBounds,
    stack_bounds: MemBounds,
    //no interest in stack bounds
    allocator: &'static PhysicalAllocator,
}

pub struct SlabEntry {
    size: usize,
}


//each method of this struct is thread-safe
unsafe impl Send for SlabAllocator {}

impl SlabAllocator {
    pub fn new(allocator: &'static PhysicalAllocator, kernel_marker: PageMarker) -> SlabAllocator {
        Self {
            data_bounds: MemBounds { lower: 0, upper: 0 },
            stack_bounds: MemBounds { lower: 0, upper: 0 },
            allocator,
        }
    }
    pub fn data_break(_offset: VirtualAddress) -> VirtualAddress {
        0
    }
}
