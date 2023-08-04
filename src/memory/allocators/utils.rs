use core::alloc::{GlobalAlloc, Layout};
use core::cell::Cell;
use crate::memory::allocators::SystemAllocator;

//The main assumption is that KernelAllocator is thread-safe class
//That is each method invocation is atomic
//Using any synchronization mechanism is redundant
pub struct UtilsAllocator {
    allocator: Cell<Option<&'static SystemAllocator>>,
}
//Unfortunately, but it's no possibility to prove compiler that code will access immutable SystemAllocator
unsafe impl Sync for UtilsAllocator {}
unsafe impl GlobalAlloc for UtilsAllocator {
    unsafe fn alloc(&self, layout: Layout) -> *mut u8 {
        todo!()
    }

    unsafe fn dealloc(&self, ptr: *mut u8, layout: Layout) {
        todo!()
    }
}
impl UtilsAllocator {
    pub const fn empty() -> UtilsAllocator {
        UtilsAllocator { allocator: Cell::new(None) }
    }
    pub fn configure(&self, allocator: &'static mut SystemAllocator) {
        self.allocator.set(Some(allocator));
    }
}