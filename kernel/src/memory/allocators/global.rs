use core::alloc::{GlobalAlloc, Layout};
use crate::memory;

use crate::memory::{AllocationStrategy, PhysicalAllocator, ProcessInfo};
///By current ideas, all rust collection (fallible collection) should be used in movable memory (that is collection's elements can be freely swapped)
pub struct RustAllocator;

unsafe impl GlobalAlloc for RustAllocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        memory::alloc(layout.size(), AllocationStrategy::Kernel)
    }
    unsafe fn dealloc(&self, ptr: *mut u8, _layout: Layout) {
        memory::dealloc(ptr)
    }
}