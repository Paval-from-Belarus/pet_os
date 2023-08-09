use alloc::vec;
use alloc::vec::Vec;
use crate::memory::{PageRec, PhysicalAddress, VirtualAddress, Page, PageRecFlag, MemRangeFlag, ToPhysicalAddress};
use crate::memory::paging::{CaptureAllocator, CaptureMemRec, PageMarker, PageMarkerError};
use crate::memory::paging;
use core::{mem, ptr};

use crate::memory::allocators::MemoryMapper;
use crate::memory::allocators::mapper_list::{PageLongSequence, PageSequence, ZoneType};
use crate::memory::allocators::page::AllocationError::OutOfMemory;

pub struct PageAllocator {
    //todo: replace with custom collection
    memory_list: *mut PageRec,
    marker: PageMarker,
}

/// What is a PageLayout table? PageLayout table is solid array (table) of PageRec in memory
pub struct HeapLayoutsRec {
    ///offset of data segment
    ///It's redundant to store any information about last page ― it's can be easily calculated from heap_offset as:<br>
    ///<code> heap_offset % Page::SIZE </code> <br>
    ///index of last touched page in PageLayout Table
    heap_offset: VirtualAddress,
    //offset of stack memory -> used for erasing stack memory
    stack_offset: VirtualAddress,
    last_page_index: usize,

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
        let list_access_flags: MemRangeFlag = MemRangeFlag::WRITABLE | MemRangeFlag::PRESENT;
        marker.mark_range(heap_offset, next_entry_offset, list_mem_size, list_access_flags).expect("Allocator initialization failed");
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
                    //todo! use heap_offset to convert to reference
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
    //similar to UNIX (Linux) brk system call
    pub fn heap_alloc(&mut self, infoRec: &mut HeapLayoutsRec, offset: VirtualAddress) -> Result<(), AllocationError> {
        let required_space = offset - infoRec.heap_offset;
        if required_space == 0 {
            return Ok(()); //dummy case ― nothing to do
        }
        if offset > 0 {
            if (required_space % Page::SIZE) <= Page::SIZE {
                infoRec.heap_offset = offset; //nothing more to do -> because all is already done
                return Ok(());
            }
            let page_cnt = Page::upper_bound(required_space); //head_offset stored in infoRec is already captured
            let pages = self.capture_pages(page_cnt);
            if pages.size() == page_cnt {
                let mut virtual_offset: VirtualAddress = Page::upper_bound(infoRec.heap_offset); //previous page was already allocated -> start with the following
                for page_rec in pages.into_iter() {
                    self.marker.mark_range(virtual_offset, page_rec.offset, Page::SIZE, MemRangeFlag::WRITABLE).unwrap();//todo! check errors
                    virtual_offset += Page::SIZE;
                }
                pages.into_iter().for_each(|page_rec| {
                })
            } else {
                return Err(OutOfMemory);
            }
        } else {
            //do erase pages
        }
        Ok(())
    }
    pub fn alloc(&mut self, page_cnt: usize) -> Option<PhysicalAddress> {
        None
    }
    pub fn dealoc(&mut self, offset: PhysicalAddress, page_cnt: usize) -> Result<(), AllocationError> {
        Ok(())
    }
    //this function is used to captured required for allocation list of pages
    fn capture_pages(&mut self, page_cnt: usize) -> PageSequence {
        PageSequence {}
    }
    fn get_page_rec_by_index(&mut self, index: usize) -> Option<PageRec> {
        None
    }
}