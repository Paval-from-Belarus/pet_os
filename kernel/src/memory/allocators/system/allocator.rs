use core::mem::{self, MaybeUninit};

use kernel_macro::ListNode;
use kernel_types::collections::{LinkedList, ListNode};

use crate::memory::{
    self,
    allocators::{
        physical::BuddyBatch,
        system::{slab_entry::MAX_SLAB_CAPACITY, RESERVED_SLAB_HEAD},
    },
    AllocError, MemoryMappingRegion, Page, PhysicalAddress, PhysicalAllocator,
    ToPhysicalAddress, VirtualAddress,
};

use super::{
    slab_entry::SlabEntry, slab_head::SlabHead, MemoryAllocationFlag, SlabAlloc,
};

#[derive(ListNode)]
pub struct HeapSnapshot {
    #[list_pivots]
    node: ListNode<HeapSnapshot>,
    pub offset: VirtualAddress,
}

pub struct SlabAllocator {
    //the list of unu
    cached_heads: LinkedList<'static, SlabHead>,
    cached_entries: LinkedList<'static, SlabEntry>,

    allocator: &'static PhysicalAllocator,
    heap_snapshots: LinkedList<'static, HeapSnapshot>,

    //holds GlobalPageDirectory
    heap_offset: VirtualAddress, //the next free virtual address
}

impl SlabAllocator {
    pub fn new(
        allocator: &'static PhysicalAllocator,
        heap_offset: VirtualAddress,
    ) -> Self {
        Self {
            allocator,
            heap_offset,

            cached_entries: LinkedList::empty(),
            cached_heads: LinkedList::empty(),
            heap_snapshots: LinkedList::empty(),
        }
    }

    pub fn map_page(&mut self, pages: &[Page]) -> Result<*mut u8, AllocError> {
        assert!(pages.len() > 0);

        let heap_offset = self.move_heap_offset(pages.len());
        let memory_offset = pages.first().unwrap().as_physical();

        Ok(commit(memory_offset, heap_offset, pages.len()))
    }

    pub fn unmap_page(&mut self, ptr: *mut u8, pages_count: usize) {
        self.restore_heap(ptr as VirtualAddress, pages_count);
    }

    pub fn virtual_alloc(
        &mut self,
        pages_count: usize,
        _flags: MemoryAllocationFlag,
    ) -> Result<*mut u8, AllocError> {
        assert!(pages_count > 0);

        let pages = self.allocator.alloc_zeroed_pages(pages_count)?;

        let heap_start_offset = self.move_heap_offset(pages_count);

        let mut page_offset = heap_start_offset;

        assert_eq!(pages.len(), pages_count);

        for page in pages.iter() {
            let _ = commit(page.as_physical(), page_offset, 1);

            page_offset += Page::SIZE;
        }

        Ok(heap_start_offset as *mut u8)
    }

    pub fn virtual_dealloc(
        &mut self,
        _offset: VirtualAddress,
        _pages_count: usize,
    ) {
    }

    pub fn alloc_slab_head(
        &mut self,
        allocation: &SlabAlloc,
    ) -> Result<&'static mut SlabHead, AllocError> {
        const HEADS_IN_PAGE: usize = Page::SIZE / mem::size_of::<SlabHead>();
        static_assertions::const_assert!(HEADS_IN_PAGE >= 1);

        if let Some(head) = self.cached_heads.remove_first() {
            head.name = allocation.name;
            return Ok(&mut *head);
        }

        let pages = self.allocator.alloc_continuous_pages(1)?.into_slice();
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

    pub fn alloc_slab_entries(
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

            let mut commited_entries = self.commit_new_entries(allocated_pages);

            self.cached_entries.splice(&mut commited_entries);
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
            let entry_pages = self
                .allocator
                .alloc_continuous_pages(slab_size_in_pages)
                .expect("Failed to allocate heap for slab entry")
                .into_slice();

            let physical_offset = entry_pages[0].as_physical();

            let heap_offset = self.move_heap_offset(slab_size_in_pages);

            let slab_heap_offset =
                commit(physical_offset, heap_offset, slab_size_in_pages);

            unsafe { entry.set(object_size, slab_heap_offset, entry_pages) }
        }

        Ok(entries)
    }

    //alloc at least desireable count of pages
    fn commit_new_entries(
        &mut self,
        batch: BuddyBatch,
    ) -> LinkedList<'static, SlabEntry> {
        const ENTRIES_PER_PAGE: usize =
            Page::SIZE / mem::size_of::<SlabEntry>();
        static_assertions::const_assert!(ENTRIES_PER_PAGE > 0);

        let mut list = LinkedList::<SlabEntry>::empty();

        for page in batch.into_slice() {
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
                uninit_entry.write(SlabEntry::new_uninit());

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

    fn restore_heap(
        &mut self,
        _heap_offset: VirtualAddress,
        _pages_count: usize,
    ) {
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
        flags: memory::MemoryMappingFlag::KERNEL_LAYOUT,
        virtual_offset: heap_offset,
        physical_offset: memory_offset,
        page_count: count,
    };

    log::debug!("Region will be commited for heap (at {:0X})", heap_offset);

    memory::kernel_commit(region).expect("Failed to commit kernel heap memory");

    let committed_offset = heap_offset;

    committed_offset as *mut u8
}
