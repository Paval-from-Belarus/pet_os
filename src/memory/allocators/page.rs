use crate::memory::{PageRec, PhysicalAddress, VirtualAddress, Page, PageRecFlag, MemRangeFlag, ToPhysicalAddress, MemoryLayoutRec};
use crate::memory::paging::{CaptureAllocator, CaptureMemRec, PageMarker, PageMarkerError};
use crate::memory::paging;
use core::{mem, ptr};
use bitflags::Flags;
use crate::memory::atomics::AtomicCell;
use crate::memory::allocators::mapper_list::{PageList};
use crate::memory::allocators::page::AllocationError::{OutOfMemory, PageMarkerInvalidation};

///It's a responsibility of caller class to maintain synchronized caller sequence
///It's really recommended to use SystemCallQueue to control the order of invocation
///All methods are thread-safe
pub struct PageAllocator {
    //todo: replace with custom collection
    memory_list: *mut PageRec,
    free_pages: PageList,
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
const LIST_ACCESS_FLAG: MemRangeFlag = MemRangeFlag::WRITABLE.union(MemRangeFlag::PRESENT);

impl PageAllocator {
    ///Construct page allocator and return self with heap start offset (memory offset usable for addressing from the scratch)
    pub fn new(mut allocator: CaptureAllocator, marker: &mut PageMarker, heap_offset: VirtualAddress) -> (PageAllocator, VirtualAddress) {
        let free_mem_size = allocator.free_memory();
        let rec_cnt = free_mem_size / mem::size_of::<PageRec>();
        let entries_mem_size = rec_cnt * mem::size_of::<PageRec>();
        let entries_start_offset = allocator.alloc(None, entries_mem_size).unwrap();
        marker.mark_range(heap_offset, entries_start_offset, entries_mem_size, LIST_ACCESS_FLAG).expect("Allocator initialization failed");
        let mut last_entry = ptr::null_mut();
        let mut next_offset = heap_offset;
        for pivot in allocator.as_pivots().iter() {
            let mut rest_size = pivot.get_free_pages_cnt() * Page::SIZE;
            let mut physical_offset = pivot.get_memory_offset();
            while rest_size >= Page::SIZE {
                let info_rec = PageRec {
                    prev: last_entry,
                    next: ptr::null_mut(),
                    offset: physical_offset,
                    flags: PageRecFlag::PRESENT | PageRecFlag::USABLE,
                };
                unsafe {
                    let next_entry = PageAllocator::store_entry(next_offset, info_rec);
                    if !last_entry.is_null() {
                        (&mut *last_entry).set_next(next_entry);
                    }
                    last_entry = next_entry;
                }
                next_offset += mem::size_of::<PageRec>();
                rest_size -= mem::size_of::<PageRec>();
                physical_offset += Page::SIZE;
            }
        }
        return (PageAllocator { memory_list: last_entry, free_pages: PageList::empty() }, heap_offset + entries_mem_size);
    }
    unsafe fn store_entry(dest: VirtualAddress, info_rec: PageRec) -> *mut PageRec {
        let entry_offset = dest as *mut PageRec;
        ptr::write(entry_offset, info_rec);
        return entry_offset;
    }
    //current version of kernel disallow to manage page caching policies
    //similar to UNIX (Linux) brk system call
    pub fn heap_alloc(&mut self, info_rec: &mut MemoryLayoutRec, request_offset: VirtualAddress) -> Result<(), AllocationError> {
        let expanded_space = (request_offset - info_rec.heap_offset) as isize;
        if expanded_space == 0 {
            return Ok(()); //dummy system call -> no space required
        }
        let result: Result<(), AllocationError>;
        if request_offset > 0 {
            let page_cnt = Page::upper_bound(expanded_space as usize); //head_offset stored in infoRec is already captured
            let pages = self.capture_pages(page_cnt);
            if pages.size() != page_cnt {
                self.release_pages(pages);
                //try to swap memory pages to disk
            }
            let pages = self.capture_pages(page_cnt);
            if pages.size() == page_cnt {
                let mark_result = PageAllocator::mark_pages(&mut info_rec.marker, info_rec.heap_offset, &pages, info_rec.flags);
                if mark_result.is_ok() {
                    info_rec.heap_offset += pages.size() * Page::SIZE;
                    info_rec.heap_pages.add_all(pages);
                    result = Ok(());
                } else {
                    result = Err(PageMarkerInvalidation(mark_result.unwrap_err()));
                }
            } else {
                result = Err(OutOfMemory);
            }
        } else {
            //possible, that it's not erasing. But even soo, no page should be erased
            if (info_rec.heap_offset % request_offset) < Page::SIZE {
                return Ok(());
            }
            let shrunk_space = -expanded_space;
            let page_cnt = Page::lower_bound(shrunk_space as usize); //shrunk_space is bigger then Page::SIZe -> so it's possible to remove only redundant pages
            let heap_pages = &mut info_rec.heap_pages;
            let pages = heap_pages.split_list(heap_pages.size() - page_cnt, heap_pages.size());
            let mark_result = PageAllocator::mark_pages(&mut info_rec.marker, info_rec.heap_offset, &pages, MemRangeFlag::EMPTY);
            if mark_result.is_ok() {
                info_rec.heap_offset -= pages.size() * Page::SIZE;
                self.release_pages(pages);
                result = Ok(());
            } else {
                heap_pages.add_all(pages);
                result = Err(PageMarkerInvalidation(mark_result.unwrap_err()));
            }
        }
        return result;
    }
    fn mark_pages(marker: &mut PageMarker, start_offset: VirtualAddress, pages: &PageList, flags: MemRangeFlag) -> Result<(), PageMarkerError> {
        let mut offset = start_offset;
        for page_rec in pages.iter() {
            let mark_result = marker.mark_range(offset, page_rec.offset, Page::SIZE, flags);
            if mark_result.is_err() {
                return mark_result;
            }
            offset += Page::SIZE;
        }
        return Ok(());
    }
    //capture available pages in rec
    fn capture_pages(&mut self, page_cnt: usize) -> PageList {
        PageList::empty()
    }
    fn release_pages(&mut self, pages: PageList) {}
    pub fn alloc(&mut self, page_cnt: usize) -> Option<PhysicalAddress> {
        None
    }
    pub fn dealoc(&mut self, offset: PhysicalAddress, page_cnt: usize) -> Result<(), AllocationError> {
        Ok(())
    }
    //this function is used to captured required for allocation list of pages
    fn get_page_rec_by_index(&mut self, index: usize) -> Option<PageRec> {
        None
    }
}