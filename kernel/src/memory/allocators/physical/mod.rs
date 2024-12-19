mod allocator;
mod buddy;
mod page;

use core::{mem, ptr, slice};

use kernel_types::collections::{BorrowingLinkedList, LinkedList, ListNode};
use kernel_types::declare_constants;

use crate::log;
use crate::memory::allocators::physical::page::BuddyPage;
use crate::memory::paging::{BootAllocator, PageMarkerError};
use crate::memory::OsAllocationError::NoMemory;
use crate::memory::{
    OsAllocationError, Page, PhysicalAddress, ToPhysicalAddress,
    VirtualAddress, MEMORY_MAP_SIZE,
};

pub use buddy::*;

declare_constants!(
    pub usize,
    MAX_UNIT_SIZE = 64, "The maximal count of pages for continuous memory layout";
    MAX_UNIT_POWER = BuddyPiece::power_of(MAX_UNIT_SIZE), "The power of 2 of `MAX_UNIT_SIZE`";
);

pub struct FreePages {
    pages: LinkedList<'static, Page>,
    count: usize,
}

pub type BuddyArray = [LinkedList<'static, Page>; MAX_UNIT_POWER + 1];

///It's a responsibility of caller class to maintain synchronized caller sequence
///It's really recommended to use SystemCallQueue to control the order of invocation
///All methods are thread-safe
///todo: allocator should works as buddy allocator
pub struct PhysicalAllocator {
    buddies: spin::Mutex<BuddyArray>, //all atomic operations should be atomic in system scope
                                      //it means that no thread switching will be enabled while atomic operations are not finished
}

unsafe impl Send for PhysicalAllocator {}

unsafe impl Sync for PhysicalAllocator {}

pub enum AllocationError {
    OutOfMemory,
    //something else
    PageMarkerInvalidation(PageMarkerError),
}

pub enum AllocationType {
    Densely,
    Split,
}

fn is_first_buddy(page: &Page) -> bool {
    unsafe { page.index() % 2 == 0 }
}

fn is_second_buddy(page: &Page) -> bool {
    !is_first_buddy(page)
}

unsafe fn collect_buddies(mut boot_allocator: BootAllocator) -> BuddyArray {
    let mut buddies: BuddyArray = core::array::from_fn(|_| Default::default());
    log!("Areas count = {}", boot_allocator.as_slice().len());

    for pivot in boot_allocator.as_slice_mut() {
        let mut mem_offset = pivot.next_offset();

        log!("Free pages = {}", pivot.free_pages_count());

        for _ in 0..pivot.free_pages_count() {
            let mut raw_page = Page::take_at_offset(mem_offset);

            let node_index = raw_page.as_ref().index();

            if node_index >= MEMORY_MAP_SIZE {
                break;
            }
            //only the page marked as first can begin the buddy slice
            if !is_first_buddy(raw_page.as_mut()) {
                mem_offset += Page::SIZE;
                continue;
            }

            let page_slice = raw_page.as_mut().as_buddies();

            mem_offset += Page::SIZE * page_slice.len();

            let buddy_index = BuddyPiece::power_of(page_slice.len());

            let page_node = page_slice[0].as_node();

            buddies[buddy_index].push_front(page_node);
        }
    }

    buddies
}

impl PhysicalAllocator {
    ///Construct page allocator and return self with heap start offset
    ///Memory offset usable for addressing from the scratch
    pub fn from_boot(boot_allocator: BootAllocator) -> Self {
        let buddies = unsafe { collect_buddies(boot_allocator) };

        Self {
            buddies: spin::Mutex::new(buddies),
        }
    }

    /// atomically save push slice in buddy array
    fn push_pages(&self, mut pages: &'static mut [Page]) {
        assert!(
            !pages.is_empty() && (pages.len() % 2 == 0 || pages.len() == 1)
        );

        let mut lock = self.buddies.lock();

        let buddies = lock.as_mut_slice();

        let mut next_size = pages.len() * 2;
        let mut current_size = pages.len();
        loop {
            let power = BuddyPiece::power_of(current_size);

            let page = pages.first_mut().unwrap();
            // the buddies are synchorinzed already. All is saved
            let maybe_buddy = unsafe { Self::find_another_buddy(page, power) };

            let Some(buddy) = maybe_buddy else {
                buddies[power].push_front(page.as_node());
                break;
            };

            pages = unsafe { merge_pages(page, buddy, next_size) };
            current_size = pages.len();
            next_size = pages.len() * 2;
        }
    }
    //this method should be invoked when all pages are synchronized
    unsafe fn find_another_buddy(
        page: &Page,
        power: usize,
    ) -> Option<&'static mut Page> {
        if power == MAX_UNIT_POWER {
            //more merging is impossible
            return None;
        }

        let page_offset = page as *const Page as VirtualAddress;

        let page_slice_size =
            BuddyPiece::size_of(power) * mem::size_of::<Page>();

        let mut buddy_offset = VirtualAddress::NULL;

        if is_first_buddy(page) {
            if usize::MAX - page_offset > page_slice_size {
                buddy_offset = page_offset + page_slice_size;
            }
        } else if page_offset > page_slice_size {
            buddy_offset = page_offset - page_slice_size;
        }

        if buddy_offset == VirtualAddress::NULL {
            return None;
        }

        let buddy = &mut *(buddy_offset as *mut ListNode<Page>);

        if !buddy.is_used() {
            let buddy_free_pages_count = buddy
                .as_slice(page_slice_size)
                .iter()
                .filter(|page| !page.is_used())
                .count();
            //no other way when second is free, but this one is not -- merge required
            if buddy_free_pages_count == page_slice_size {
                Some(buddy)
            } else {
                None
            }
        } else {
            None
        }
    }

    ///Be careful with such method: it should, theoretically, batch page in solid memory region, but, truly, doesn't
    pub fn dealloc_page(&self, page: &'static mut Page) {
        page.free();
        if !page.is_used() {
            let mut lock = self.buddies.lock();
            let last_list = lock.last_mut().unwrap();
            last_list.push_back(page.as_node());
        }
    }
    pub fn fast_pages(
        &'static self,
        pages_count: usize,
    ) -> Result<LinkedList<'static, Page>, OsAllocationError> {
        let mut list = LinkedList::<'static, Page>::empty();
        // let mut rest_pages_count = pages_count;
        // let mut batch_size = 2;//the initial count of pages to wrap
        // while rest_pages_count > 0 {
        //     let batch_result = self.new_alloc(batch_size);
        //     if batch_result.is_err() && batch_size == 1 {
        //         //
        //         return Err(NoMemory);
        //     } else if batch_size == 2 {
        //         batch_size = 1;
        //     }
        //     if let Ok(batch) = batch_result {
        //
        //     }
        // }
        for _ in 0..pages_count {
            let page_result = self.alloc_pages(1);
            match page_result {
                Ok(page_list) => {
                    list.splice(page_list);
                }
                Err(error_code) => {
                    for page in list.iter_mut() {
                        self.dealloc_page(page);
                    }
                    return Err(error_code);
                }
            }
        }
        Ok(list)
    }

    //allocate continuous memory region
    #[inline(never)]
    pub fn alloc_pages(
        &self,
        count: usize,
    ) -> Result<LinkedList<'static, Page>, OsAllocationError> {
        self.alloc_densely(count)
    }
    pub fn new_alloc(
        &self,
        count: usize,
    ) -> Result<BuddyPiece, OsAllocationError> {
        let mut buddy_index = BuddyPiece::power_of(count);
        assert!(buddy_index <= MAX_UNIT_POWER, "Buddy with too huge power");
        let mut lock = self.buddies.lock();
        let buddies = lock.as_mut_slice();
        let mut buddy_option = buddies[buddy_index].remove_first();
        while buddy_option.is_none() && (buddy_index + 1) < MAX_UNIT_POWER {
            buddy_index += 1;
            buddy_option = buddies[buddy_index].remove_first();
        }
        if let Some(first_page) = buddy_option {
            let piece = BuddyPiece::with_power(buddy_index, first_page);
            piece.pages().iter_mut().for_each(|page| page.take());
            Ok(piece)
        } else {
            Err(NoMemory)
        }
    }
    //return that reallocation is success or not
    pub fn new_dealloc(&self, piece: BuddyPiece) -> Result<(), ()> {
        let buddy_index = piece.power();
        assert!(buddy_index <= MAX_UNIT_POWER, "Buddy with too huge power");
        let pages = piece.pages();
        pages.iter_mut().for_each(|page| page.free());
        let used_pages_count =
            pages.iter().filter(|page| page.is_used()).count();
        if used_pages_count == 0 {
            self.push_pages(pages);
            Ok(())
        } else {
            log!("Attempt to dealloc used pages");
            Err(())
        }
    }

    fn alloc_densely(
        &self,
        count: usize,
    ) -> Result<LinkedList<'static, Page>, OsAllocationError> {
        log!("Page count = {count}");

        let mut lock = self.buddies.lock();
        let pages = lock.last_mut().unwrap();
        let mut longest = 0; //the current longest count of pages in same sequence

        let mut last_offset_option = Option::<PhysicalAddress>::None;

        for page in pages.iter().limit() {
            log!("Offset {:?}", last_offset_option);

            if let Some(offset) = last_offset_option
                && page.as_physical() == offset + Page::SIZE
            {
                last_offset_option = last_offset_option
                    .map(|offset| offset.saturating_add(Page::SIZE));
                longest += 1;
            } else {
                last_offset_option = Some(page.as_physical());
                longest = 1;
            }

            if longest == count {
                break;
            }
        }

        if let Some(last_offset) = last_offset_option
            && longest == count
        {
            let mut list = LinkedList::<'static, Page>::empty();
            let mut page_iter = pages.iter_mut();
            let mut should_add = false;
            let mut added_count = 0;
            while added_count < count
                && let Some(page) = page_iter.next()
            {
                should_add = should_add || page.as_physical() == last_offset;
                if should_add {
                    let page =
                        page_iter.unlink_watched().expect("Already watched");
                    page.take();
                    list.push_back(page);
                    added_count += 1;
                }
            }
            Ok(list)
        } else {
            Err(NoMemory)
        }
    }

    fn alloc_split(
        &self,
        count: usize,
    ) -> Result<LinkedList<'static, Page>, OsAllocationError> {
        let mut lock = self.buddies.lock();
        let pages = lock.last_mut().unwrap();
        // let mut page_iter = unsafe { pages.leak().iter_mut() };
        let mut page_iter = pages.iter_mut();
        let mut list = LinkedList::<Page>::empty();
        for _ in 0..count {
            if page_iter.next().is_none() {
                return Err(NoMemory);
            }
            let page = page_iter.unlink_watched().expect("Already watched");
            page.take();
            list.push_back(page);
        }
        Ok(list)
    }

    //capture available pages in rec
    fn capture_pages(&mut self, _page_cnt: usize) -> LinkedList<Page> {
        LinkedList::empty()
    }

    fn release_pages(&mut self, _pages: LinkedList<Page>) {}

    //this function is used to captured required for allocation list of pages
    pub fn index(&self, _index: usize) -> Option<&Page> {
        None
    }

    pub fn index_mut(&mut self, _index: usize) -> Option<&mut Page> {
        None
    }
}

unsafe fn merge_pages<'a>(
    first: &'a mut Page,
    second: &'a mut Page,
    target_size: usize,
) -> &'a mut [Page] {
    assert!(!ptr::eq(first as *mut Page, second as *mut Page));

    let slice_offset =
        if ptr::from_ref(first).cmp(&ptr::from_ref(second)).is_lt() {
            ptr::from_mut(first)
        } else {
            ptr::from_mut(second)
        };

    slice::from_raw_parts_mut(slice_offset, target_size)
}
