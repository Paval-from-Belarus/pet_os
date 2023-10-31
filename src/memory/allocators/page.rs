use crate::memory::paging::{CaptureAllocator, PageMarker, PageMarkerError};
use crate::memory::{MemoryMappingFlag, ProcessMemoryRec, Page, PhysicalAddress, VirtualAddress, AllocHandler, DeallocHandler, MemoryMappingRegion};

use core::{mem, ptr};

use crate::stop_execution;
use crate::utils::LinkedList;

///It's a responsibility of caller class to maintain synchronized caller sequence
///It's really recommended to use SystemCallQueue to control the order of invocation
///All methods are thread-safe
pub struct PageAllocator {
    //todo: replace with custom collection
    memory_list: LinkedList<MemoryMappingRegion>,
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
    pub fn new<T, S>(
        mut allocator: CaptureAllocator,
        _marker: &mut PageMarker<T, S>,
        heap_offset: VirtualAddress,
    ) -> (PageAllocator, VirtualAddress)
        where T: FnMut(usize) -> Option<PhysicalAddress>, //allocate specific count of physical pages
              S: FnMut(PhysicalAddress) {
        let free_mem_size = allocator.free_memory();
        let rec_cnt = free_mem_size / mem::size_of::<Page>();
        let entries_mem_size = rec_cnt * mem::size_of::<Page>();
        // let entries_start_offset = allocator.alloc(0, entries_mem_size).unwrap();
        let _entries_start_offset = match allocator.alloc(0, entries_mem_size) {
            None => stop_execution(),
            Some(memory_offset) => memory_offset,
        };
        // if marker
        //     .map_user_range(
        //         heap_offset,
        //         entries_start_offset,
        //         entries_mem_size,
        //         LIST_ACCESS_FLAG,
        //     )
        //     .is_err()
        // {
        //     stop_execution(); //mark_range result holds error code, but we can do nothing with such error_code
        // }
        // let last_entry = ptr::null_mut();

        // let mut last_entry = ptr::null_mut();
        // let mut next_offset = heap_offset;
        // for pivot in allocator.as_pivots().iter() {
        //     let mut rest_size = pivot.get_free_pages_cnt() * Page::SIZE;
        //     let mut physical_offset = pivot.get_memory_offset();
        //     while rest_size >= Page::SIZE {
        //         let info_rec = PageRec {
        //             prev: last_entry,
        //             next: ptr::null_mut(),
        //             offset: physical_offset,
        //             flags: PageRecFlag(PageRecFlag::PRESENT | PageRecFlag::USABLE),
        //         };
        //         unsafe {
        //             let next_entry = PageAllocator::store_entry(next_offset, info_rec);
        //             if !last_entry.is_null() {
        //                 (&mut *last_entry).set_next(next_entry);
        //             }
        //             last_entry = next_entry;
        //         }
        //         next_offset += mem::size_of::<PageRec>();
        //         rest_size -= mem::size_of::<PageRec>();
        //         physical_offset += Page::SIZE;
        //     }
        // }
        return (
            PageAllocator {
                memory_list: LinkedList::empty(),
                free_pages: LinkedList::empty(),
            },
            heap_offset + entries_mem_size,
        );
    }
    unsafe fn store_entry(dest: VirtualAddress, info_rec: Page) -> *mut Page {
        let entry_offset = dest as *mut Page;
        ptr::write(entry_offset, info_rec);
        return entry_offset;
    }
    //current version of kernel disallow to manage page caching policies
    //similar to UNIX (Linux) brk system call
    pub fn heap_alloc(
        &mut self,
        _info_rec: &mut ProcessMemoryRec,
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
    pub fn alloc(&mut self, _page_cnt: usize) -> Option<PhysicalAddress> {
        None
    }
    pub fn dealoc(
        &mut self,
        _offset: PhysicalAddress,
        _page_cnt: usize,
    ) -> Result<(), AllocationError> {
        Ok(())
    }
    //this function is used to captured required for allocation list of pages
    fn get_page_rec_by_index(&mut self, _index: usize) -> Option<Page> {
        None
    }
}
