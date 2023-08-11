use core::alloc::{GlobalAlloc, Layout};
use core::cell::Cell;
use core::ptr;
use crate::memory::allocators::SystemAllocator;
use crate::memory::{MemoryLayoutRec, MemRangeFlag, PageAllocator, VirtualAddress};
use crate::memory::paging::PageMarker;

//The main assumption is that KernelAllocator is thread-safe class
//That is each method invocation is atomic
//Using any synchronization mechanism is redundant
///This allocator is used in highly concurrent circumstances. Thus, each call should be legal
pub struct  UtilsAllocator {
    allocator: Option<PageAllocator>,
    kernel_layout: Option<MemoryLayoutRec>
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
        UtilsAllocator { allocator: None, kernel_layout: None}
    }
    pub fn configure(&self, allocator: PageAllocator, layout: MemoryLayoutRec) {
        let flags = MemRangeFlag::WRITABLE | MemRangeFlag::WRITE_THROUGH;
        // let kernel_layout: MemoryLayoutRec = MemoryLayoutRec {
        //     heap_offset: 0,
        //     stack_offset: 0,
        //     last_page_index: 0,
        //     heap_pages: (),
        //     stack_pages: (),
        //     flags: MemRangeFlag(),
        //     marker: (),
        // }|
        // self.allocator.set(Some(allocator));
    }
    pub fn heap_break(&mut self, virtual_offset: VirtualAddress) -> *mut u8 {
        return ptr::null_mut();
    }

}