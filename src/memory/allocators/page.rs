use crate::memory::{PageRec, PhysicalAddress, VirtualAddress, Page, PageRecFlag, MemRangeFlag};
use crate::memory::paging::{CaptureAllocator, CaptureMemRec, PageMarker, PageMarkerError};
use crate::memory::paging;
use core::{mem, ptr};
pub struct PageAllocator {
    memory_list: *mut PageRec,
    marker: PageMarker,
}
pub enum AllocationError {
    OutOfMemory, //something else
}
impl PageAllocator {
    pub fn new(mut allocator: CaptureAllocator, mut marker: PageMarker) -> PageAllocator {
        let free_mem_size = allocator.free_memory();
        let rec_cnt = free_mem_size / mem::size_of::<PageRec>();
        let list_mem_size = rec_cnt * mem::size_of::<PageRec>();
        //acquire memory for PageRec
        let mut next_entry_offset = allocator.alloc(None, list_mem_size).unwrap();
        let heap_offset = paging::get_heap_initial_offset();
        let LIST_ACCESS_FLAGS: MemRangeFlag = MemRangeFlag::WRITABLE | MemRangeFlag::PRESENT;
        marker.mark_range(heap_offset, next_entry_offset, list_mem_size, LIST_ACCESS_FLAGS).expect("Allocator initialization failed");
        let heap_offset = heap_offset + list_mem_size;
        let mut last_entry = ptr::null_mut();
        for pivot in allocator.as_pivots().iter() {
            let mut rest_size = pivot.get_free_pages_cnt() * Page::SIZE;
            let mut physical_offset = pivot.get_memory_offset();
            while rest_size >= Page::SIZE {
                let info_rec: PageRec = PageRec {
                    prev: last_entry,
                    next: ptr::null_mut(),
                    offset: physical_offset,
                    flags: PageRecFlag::PRESENT,
                };
                unsafe {
                    let next_entry = PageAllocator::store_entry(next_entry_offset, info_rec);
                    if !last_entry.is_null() {
                        (&mut *last_entry).next = next_entry;
                    }
                    last_entry = next_entry;
                }
                next_entry_offset += mem::size_of::<PageRec>();
                rest_size -= mem::size_of::<PageRec>();
                physical_offset += Page::SIZE;
            }
        }
        return PageAllocator { memory_list: last_entry, marker };
    }
    unsafe fn store_entry(dest: PhysicalAddress, info_rec: PageRec) -> *mut PageRec {
        let entry_offset = dest as *mut PageRec;
        ptr::write(entry_offset, info_rec);
        return entry_offset;
    }
    pub fn alloc(&mut self, page_cnt: usize) -> Option<PhysicalAddress> {
        None
    }
    pub fn dealoc(&mut self, offset: PhysicalAddress, page_cnt:usize) -> Result<(), AllocationError> {
        Ok(())
    }
}