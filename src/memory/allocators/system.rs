use core::{mem, ptr};
use core::cell::UnsafeCell;
use core::ops::Add;
use core::ptr::NonNull;
use static_assertions::{const_assert};
use crate::{declare_constants, log, memory};
use crate::memory::{MemoryMappingRegion, OsAllocationError, Page, PhysicalAddress, PhysicalAllocator, ToPhysicalAddress, VirtualAddress};
use crate::utils::{LinkedList, SimpleList, SimpleListNode, SpinBox, Zeroed};
use crate::utils::atomics::SpinLock;

pub enum Alignment {
    Word,
    //the machine word on such architecture
    Page, //the alignment on Page::SIZE
}

struct MemBounds {
    lower: VirtualAddress,
    upper: VirtualAddress,
}

pub struct SlabAllocator {
    inner: UnsafeCell<SlabAllocatorInner>,
    //the list of entries ready to be used
    free_pool: UnsafeCell<SimpleList<'static, SlabEntry>>,
    lock: SpinLock,
}

struct SlabAllocatorInner {
    //any pool should never be empty
    page_pool: SimpleList<'static, SlabEntry>,
    // free_pool: UnsafeCell<SimpleList<'static, SlabEntry>>,
    allocator: &'static PhysicalAllocator,
    //holds GlobalPageDirectory
    heap_offset: VirtualAddress,//the next free virtual address
}

struct SlabEntry {
    offset: VirtualAddress,
    count: usize,
    capacity: usize,
    //the count of memory unit in next pool
    pages: LinkedList<'static, Page>,
    reserved: Zeroed<[usize; 2]>,
}
const_assert!(Page::SIZE % core::mem::size_of::<SimpleListNode<SlabEntry>>() == 0);
#[repr(transparent)]
#[derive(Copy, Clone)]
pub struct SlabPiece(u16);

impl SlabPiece {
    pub const fn with_capacity(size: u16) -> Self {
        debug_assert!(size < u16::MAX);
        Self(size)
    }
}

impl From<SlabPiece> for usize {
    fn from(value: SlabPiece) -> Self {
        value.0 as usize
    }
}

impl SlabEntry {
    declare_constants!(
        pub usize,
        DEFAULT_SLAB_SIZE = 4, "The count of pages for slab entry";
        MAX_SLAB_SIZE = 16, "The maximal count of pages for slab entry";
    );
    //the size in bytes
    pub fn empty() -> Self {
        Self {
            offset: VirtualAddress::NULL,
            count: 0,
            capacity: 0,
            pages: LinkedList::empty(),
            reserved: Zeroed::default(),
        }
    }
    pub fn holds(&self, offset: VirtualAddress) -> bool {
        let distance = (offset as isize) - (self.offset as isize);
        distance >= 0 && (distance as usize) < Page::SIZE * self.count
    }
    pub fn take(&mut self, pages_count: usize) -> VirtualAddress {
        debug_assert!(self.available() >= pages_count);
        let take_offset = self.offset + self.count * Page::SIZE;
        self.count += pages_count;
        take_offset
    }
    pub fn release(&mut self, offset: VirtualAddress) {
        //not implemented
    }

    pub fn set(&mut self,
               offset: VirtualAddress,
               pages: LinkedList<'static, Page>,
               pages_count: usize) {
        self.offset = offset;
        self.capacity = pages_count;
        self.count = 0;
        self.pages = pages;
    }
    pub fn get_pages(&mut self) -> &mut LinkedList<'static, Page> {
        &mut self.pages
    }
    pub fn set_pages(&mut self, pages: LinkedList<'static, Page>) {
        self.pages = pages;
    }
    ///@return the total pages in slab available to alloc
    pub fn available(&self) -> usize {
        self.capacity - self.count
    }
    pub fn total_available(&self) -> usize {
        Self::MAX_SLAB_SIZE - self.count
    }
    pub const fn is_empty(&self) -> bool {
        self.capacity == 0
    }
    pub const fn is_bloated(&self) -> bool {
        self.count > self.capacity / 2
    }
    pub const fn is_full(&self) -> bool {
        self.count == self.capacity
    }
}

//each method of this struct is thread-safe
impl SlabAllocator {
    declare_constants!(
      pub usize,
      POOL_SIZE = 4, "the default size of pool";
    );
    pub fn new(allocator: &'static PhysicalAllocator,
               heap_offset: VirtualAddress,
    ) -> Result<SlabAllocator, OsAllocationError> {
        let mut free_pool = SimpleList::<'static, SlabEntry>::empty();
        let mut inner = SlabAllocatorInner::empty(allocator,
                                                  heap_offset);
        inner.enlarge_pool(&mut free_pool, Self::POOL_SIZE)?;
        Ok(Self {
            inner: UnsafeCell::new(inner),
            free_pool: UnsafeCell::new(free_pool),
            lock: SpinLock::new(),
        })
    }
    pub fn alloc(&'static self, piece: SlabPiece, _alignment: Alignment) -> Result<VirtualAddress, OsAllocationError> {
        let inner = self.synchronized_inner();
        let free_entries = self.free_pool();
        let mut raw_inner = unsafe { NonNull::from(inner.leak()) };
        let required_pages_count = Page::upper_bound(usize::from(piece));
        let entry_option = unsafe { raw_inner.as_mut().find_suitable_entry(required_pages_count)? };
        let entry = match entry_option {
            None => unsafe {
                raw_inner.as_mut().enlarge_pool(free_entries, 1)?;
                raw_inner.as_mut().find_suitable_entry(required_pages_count)?
                    .expect("Failed to find slab entry")
            }
            Some(entry) => entry
        };
        Ok(entry.take(required_pages_count))
    }
    pub fn dealloc(&'static mut self, offset: VirtualAddress) {
        let inner = self.synchronized_inner();
        unsafe { inner.leak().dealloc(offset) };
    }
    fn free_pool(&self) -> &'static mut SimpleList<SlabEntry> {
        unsafe { &mut *self.free_pool.get() }
    }
    fn synchronized_inner(&self) -> SpinBox<'_, 'static, SlabAllocatorInner> {
        let inner = unsafe { &mut *self.inner.get() };
        SpinBox::new(&self.lock, inner)
    }
}

impl SlabAllocatorInner {
    pub fn empty(
        allocator: &'static PhysicalAllocator,
        heap_offset: VirtualAddress,
    ) -> Self {
        Self {
            page_pool: SimpleList::empty(),
            allocator,
            heap_offset,
        }
    }
    // pub fn new(allocator: &'static PhysicalAllocator,
    //            free_pool: &'static mut SimpleList<SlabEntry>,
    //            heap_offset: VirtualAddress,//th
    // ) -> Result<SlabAllocatorInner, OsAllocationError> {
    //     let mut empty_allocator = Self::empty(allocator,
    //                                           heap_offset);
    //     empty_allocator.enlarge_pool(free_pool, Self::POOL_SIZE)?;
    //     Ok(empty_allocator)
    // }
    fn dealloc(&'static mut self, offset: VirtualAddress) {
        let entry = self.page_pool.iter_mut()
            .find(|entry| entry.holds(offset))
            .expect("Failed to find not existing slab entry");
        entry.release(offset);
        if entry.is_bloated() {
            //todo: release some pages
        }
    }

    fn find_suitable_entry(&mut self, required_pages_count: usize) -> Result<Option<&'static mut SlabEntry>, OsAllocationError> {
        let entry_option = self.page_pool.iter_mut()
            .find(|entry| entry.total_available() >= required_pages_count);
        match entry_option {
            None => Ok(None),
            Some(entry) => unsafe {
                if entry.available() >= required_pages_count {
                    return Ok(Some(entry));
                }
                let mut raw_entry = NonNull::from(entry);
                let pages = raw_entry.as_mut().get_pages();
                for page in pages.iter_mut() {
                    self.allocator.dealloc_page(page)
                }
                let pages = self.allocator.alloc_pages(required_pages_count)?;
                raw_entry.as_mut().set_pages(pages);
                Ok(Some(raw_entry.as_mut()))
            }
        }
    }
    fn enlarge_pool(&mut self, free_entries: &mut SimpleList<'static, SlabEntry>, entries_count: usize) -> Result<(), OsAllocationError> {
        let free_entries_count = free_entries.size();
        if free_entries_count < entries_count {
            let additional_pages = Page::upper_bound((entries_count - free_entries_count) * mem::size_of::<SimpleListNode<SlabEntry>>());
            let pages = self.allocator.alloc_pages(additional_pages)?;
            let new_entries = self.commit_new_entries(pages);
            free_entries.splice(new_entries);
        }
        let mut heap_pages = self.allocator.alloc_pages(entries_count * SlabEntry::DEFAULT_SLAB_SIZE)?;
        let mut page_iter = heap_pages.iter_mut();
        let mut entry_iter = free_entries.iter_mut();
        for _ in 0..entries_count {
            let _ = entry_iter.next().expect("Page pool should be enough for heap");
            let entry = entry_iter.unlink_watched().expect("Is watched already");
            let mut cached_pages = LinkedList::<Page>::empty();
            for _ in 0..SlabEntry::DEFAULT_SLAB_SIZE {
                let _ = page_iter.next().expect("We already allocate enough memory");
                let page = page_iter.unlink_watched().expect("Already checked");
                unsafe { cached_pages.push_front(page) };
            }
            let physical_offset = cached_pages.iter()
                .nth(0)
                .expect("We simply push in list")
                .as_physical();
            let slab_offset = self.commit(physical_offset, SlabEntry::DEFAULT_SLAB_SIZE) as VirtualAddress;
            entry.set(slab_offset, cached_pages, SlabEntry::DEFAULT_SLAB_SIZE);
            self.page_pool.push_front(entry);
        }
        Ok(())
    }
    fn commit_new_entries(&mut self, pages: LinkedList<Page>) -> SimpleList<'static, SlabEntry> {
        debug_assert!(!pages.is_empty());
        const ENTRIES_PER_PAGE: usize = Page::SIZE / mem::size_of::<SlabEntry>();
        const_assert!(ENTRIES_PER_PAGE > 0);
        let mut entries = SimpleList::<SlabEntry>::empty();
        for page in pages.iter() {
            let page_offset = page.as_physical();
            let committed_offset = self
                .commit(page_offset, 1)
                .cast::<SimpleListNode<SlabEntry>>();
            let mut current_node = unsafe { committed_offset.add(ENTRIES_PER_PAGE - 1) };
            let mut next_node: *mut SimpleListNode<SlabEntry> = ptr::null_mut();
            for _ in 0..ENTRIES_PER_PAGE {
                let entry = SlabEntry::empty();
                let node = unsafe {
                    let node = SimpleListNode::new(entry, next_node);
                    current_node.write(node);
                    &mut *current_node
                };
                next_node = node;
                entries.push_front(node);
                current_node = unsafe { current_node.sub(1) };
            }
        }
        entries
    }

    //commit current heap_offset
    ///return the next offset
    fn commit(&mut self, offset: PhysicalAddress, count: usize) -> *mut u8 {
        let region = MemoryMappingRegion {
            flags: memory::KERNEL_LAYOUT_FLAGS,
            virtual_offset: self.heap_offset,
            physical_offset: offset,
            page_count: count,
        };
        memory::kernel_commit(region).expect("Failed to commit kernel heap memory");
        let committed_offset = self.heap_offset;
        //no additional check because marker is not failed
        self.heap_offset = self.heap_offset.add(Page::SIZE * count);
        committed_offset as *mut u8
    }
}