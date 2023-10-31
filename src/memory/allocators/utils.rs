use core::alloc::{GlobalAlloc, Layout};

use core::ptr;

use crate::memory::{MemoryMappingFlag, ProcessMemoryRec, PageAllocator, VirtualAddress};

//The main assumption is that KernelAllocator is thread-safe class
//That is each method invocation is atomic
//Using any synchronization mechanism is redundant
///This allocator is used in highly concurrent circumstances. Thus, each call should be legal
pub struct UtilsAllocator {
    allocator: Option<PageAllocator>,
    kernel_layout: Option<ProcessMemoryRec>,
}
//Unfortunately, but it's no possibility to prove compiler that code will access immutable SystemAllocator
unsafe impl Sync for UtilsAllocator {}
unsafe impl GlobalAlloc for UtilsAllocator {
    unsafe fn alloc(&self, _layout: Layout) -> *mut u8 {
        todo!()
    }

    unsafe fn dealloc(&self, _ptr: *mut u8, _layout: Layout) {
        todo!()
    }
}
impl UtilsAllocator {
    pub const fn empty() -> UtilsAllocator {
        UtilsAllocator {
            allocator: None,
            kernel_layout: None,
        }
    }
    pub fn configure(&self, _allocator: PageAllocator, _layout: ProcessMemoryRec) {
        let _flags = MemoryMappingFlag::WRITABLE | MemoryMappingFlag::WRITE_THROUGH;
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
    pub fn heap_break(&mut self, _virtual_offset: VirtualAddress) -> *mut u8 {
        return ptr::null_mut();
    }
}
