use crate::memory::paging::{CaptureAllocator, PageMarker, PageMarkerError};
use crate::memory::{MemoryMappingFlag, ProcessMemoryHandle, Page, PhysicalAddress, VirtualAddress, AllocHandler, DeallocHandler, MemoryMappingRegion, ToPhysicalAddress, PageFlag};

use core::{mem, ptr};
use core::ptr::{drop_in_place, NonNull};

use crate::{log, stop_execution};
use crate::memory::paging::table::{DirEntry, RefTable};
use crate::utils::{LinkedList, ListNode};

///It's a responsibility of caller class to maintain synchronized caller sequence
///It's really recommended to use SystemCallQueue to control the order of invocation
///All methods are thread-safe
pub struct PageAllocator {
    free_pages: LinkedList<Page>,
    //all atomic operations should be atomic in system scope
    //it means that no thread switching will be enabled while atomic operations are not finished
}

pub enum AllocationError {
    OutOfMemory,
    //something else
    PageMarkerInvalidation(PageMarkerError),
}

//
// pub fn get_kernel_layout() -> MemoryLayoutRec {
//     let flags = MemRangeFlag::WRITABLE | MemRangeFlag::WRITE_THROUGH;
//
//     // MemoryLayoutRec {
//     //     heap_offset: 0,
//     //     stack_offset: 0,
//     //     last_page_index: 0,
//     //     heap_pages: (),
//     //     stack_pages: (),
//     //     flags: MemRangeFlag(),
//     //     marker: (),
//     // }
// }
const LIST_ACCESS_FLAG: MemoryMappingFlag = MemoryMappingFlag(MemoryMappingFlag::PRESENT | MemoryMappingFlag::WRITABLE);

impl PageAllocator {
    ///Construct page allocator and return self with heap start offset (memory offset usable for addressing from the scratch)
    pub const fn new(free_pages: LinkedList<Page>) -> Self {
        Self { free_pages }
    }
    pub fn dealloc_page(&mut self, offset: PhysicalAddress) {
        unsafe {
            let mut node = ListNode::<Page>::wrap_page(offset);
            node.as_mut().release();
            self.free_pages.push_back(node);
        }
    }
    //allocate continuous memory region
    pub fn alloc_pages(&mut self, page_count: usize) -> Option<PhysicalAddress> {
        assert_eq!(page_count, 1, "Failed to allocate more then 1 page");
        let option_node = self.free_pages.remove_first();
        match option_node {
            None => None,
            Some(mut page_node) => {
                let page = unsafe { page_node.as_mut() };
                page.acquire();
                Some(page.as_physical())
            }
        }
    }
    //current version of kernel disallow to manage page caching policies
    //similar to UNIX (Linux) brk system call
    pub fn heap_alloc(
        &mut self,
        _info_rec: &mut ProcessMemoryHandle,
        _request_offset: VirtualAddress,
    ) -> Result<(), AllocationError> {
        Ok(())
        // let expanded_space = (request_offset - info_rec.heap_offset) as isize;
        // if expanded_space == 0 {
        //     return Ok(()); //dummy system call -> no space required
        // }
        // let result: Result<(), AllocationError>;
        // if request_offset > 0 {
        //     let page_cnt = Page::upper_bound(expanded_space as usize); //head_offset stored in infoRec is already captured
        //     let pages = self.capture_pages(page_cnt);
        //     if pages.size() != page_cnt {
        //         self.release_pages(pages);
        //         //try to swap memory pages to disk
        //     }
        //     let pages = self.capture_pages(page_cnt);
        //     if pages.size() == page_cnt {
        //         let mark_result = PageAllocator::mark_pages(&mut info_rec.marker, info_rec.heap_offset, &pages, info_rec.flags);
        //         if let Err(error_code) = mark_result {
        //             return Err(PageMarkerInvalidation(error_code));
        //         }
        //         info_rec.heap_offset += pages.size() * Page::SIZE;
        //         info_rec.heap_pages.add_all(pages);
        //         result = Ok(());
        //     } else {
        //         result = Err(OutOfMemory);
        //     }
        // } else {
        //     //possible, that it's not erasing. But even soo, no page should be erased
        //     if (info_rec.heap_offset % request_offset) < Page::SIZE {
        //         return Ok(());
        //     }
        //     let shrunk_space = -expanded_space;
        //     let page_cnt = Page::lower_bound(shrunk_space as usize); //shrunk_space is bigger then Page::SIZe -> so it's possible to remove only redundant pages
        //     let heap_pages = &mut info_rec.heap_pages;
        //     let pages = heap_pages.split_list(heap_pages.size() - page_cnt, heap_pages.size());
        //     let mark_result = PageAllocator::mark_pages(&mut info_rec.marker, info_rec.heap_offset, &pages, MemRangeFlag(MemRangeFlag::EMPTY));
        //     if let Err(error_code) = mark_result {
        //         return Err(PageMarkerInvalidation(error_code));
        //     }
        //     info_rec.heap_offset -= pages.size() * Page::SIZE;
        //     self.release_pages(pages);
        //     result = Ok(());
        // }
        // return result;
    }
    fn mark_pages(
        _marker: &mut PageMarker<AllocHandler, DeallocHandler>,
        start_offset: VirtualAddress,
        _pages: &LinkedList<Page>,
        _flags: MemoryMappingFlag,
    ) -> Result<(), PageMarkerError> {
        let _offset = start_offset;
        // for page_rec in pages.iter() {
        //     let mark_result = marker.mark_range(offset, page_rec.offset, Page::SIZE, flags);
        //     if mark_result.is_err() {
        //         return mark_result;
        //     }
        //     offset += Page::SIZE;
        // }
        return Ok(());
    }
    //capture available pages in rec
    fn capture_pages(&mut self, _page_cnt: usize) -> LinkedList<Page> {
        LinkedList::empty()
    }
    fn release_pages(&mut self, _pages: LinkedList<Page>) {}
    //this function is used to captured required for allocation list of pages
    fn get_page_rec_by_index(&mut self, _index: usize) -> Option<Page> {
        None
    }
}
