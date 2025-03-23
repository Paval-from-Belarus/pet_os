mod allocator;
mod slab;

use core::{mem, ptr};

use slab::SlabEntry;
use static_assertions::const_assert;

use kernel_types::collections::{
    BorrowingLinkedList, LinkedList, ListNode, TinyLinkedList, TinyListNode,
};

use kernel_types::declare_constants;

use crate::memory;
use crate::memory::{
    MemoryMappingRegion, OsAllocationError, Page, PhysicalAddress,
    PhysicalAllocator, ToPhysicalAddress, VirtualAddress,
};

use super::physical::BuddyBatch;

pub enum Alignment {
    Word,
    CacheLine,
    //the machine word on such architecture
    Page, //the alignment on Page::SIZE
}

struct MemBounds {
    lower: VirtualAddress,
    upper: VirtualAddress,
}

#[repr(transparent)]
#[derive(Copy, Clone)]
pub struct SlabPiece(u16);

pub struct SystemAllocator {
    inner: spin::Mutex<SlabAllocatorInner>,
}

unsafe impl Send for SystemAllocator {}

unsafe impl Sync for SystemAllocator {}

struct SlabAllocatorInner {
    cached_entries: TinyLinkedList<'static, SlabEntry>,

    //any pool should never be empty
    used_entries: TinyLinkedList<'static, SlabEntry>,
    // free_pool: UnsafeCell<SimpleList<'static, SlabEntry>>,
    allocator: &'static PhysicalAllocator,
    //holds GlobalPageDirectory
    heap_offset: VirtualAddress, //the next free virtual address
}

//each method of this struct is thread-safe
impl SystemAllocator {
    declare_constants! {
      pub usize,
      POOL_SIZE = 4, "the default size of pool";
    }

    pub fn new(
        physical: &'static PhysicalAllocator,
        heap_offset: VirtualAddress,
    ) -> Result<SystemAllocator, OsAllocationError> {
        let mut inner = SlabAllocatorInner::new(physical, heap_offset);

        inner.enlarge_pool(Self::POOL_SIZE)?;

        Ok(Self {
            inner: spin::Mutex::new(inner),
        })
    }

    pub fn alloc(
        &'static self,
        piece: SlabPiece,
        _alignment: Alignment,
    ) -> Result<*mut u8, OsAllocationError> {
        let required_pages_count = Page::upper_bound(usize::from(piece));

        let mut inner = self.inner.lock();

        let maybe_entry = inner.find_suitable_entry(required_pages_count)?;

        let entry = if let Some(entry) = maybe_entry {
            entry
        } else {
            log::debug!("Enlarging pool");

            inner.enlarge_pool(1)?;

            let Some(entry) =
                inner.find_suitable_entry(required_pages_count)?
            else {
                return Err(OsAllocationError::NoMemory);
            };

            entry
        };

        log::debug!("Entry {entry:?} is found");

        Ok(entry.take(required_pages_count))
    }

    pub fn virtual_alloc(
        &'static self,
        bytes: usize,
    ) -> Result<*mut u8, OsAllocationError> {
        let mut inner = self.inner.lock();

        let pages_count = Page::upper_bound(bytes);

        inner.virtual_alloc(pages_count)
    }

    pub fn dealloc(&'static self, offset: VirtualAddress) {
        let mut inner = self.inner.lock();

        inner.dealloc(offset);
    }
}

impl SlabAllocatorInner {
    pub fn new(
        allocator: &'static PhysicalAllocator,
        heap_offset: VirtualAddress,
    ) -> Self {
        Self {
            cached_entries: TinyLinkedList::empty(),
            used_entries: TinyLinkedList::empty(),

            allocator,
            heap_offset,
        }
    }

    fn dealloc(&mut self, offset: VirtualAddress) {
        let entry = self
            .used_entries
            .iter_mut()
            .find(|entry| entry.holds(offset))
            .expect("Failed to find not existing slab entry");

        entry.release(offset);

        if entry.is_bloated() {
            //todo: release some pages
        }
    }

    #[must_use]
    fn virtual_alloc(
        &mut self,
        pages_count: usize,
    ) -> Result<*mut u8, OsAllocationError> {
        assert!(pages_count > 0);

        let pages = self.allocator.fast_pages(pages_count)?;
        let current_offset = self.heap_offset;

        for page in pages.iter().limit() {
            let _ = commit(page.as_physical(), self.heap_offset, 1);

            self.heap_offset += Page::SIZE;
        }

        Ok(current_offset as *mut u8)
    }

    fn find_suitable_entry(
        &mut self,
        required_pages_count: usize,
    ) -> Result<Option<&'static mut SlabEntry>, OsAllocationError> {
        let maybe_entry = self
            .used_entries
            .iter_mut()
            .find(|entry| entry.available() >= required_pages_count);

        let Some(entry) = maybe_entry else {
            return Ok(None);
        };

        Ok(Some(entry))
    }

    #[inline(never)]
    fn enlarge_pool(
        &mut self,
        entries_count: usize,
    ) -> Result<(), OsAllocationError> {
        let free_entries_count = self.cached_entries.iter().count();

        log::debug!(
            "Count = {entries_count}. Available = {free_entries_count}"
        );

        if free_entries_count < entries_count {
            let additional_pages = Page::upper_bound(
                (entries_count - free_entries_count)
                    * mem::size_of::<SlabEntry>(),
            );

            let pages_batch = self.allocator.alloc_pages(additional_pages)?;

            let new_entries = self.commit_new_entries(pages_batch);
            self.cached_entries.splice(new_entries);
        }

        let heap_batch = self.allocator.alloc_pages(
            entries_count * SlabEntry::DEFAULT_SLAB_SIZE_IN_PAGES,
        )?;

        assert_eq!(
            heap_batch.len(),
            entries_count * SlabEntry::DEFAULT_SLAB_SIZE_IN_PAGES
        );

        let mut entry_iter = self.cached_entries.iter_mut();

        let mut page_iter = heap_batch.into_pages().iter_mut();

        for _ in 0..entries_count {
            let _ = entry_iter
                .next()
                .expect("Page pool should be enough for heap");

            let entry =
                entry_iter.unlink_watched().expect("Is watched already");

            let mut cached_pages = LinkedList::<Page>::empty();

            for _ in 0..SlabEntry::DEFAULT_SLAB_SIZE_IN_PAGES {
                let page = page_iter.next().unwrap();

                cached_pages.push_front(page.as_node());
            }

            let physical_offset = cached_pages
                .iter()
                .nth(0)
                .expect("We simply push in list")
                .as_physical();

            let slab_offset = commit(
                physical_offset,
                self.heap_offset,
                SlabEntry::DEFAULT_SLAB_SIZE_IN_PAGES,
            );

            self.heap_offset +=
                Page::SIZE * SlabEntry::DEFAULT_SLAB_SIZE_IN_PAGES;

            entry.set(
                slab_offset,
                cached_pages,
                SlabEntry::DEFAULT_SLAB_SIZE_IN_PAGES,
            );

            self.used_entries.push_front(entry);
        }

        Ok(())
    }

    fn commit_new_entries(
        &mut self,
        batch: BuddyBatch,
    ) -> TinyLinkedList<'static, SlabEntry> {
        const ENTRIES_PER_PAGE: usize =
            Page::SIZE / mem::size_of::<SlabEntry>();

        const_assert!(ENTRIES_PER_PAGE > 0);

        let mut entries = TinyLinkedList::<SlabEntry>::empty();

        for page in batch.into_pages() {
            let committed_offset =
                commit(page.as_physical(), self.heap_offset, 1)
                    .cast::<SlabEntry>();

            self.heap_offset += Page::SIZE;

            let mut current_node =
                unsafe { committed_offset.add(ENTRIES_PER_PAGE - 1) };

            let mut next_list_node: *mut TinyListNode<SlabEntry> =
                ptr::null_mut();

            for _ in 0..ENTRIES_PER_PAGE {
                let node = unsafe {
                    let next_node = if next_list_node.is_null() {
                        None
                    } else {
                        Some(&mut *next_list_node)
                    };

                    let node = TinyListNode::new(next_node);

                    current_node.write(SlabEntry::new(node));

                    &mut *current_node
                };

                next_list_node = node.as_next();

                entries.push_front(node.as_next());

                unsafe {
                    current_node = current_node.sub(1);
                }
            }
        }

        entries
    }
}

/// commit current heap_offset
/// return the next offset
#[inline(never)]
#[must_use]
fn commit(
    memory_offset: PhysicalAddress,
    heap_offset: VirtualAddress,
    count: usize,
) -> *mut u8 {
    let region = MemoryMappingRegion {
        node: unsafe { ListNode::empty() },
        flags: memory::KERNEL_LAYOUT_FLAGS,
        virtual_offset: heap_offset,
        physical_offset: memory_offset,
        page_count: count,
    };

    log::debug!("Region will be commited for heap (at {:0X})", heap_offset);

    memory::kernel_commit(region).expect("Failed to commit kernel heap memory");

    let committed_offset = heap_offset;

    committed_offset as *mut u8
}
