mod allocator;
mod object;
mod slab_entry;
mod slab_head;

use core::mem;
use core::mem::MaybeUninit;

use kernel_macro::ListNode;
use slab_entry::{SlabEntry, MAX_SLAB_CAPACITY};
use slab_head::SlabHead;

use kernel_types::collections::{BorrowingLinkedList, LinkedList, ListNode};

use kernel_types::declare_constants;

use crate::memory::{self};
use crate::memory::{
    AllocError, MemoryMappingRegion, Page, PhysicalAddress, PhysicalAllocator,
    ToPhysicalAddress, VirtualAddress,
};

use super::physical::BuddyBatch;

pub type SlabName = &'static str;
pub const MAX_SLAB_OBJECT_SIZE: usize = u16::MAX as usize;
pub use object::{classify_slab_by_size, Slab};

#[derive(Debug, Clone, Copy)]
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
pub struct SlabSize(u16);

#[derive(Debug, Clone)]
pub struct SlabAlloc {
    pub name: &'static str,
    pub size: u16,
    pub alignment: Alignment,
}

pub struct SystemAllocator {
    inner: spin::Mutex<SlabAllocatorInner>,
}

unsafe impl Send for SystemAllocator {}

unsafe impl Sync for SystemAllocator {}

const RESERVED_SLAB_HEAD: SlabName = "reserved";

struct SlabAllocatorInner {
    heads: LinkedList<'static, SlabHead>,
    //the list of unu
    cached_heads: LinkedList<'static, SlabHead>,
    cached_entries: LinkedList<'static, SlabEntry>,

    heap_snapshots: LinkedList<'static, HeapSnapshot>,

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
    ) -> Result<SystemAllocator, AllocError> {
        let inner = SlabAllocatorInner::new(physical, heap_offset);

        Ok(Self {
            inner: spin::Mutex::new(inner),
        })
    }

    pub fn alloc_slab(
        &'static self,
        allocation: SlabAlloc,
    ) -> Result<*mut u8, AllocError> {
        log::debug!("Allocating slab {}", allocation.name);

        let mut inner = self.inner.try_lock().unwrap();

        let head = inner.find_head(&allocation)?;

        match head.try_alloc() {
            Some(offset) => Ok(offset as *mut u8),
            None => {
                let entries = inner.alloc_entries(1, allocation.size)?;

                head.extend_with_free_entries(entries);

                let offset =
                    head.try_alloc().expect("New entries are submitted");

                Ok(offset as *mut u8)
            }
        }
    }

    pub fn dealloc_slab(&'static self, name: SlabName, ptr: *mut u8) {
        let offset = ptr as VirtualAddress;

        let mut inner = self.inner.try_lock().unwrap();

        let Some(head) = inner.heads.iter_mut().find(|head| head.name.eq(name))
        else {
            panic!("Unknown slab with name = {name}");
        };

        head.dealloc(offset);
    }

    pub fn virtual_alloc(
        &'static self,
        bytes: usize,
    ) -> Result<*mut u8, AllocError> {
        let pages_count = Page::upper_bound(bytes);

        let mut inner = self.inner.try_lock().unwrap();

        inner.virtual_alloc(pages_count)
    }

    pub fn virtual_dealloc(
        &'static self,
        offset: VirtualAddress,
        size_in_bytes: usize,
    ) {
        let pages_count = Page::upper_bound(size_in_bytes);

        let mut inner = self.inner.try_lock().unwrap();

        inner.virtual_dealloc(offset, pages_count);
    }
}

#[derive(ListNode)]
pub struct HeapSnapshot {
    #[list_pivots]
    node: ListNode<HeapSnapshot>,
    pub offset: VirtualAddress,
}

impl SlabAllocatorInner {
    pub fn new(
        allocator: &'static PhysicalAllocator,
        heap_offset: VirtualAddress,
    ) -> Self {
        Self {
            heads: LinkedList::empty(),
            heap_snapshots: LinkedList::empty(),

            cached_heads: LinkedList::empty(),
            cached_entries: LinkedList::empty(),

            allocator,
            heap_offset,
        }
    }

    pub fn find_head(
        &mut self,
        allocation: &SlabAlloc,
    ) -> Result<&'static mut SlabHead, AllocError> {
        let existing_head = self
            .heads
            .iter_mut()
            .find(|head| head.name.eq(allocation.name));

        let head = if let Some(head) = existing_head {
            head
        } else {
            self.alloc_head(allocation)?
        };

        Ok(head)
    }

    fn virtual_alloc(
        &mut self,
        pages_count: usize,
    ) -> Result<*mut u8, AllocError> {
        assert!(pages_count > 0);

        let pages = self.allocator.alloc_zeroed_pages(pages_count)?;

        let heap_start_offset = self.move_heap_offset(pages_count);

        let mut page_offset = heap_start_offset;
        for page in pages.iter() {
            let _ = commit(page.as_physical(), page_offset, 1);

            page_offset += Page::SIZE;
        }

        Ok(heap_start_offset as *mut u8)
    }

    fn virtual_dealloc(
        &mut self,
        _offset: VirtualAddress,
        _pages_count: usize,
    ) {
    }

    fn alloc_head(
        &mut self,
        allocation: &SlabAlloc,
    ) -> Result<&'static mut SlabHead, AllocError> {
        const HEADS_IN_PAGE: usize = Page::SIZE / mem::size_of::<SlabHead>();
        static_assertions::const_assert!(HEADS_IN_PAGE >= 1);

        if let Some(head) = self.cached_heads.remove_first() {
            head.name = allocation.name;
            return Ok(&mut *head);
        }

        let pages = self.allocator.alloc_continuous_pages(1)?.into_pages();
        assert!(pages.len() == 1);

        let page = &mut pages[0];

        let heap_offset = self.move_heap_offset(1);

        let head_ptr = commit(page.as_physical(), heap_offset, 1)
            .cast::<MaybeUninit<SlabHead>>();

        let heads =
            unsafe { core::slice::from_raw_parts_mut(head_ptr, HEADS_IN_PAGE) };

        for uninit_head in heads.iter_mut() {
            uninit_head.write(SlabHead::new(RESERVED_SLAB_HEAD));

            let head = unsafe { uninit_head.assume_init_mut() };

            self.cached_heads.push_back(head.as_node());
        }

        let head = self.cached_heads.remove_first().unwrap();

        head.name = allocation.name;

        Ok(head)
    }
    //alloc at least desireable count of pages
    fn alloc_entries(
        &mut self,
        count: usize,
        object_size: u16,
    ) -> Result<LinkedList<'static, SlabEntry>, AllocError> {
        assert!(object_size > 0);

        let slab_size_in_pages =
            Page::upper_bound(object_size as usize * MAX_SLAB_CAPACITY);

        if self.cached_entries.len() < count {
            let pages_to_alloc =
                Page::upper_bound(count * mem::size_of::<SlabEntry>());

            let allocated_pages =
                self.allocator.alloc_continuous_pages(pages_to_alloc)?;

            let commited_entries =
                self.commit_new_entries(allocated_pages, object_size);

            self.cached_entries.splice(commited_entries);
        }

        let mut entries = {
            let mut iter = self.cached_entries.iter_mut();
            let mut list = LinkedList::empty();

            for _ in 0..count {
                let _ = iter.next();

                let entry = iter.unlink_watched().unwrap();
                list.push_back(entry.as_next());
            }

            list
        };

        for entry in entries.iter_mut() {
            log::debug!("Configuring entry");

            let entry_pages = self
                .allocator
                .alloc_continuous_pages(slab_size_in_pages)
                .expect("Failed to allocate heap for slab entry")
                .into_pages();

            let physical_offset = entry_pages[0].as_physical();

            let heap_offset = self.move_heap_offset(slab_size_in_pages);

            let slab_heap_offset =
                commit(physical_offset, heap_offset, slab_size_in_pages);

            unsafe { entry.set(slab_heap_offset, entry_pages) }
        }

        Ok(entries)
    }

    fn commit_new_entries(
        &mut self,
        batch: BuddyBatch,
        object_size: u16,
    ) -> LinkedList<'static, SlabEntry> {
        const ENTRIES_PER_PAGE: usize =
            Page::SIZE / mem::size_of::<SlabEntry>();
        static_assertions::const_assert!(ENTRIES_PER_PAGE > 0);

        let mut list = LinkedList::<SlabEntry>::empty();

        for page in batch.into_pages() {
            let committed_offset =
                commit(page.as_physical(), self.move_heap_offset(1), 1)
                    .cast::<MaybeUninit<SlabEntry>>();

            let page_entries = unsafe {
                core::slice::from_raw_parts_mut(
                    committed_offset,
                    ENTRIES_PER_PAGE,
                )
            };

            for uninit_entry in page_entries.iter_mut() {
                uninit_entry.write(SlabEntry::new(object_size));

                let entry = unsafe { uninit_entry.assume_init_mut() };
                list.push_back(entry.as_next());
            }
        }

        list
    }

    //take heap offset available for requested pages count
    fn move_heap_offset(&mut self, pages_count: usize) -> VirtualAddress {
        let old_heap_offset = self.heap_offset;

        self.heap_offset += Page::SIZE * pages_count;

        old_heap_offset
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
