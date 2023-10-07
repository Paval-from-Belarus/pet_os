use crate::memory::{VirtualAddress, PageAllocator};

struct MemBounds {
    lower: VirtualAddress,
    upper: VirtualAddress,
}

//allocator of current process session
//User process or Kernel session ― both have differently set allocator
pub struct SystemAllocator {
    data_bounds: MemBounds,
    stack_bounds: MemBounds,
    //no interest in stack bounds
    allocator: PageAllocator,
}
//each method of this struct is thread-safe
unsafe impl Send for SystemAllocator {}
impl SystemAllocator {
    pub fn new(allocator: PageAllocator) -> SystemAllocator {
        SystemAllocator {
            data_bounds: MemBounds { lower: 0, upper: 0 },
            stack_bounds: MemBounds { lower: 0, upper: 0 },
            allocator,
        }
    }
    pub fn data_break(_offset: VirtualAddress) -> VirtualAddress {
        0
    }
}