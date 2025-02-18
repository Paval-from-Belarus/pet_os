mod allocator;
mod buddy;
mod page;

use core::{mem, ptr, slice};

use kernel_types::collections::{BorrowingLinkedList, LinkedList, ListNode};
use kernel_types::declare_constants;

use crate::log;
use crate::memory::allocators::physical::page::BuddyPage;
use crate::memory::paging::{BootAllocator, MemoryKind, PageMarkerError};
use crate::memory::OsAllocationError::NoMemory;
use crate::memory::{
    OsAllocationError, Page, PhysicalAddress, ToPhysicalAddress,
    VirtualAddress, MEMORY_MAP_SIZE,
};

pub use buddy::*;

declare_constants!(
    pub usize,
    MAX_BUDDY_BATCH_SIZE = 64, "The maximal count of pages for continuous memory layout";
    MAX_UNIT_POWER = buddy_index(MAX_BUDDY_BATCH_SIZE), "The power of 2 of `MAX_UNIT_SIZE`";
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

fn is_even_in_memory_map(page: &Page) -> bool {
    unsafe { page.index() % 2 == 0 }
}

#[no_mangle]
unsafe fn collect_buddies(mut boot_allocator: BootAllocator) -> BuddyArray {
    unsafe fn reset_pages(offset: VirtualAddress, count: usize) {
        let page = Page::take_unchecked(offset);
        let pages = page.as_slice_mut(count);

        for page in pages.iter_mut() {
            *page = Page::new();
        }
    }

    boot_allocator.as_slice().iter().for_each(|entry| {
        let pages_count = entry.free_pages_count();
        let region_size = pages_count * Page::SIZE;
        let region_start = entry.next_offset();
        let kind = entry.kind();

        log::info!("start = {region_start:0X}. size = {region_size}. pages = {pages_count}. kind = {kind:?}");
    });

    let mut buddies: BuddyArray = core::array::from_fn(|_| Default::default());

    for pivot in boot_allocator.as_slice_mut() {
        if pivot.kind() != MemoryKind::Available {
            continue;
        }

        let mut mem_offset = pivot.next_offset();

        if mem_offset == 0x1FF0000 {
            //fixme: collect physical pages more gently
            break;
        }

        let max_offset = mem_offset + (Page::SIZE * pivot.free_pages_count());

        reset_pages(mem_offset, pivot.free_pages_count());

        while mem_offset < max_offset {
            let page = unsafe { Page::take_unchecked(mem_offset) };

            let node_index = page.index();

            if node_index >= MEMORY_MAP_SIZE || mem_offset > max_offset {
                log::warn!("Invalid index for memory map: {node_index}");
                break;
            }

            //only even page can be the first in buddy batch
            if !is_even_in_memory_map(page) {
                mem_offset += Page::SIZE;
                continue;
            }

            let max_batch_size = {
                let rest_pages = (max_offset - mem_offset) / Page::SIZE;

                MAX_BUDDY_BATCH_SIZE.min(rest_pages)
            };

            let buddy_batch = page.as_buddy_batch_head(max_batch_size);

            buddy_batch.iter().for_each(|page| page.acquire());

            mem_offset += Page::SIZE * buddy_batch.len();

            let index = buddy_index(buddy_batch.len());

            let batch_head = buddy_batch[0].as_node();

            buddies[index].push_front(batch_head);
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
            let power = buddy_index(current_size);

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

        let page_slice_size = 2usize.pow(power as u32) * mem::size_of::<Page>();

        let mut buddy_offset = VirtualAddress::NULL;

        if is_even_in_memory_map(page) {
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

    /// Be careful with such method: it should, theoretically, batch page in solid memory region, but, truly, doesn't
    pub fn dealloc_page(&self, page: &'static mut Page) {
        page.release();
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
        self.alloc_densely(pages_count)
    }

    /// allocate continuous memory region
    pub fn alloc_pages(
        &self,
        count: usize,
    ) -> Result<BuddyBatch, OsAllocationError> {
        self.new_alloc(count)
    }

    pub fn new_alloc(
        &self,
        count: usize,
    ) -> Result<BuddyBatch, OsAllocationError> {
        log::debug!("Allocating {count} pages");

        let mut index = buddy_index(count);

        assert!(index <= MAX_UNIT_POWER, "Buddy with too huge power");

        let mut lock = self.buddies.lock();
        let buddies = lock.as_mut_slice();

        let mut maybe_head = buddies[index].remove_first();

        while maybe_head.is_none() && (index + 1) <= MAX_UNIT_POWER {
            index += 1;
            maybe_head = buddies[index].remove_first();
        }

        let Some(head) = maybe_head else {
            return Err(OsAllocationError::NoMemory);
        };

        let mut batch = unsafe { BuddyBatch::new(count, head) };
        batch.iter_mut().for_each(|page| page.acquire());

        Ok(batch)
    }
    //return that reallocation is success or not
    pub fn new_dealloc(&self, piece: BuddyBatch) -> Result<(), ()> {
        let buddy_index = piece.power();

        assert!(buddy_index <= MAX_UNIT_POWER, "Buddy with too huge power");

        let pages = piece.into_pages();
        pages.iter_mut().for_each(|page| page.release());

        let used_pages_count =
            pages.iter().filter(|page| page.is_used()).count();

        if used_pages_count != 0 {
            log!("Attempt to dealloc used pages");
            return Err(());
        }

        self.push_pages(pages);

        Ok(())
    }

    fn alloc_densely(
        &self,
        count: usize,
    ) -> Result<LinkedList<'static, Page>, OsAllocationError> {
        assert!(count > 0);

        let mut lock = self.buddies.lock();
        let last_head = lock.last_mut().unwrap();
        let mut longest = 0; //the current longest count of pages in same sequence

        let mut last_offset = Option::<PhysicalAddress>::None;

        for page in last_head.iter().limit() {
            if longest == count {
                break;
            }

            let Some(offset) = last_offset.as_mut() else {
                last_offset = Some(page.as_physical());
                longest += 1;
                continue;
            };

            let offset = *offset + Page::SIZE * longest;

            //check if page in continous region
            if page.as_physical() != offset {
                longest = 0;
                last_offset = Some(page.as_physical()); //update first page
                continue;
            }

            longest += 1;
        }

        if longest != count {
            log::warn!("Failed to find {count} pages");
            return Err(OsAllocationError::NoMemory);
        }

        let head_offset = last_offset.expect("Longest == count");

        let mut list = LinkedList::<'static, Page>::empty();
        let mut page_iter = last_head.iter_mut();
        let mut should_add = false;
        let mut added_count = 0;

        loop {
            if added_count == count {
                break;
            }

            let page = page_iter.next().expect("Early was found");

            if should_add {
                let page = page_iter.unlink_watched().expect("Already watched");

                log::debug!("Page {page:?} at {:0X}", page.as_ptr() as usize);

                page.acquire();
                list.push_back(page);
                added_count += 1;
            } else {
                should_add |= page.as_physical() == head_offset;
            }
        }

        Ok(list)
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
            page.acquire();
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

const fn buddy_index(value: usize) -> usize {
    value.next_power_of_two().ilog2() as usize
}
