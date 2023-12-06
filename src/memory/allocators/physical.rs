use core::cell::UnsafeCell;
use crate::memory::paging::{PageMarker, PageMarkerError};
use crate::memory::{MemoryMappingFlag, ProcessInfo, Page, PhysicalAddress, VirtualAddress, AllocHandler, DeallocHandler, MemoryMappingRegion, ToPhysicalAddress, PageFlag, OsAllocationError, TaskGate};
use crate::memory::OsAllocationError::NoMemory;

use crate::utils::{LinkedList, ListNode, SpinBox};
use crate::utils::atomics::SpinLock;

///It's a responsibility of caller class to maintain synchronized caller sequence
///It's really recommended to use SystemCallQueue to control the order of invocation
///All methods are thread-safe
///todo: allocator should works as buddy allocator
pub struct PhysicalAllocator {
    free_pages: UnsafeCell<LinkedList<'static, Page>>,
    lock: SpinLock,
    //all atomic operations should be atomic in system scope
    //it means that no thread switching will be enabled while atomic operations are not finished
}

pub enum AllocationError {
    OutOfMemory,
    //something else
    PageMarkerInvalidation(PageMarkerError),
}

impl PhysicalAllocator {
    ///Construct page allocator and return self with heap start offset (memory offset usable for addressing from the scratch)
    pub const fn new(free_pages: LinkedList<'static, Page>) -> Self {
        let lock = SpinLock::new();
        let free_pages = UnsafeCell::new(free_pages);
        Self { free_pages, lock }
    }
    #[deprecated]
    pub fn dealloc_page_by_offset(&mut self, offset: PhysicalAddress) {
        unsafe {
            let mut node = ListNode::<Page>::wrap_page(offset);
            node.as_mut().free();
        }
    }
    pub fn dealloc_page(&self, page: &'static mut ListNode<Page>) {
        page.free();
        if !page.is_used() {
            let mut list = self.synchronized_pages();
            unsafe { list.push_back(page) };
        }
    }
    //allocate continuous memory region
    pub fn alloc_pages(&'static self, count: usize) -> Result<LinkedList<'static, Page>, OsAllocationError> {
        let pages = self.synchronized_pages();
        let mut longest = 0; //the current longest count of pages in same sequence
        let mut last_offset_option: Option<PhysicalAddress> = None;
        for page in pages.iter() {
            if let Some(offset) = last_offset_option && page.as_physical() == offset + Page::SIZE {
                last_offset_option = last_offset_option
                    .map(|offset| offset.saturating_add(Page::SIZE));
                longest += 1;
            } else {
                longest = 1;
            }
            if longest == count {
                break;
            }
        }
        if let Some(last_offset) = last_offset_option && longest == count {
            let mut list = LinkedList::<'static, Page>::empty();
            let mut page_iter = unsafe { pages.leak().iter_mut() };
            let _ = page_iter.by_ref()
                .skip_while(|page| page.as_physical() < last_offset)
                .take(count);
            for _ in 0..count {
                let _ = page_iter.next().expect("Invariant violation?");//skip list node value
                let page = page_iter.unlink_watched().expect("Already watched");
                page.take();
                unsafe { list.push_back(page) };
            }
            Ok(list)
        } else {
            Err(NoMemory)
        }
    }
    fn synchronized_pages(&self) -> SpinBox<'_, 'static, LinkedList<'static, Page>> {
        let list = unsafe { &mut *self.free_pages.get() };
        SpinBox::new(&self.lock, list)
    }
    //current version of kernel disallow to manage page caching policies
//similar to UNIX (Linux) brk system call
    pub fn heap_alloc(
        &mut self,
        _info_rec: &mut ProcessInfo,
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
        _marker: &mut PageMarker,
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