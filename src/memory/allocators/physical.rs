use core::cell::UnsafeCell;
use core::mem::MaybeUninit;
use core::{mem, ptr, slice};

use core::ptr::NonNull;
use crate::{declare_constants, log};
use crate::memory::paging::{CaptureAllocator, PageMarkerError};
use crate::memory::{ProcessInfo, Page, PhysicalAddress, VirtualAddress, ToPhysicalAddress, OsAllocationError, MEMORY_MAP_SIZE};
use crate::memory::OsAllocationError::NoMemory;

use crate::utils::{LinkedList, ListNode, SpinBox};
use crate::utils::atomics::SpinLock;
declare_constants!(
    pub usize,
    MAX_UNIT_SIZE = 64, "The maximal count of pages for continuous memory layout";
    MAX_UNIT_POWER = BuddyPiece::power_of(MAX_UNIT_SIZE), "The power of 2 of `MAX_UNIT_SIZE`";
);
pub struct BuddyPiece {
    ///the power of two request
    size: usize,
    power: usize,
    first_page_cell: UnsafeCell<&'static mut ListNode<Page>>,
    // _marker: PhantomData<>,
}

impl BuddyPiece {
    pub fn with_pages(pages_count: usize, first_page: &'static mut ListNode<Page>) -> Self {
        assert!(pages_count <= MAX_UNIT_SIZE);
        let power = Self::power_of(pages_count);
        Self::with_power(power, first_page)
    }
    pub fn with_power(power: usize, first_page: &'static mut ListNode<Page>) -> Self {
        assert!(power <= MAX_UNIT_POWER);
        let size = Self::size_of(power);
        // let raw_first_page = NonNull::from(first_page);
        Self { size, power, first_page_cell: UnsafeCell::new(first_page) }
    }
    pub fn power(&self) -> usize {
        self.power
    }
    ///the count of pages for given piece
    pub fn size(&self) -> usize {
        self.size
    }
    //if this struct was constructed then all requirements are already passed. It's save to create slice of Page struct
    pub fn pages(&self) -> &'static mut [ListNode<Page>] {
        unsafe {
            let first_page = &mut (*self.first_page_cell.get());
            first_page.as_slice_mut(self.size)
        }
    }
    const fn power_of(mut number: usize) -> usize {
        let mut power = 0;
        while number > 0 {
            number /= 2;
            power += 1;
        }
        power
    }
    fn size_of(power: usize) -> usize {
        let mut size = 1;
        for _ in 0..power {
            size *= 2;
        }
        size
    }
}

///It's a responsibility of caller class to maintain synchronized caller sequence
///It's really recommended to use SystemCallQueue to control the order of invocation
///All methods are thread-safe
///todo: allocator should works as buddy allocator
pub struct PhysicalAllocator {
    lock: SpinLock,
    buddies_cell: UnsafeCell<[LinkedList<'static, Page>; MAX_UNIT_POWER + 1]>,
    //all atomic operations should be atomic in system scope
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

fn is_first_buddy(page: &'static ListNode<Page>) -> bool {
    unsafe { page.index() % 2 == 0 }
}

fn is_second_buddy(page: &'static ListNode<Page>) -> bool {
    !is_first_buddy(page)
}

impl PhysicalAllocator {
    ///Construct page allocator and return self with heap start offset (memory offset usable for addressing from the scratch)
    pub fn new(boot_allocator: CaptureAllocator) -> Self {
        let lock = SpinLock::new();
        let mut raw_buddies = MaybeUninit::<LinkedList<'static, Page>>::uninit_array::<{ MAX_UNIT_POWER + 1 }>();
        for buddy in raw_buddies.iter_mut() {
            buddy.write(LinkedList::empty());
        }
        let buddies = unsafe { raw_buddies.map(|buddy| buddy.assume_init()) };
        let allocator = Self { lock, buddies_cell: UnsafeCell::new(buddies) };
        unsafe { allocator.collect_free_pages(boot_allocator) }
        allocator
    }
    unsafe fn collect_free_pages(&self, mut boot_allocator: CaptureAllocator) {
        for pivot in boot_allocator.as_pivots() {
            let mut mem_offset = pivot.next_offset();
            for _ in 0..pivot.free_pages_count() {
                let mut raw_page = ListNode::<Page>::map_offset(mem_offset);
                let node_index = raw_page.as_mut().index();
                if node_index >= MEMORY_MAP_SIZE {
                    break;
                }
                //only the page marked as first can begin the buddy slice
                if !is_first_buddy(raw_page.as_mut()) {
                    mem_offset += Page::SIZE;
                    continue;
                }
                let page_slice = self.find_page_slice(raw_page.as_mut());
                mem_offset += Page::SIZE * page_slice.len();
                let buddy_index = BuddyPiece::power_of(page_slice.len());
                (*self.buddies_cell.get())[buddy_index].push_front(&mut page_slice[0]);
            }
        }
    }
    unsafe fn find_page_slice(&self, page: &mut ListNode<Page>) -> &'static mut [ListNode<Page>] {
        let mut expected_slice_size = MAX_UNIT_SIZE;
        loop {
            let page_slice = page.as_slice_mut(expected_slice_size);
            let effective_slice_size = page_slice.iter()
                .filter(|page| !page.is_used())
                .take(expected_slice_size)
                .count();
            if effective_slice_size == expected_slice_size {
                return page_slice;
            }
            expected_slice_size /= 2;
            assert!(expected_slice_size >= 1, "At least one page in free_pages should be free");
        }
    }
    //atomically save push slice in buddy array
    fn push_buddy(&self,
                  page_slice: &'static mut [ListNode<Page>],
                  buddies_lock_option: Option<SpinBox<'_, 'static, [LinkedList<'static, Page>; MAX_UNIT_POWER + 1]>>) {
        assert!(!page_slice.is_empty() && (page_slice.len() % 2 == 0 || page_slice.len() == 1));
        let mut buddies_lock = buddies_lock_option
            .unwrap_or_else(|| unsafe { self.synchronized_buddies() });
        let buddies = buddies_lock.as_mut_slice();
        let power = BuddyPiece::power_of(page_slice.len());
        let mut raw_page = NonNull::from(&mut page_slice[0]);
        //the buddies are synchorinzed already. All is saved
        unsafe {
            let buddy_option = Self::find_other_buddy(raw_page.as_ref(), power);
            if let Some(buddy) = buddy_option {
                let merged_page_slice = Self::merge_buddies(raw_page.as_mut(), buddy, page_slice.len() * 2);
                self.push_buddy(merged_page_slice, Some(buddies_lock));
            } else {
                buddies[power].push_front(raw_page.as_mut());
            }
        }
    }
    //this method should be invoked when all pages are synchronized
    unsafe fn find_other_buddy(page: &'static ListNode<Page>, power: usize) -> Option<&'static mut ListNode<Page>> {
        if power == MAX_UNIT_POWER {
            //more merging is impossible
            return None;
        }
        let page_offset = page.as_ptr() as VirtualAddress;
        let page_slice_size = BuddyPiece::size_of(power) * mem::size_of::<ListNode<Page>>();
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
            let buddy_free_pages_count = buddy.as_slice(page_slice_size).iter()
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
    unsafe fn merge_buddies(first: &'static mut ListNode<Page>, second: &'static mut ListNode<Page>, target_size: usize) -> &'static mut [ListNode<Page>] {
        assert!(!first.as_ptr().eq(&second.as_ptr()));
        let slice_offset = if first.as_ptr().cmp(&second.as_ptr()).is_lt() {
            first.as_mut_ptr()
        } else {
            second.as_mut_ptr()
        };
        slice::from_raw_parts_mut(slice_offset, target_size)
    }
    ///Be careful with such method: it should, theoretically, batch page in solid memory region, but, truly, doesn't
    pub fn dealloc_page(&self, page: &mut ListNode<Page>) {
        page.free();
        if !page.is_used() {
            let mut list = self.synchronized_pages();
            list.push_back(page);
        }
    }
    pub fn fast_pages(&'static self, pages_count: usize) -> Result<LinkedList<'static, Page>, OsAllocationError> {
        let mut list = LinkedList::<'static, Page>::empty();
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
    ///the method try to unite page with existing list
    unsafe fn dealloc_and_align(&self, page: &'static mut ListNode<Page>) {
        let list = self.synchronized_pages();//lock list so no one can update it
        page.self_link();
        todo!()
    }
    //allocate continuous memory region
    #[inline(never)]
    pub fn alloc_pages(&self, count: usize) -> Result<LinkedList<'static, Page>, OsAllocationError> {
        self.alloc_densely(count)
    }
    pub fn new_alloc(&self, count: usize) -> Result<BuddyPiece, OsAllocationError> {
        let mut buddy_index = BuddyPiece::power_of(count);
        assert!(buddy_index <= MAX_UNIT_POWER, "Buddy with too huge power");
        let mut buddies_lock = unsafe { self.synchronized_buddies() };
        let buddies = buddies_lock.as_mut_slice();
        let mut buddy_option = buddies[buddy_index].remove_first();
        while buddy_option.is_none() && (buddy_index + 1) < MAX_UNIT_POWER {
            buddy_index += 1;
            buddy_option = buddies[buddy_index].remove_first();
        }
        if let Some(first_page) = buddy_option {
            let piece = BuddyPiece::with_power(buddy_index, first_page);
            piece.pages().iter_mut()
                .for_each(|page| page.take());
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
        let used_pages_count = pages.iter()
            .filter(|page| page.is_used())
            .count();
        if used_pages_count == 0 {
            self.push_buddy(pages, None);
            Ok(())
        } else {
            log!("Attempt to dealloc used pages");
            Err(())
        }
    }
    fn alloc_densely(&self, count: usize) -> Result<LinkedList<'static, Page>, OsAllocationError> {
        let mut pages = self.synchronized_pages();
        let mut longest = 0; //the current longest count of pages in same sequence
        let mut last_offset_option: Option<PhysicalAddress> = None;
        let mut first_page_option: Option<&ListNode<Page>> = None;
        for page in pages.iter() {
            if let Some(first_page) = first_page_option {
                if ptr::eq(first_page, page) {
                    return Err(NoMemory);
                }
            } else {
                first_page_option = Some(page);
            }
            if let Some(offset) = last_offset_option && page.as_physical() == offset + Page::SIZE {
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
        if let Some(last_offset) = last_offset_option && longest == count {
            let mut list = LinkedList::<'static, Page>::empty();
            let mut page_iter = pages.iter_mut();
            let mut should_add = false;
            let mut added_count = 0;
            while added_count < count && let Some(page) = page_iter.next() {
                should_add = should_add || page.as_physical() == last_offset;
                if should_add {
                    let page = page_iter.unlink_watched().expect("Already watched");
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
    fn alloc_split(&self, count: usize) -> Result<LinkedList<'static, Page>, OsAllocationError> {
        let pages = self.synchronized_pages();
        let mut page_iter = unsafe { pages.leak().iter_mut() };
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
    fn synchronized_pages(&self) -> SpinBox<'_, 'static, LinkedList<'static, Page>> {
        let buddies = unsafe {
            &mut *self.buddies_cell.get()
        };
        SpinBox::new(&self.lock, &mut buddies[0])
    }
    unsafe fn synchronized_buddies(&self) -> SpinBox<'_, 'static, [LinkedList<'static, Page>; MAX_UNIT_POWER + 1]> {
        let buddies = &mut *self.buddies_cell.get();
        // assert!(buddy_index < buddies.len());
        SpinBox::new(&self.lock, buddies)
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