use core::alloc::{GlobalAlloc, Layout};

use core::ptr;

use crate::memory::{MemoryMappingFlag, ProcessInfo, PhysicalAllocator, VirtualAddress};

//The main assumption is that KernelAllocator is thread-safe class
//That is each method invocation is atomic
//Using any synchronization mechanism is redundant
///This allocator is used in highly concurrent circumstances. Thus, each call should be legal
pub struct UtilsAllocator<'a> {
    allocator: Option<PhysicalAllocator<'a>>,
    kernel_layout: Option<ProcessInfo>,
}

//Unfortunately, but it's no possibility to prove compiler that code will access immutable SystemAllocator
unsafe impl<'a> Sync for UtilsAllocator<'a> {}

unsafe impl<'a> GlobalAlloc for UtilsAllocator<'a> {
    unsafe fn alloc(&self, _layout: Layout) -> *mut u8 {
        todo!()
    }

    unsafe fn dealloc(&self, _ptr: *mut u8, _layout: Layout) {
        todo!()
    }
}