mod allocator;
mod slab_entry;
mod slab_head;

use core::{mem, ptr};

use slab_entry::{SlabEntry, MAX_SLAB_CAPACITY};
use slab_head::SlabHead;
use static_assertions::const_assert;

use kernel_types::collections::{
    BorrowingLinkedList, LinkedList, ListNode, TinyLinkedList, TinyListNode,
};

use kernel_types::declare_constants;

use crate::memory;
use crate::memory::{
    AllocError, MemoryMappingRegion, Page, PhysicalAddress, PhysicalAllocator,
    ToPhysicalAddress, VirtualAddress,
};

use super::physical::BuddyBatch;

pub type SlabName = &'static str;

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
pub struct SlabAlloc<'a> {
    pub name: &'a str,
    pub size: u16,
    pub alignment: Alignment,
}

pub struct SystemAllocator {
    inner: spin::Mutex<SlabAllocatorInner>,
}

unsafe impl Send for SystemAllocator {}

unsafe impl Sync for SystemAllocator {}

struct SlabAllocatorInner {
    heads: LinkedList<'static, SlabHead>,

    // cached_entries: TinyLinkedList<'static, SlabEntry>,

    //any pool should never be empty
    // used_entries: TinyLinkedList<'static, SlabEntry>,
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
        let mut inner = self.inner.try_lock().unwrap();

        let head = inner.find_head(&allocation)?;

        if let Some(offset) = head.try_alloc() {
            return Ok(offset as *mut u8);
        }

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

impl SlabAllocatorInner {
    pub fn new(
        allocator: &'static PhysicalAllocator,
        heap_offset: VirtualAddress,
    ) -> Self {
        Self {
            heads: LinkedList::empty(),

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
            todo!()
            // self.alloc_head(name, size)?
        };

        Ok(head)
    }

    #[must_use]
    fn virtual_alloc(
        &mut self,
        pages_count: usize,
    ) -> Result<*mut u8, AllocError> {
        assert!(pages_count > 0);

        let pages = self.allocator.alloc_zeroed_pages(pages_count)?;
        let current_offset = self.heap_offset;

        for page in pages.iter() {
            let _ = commit(page.as_physical(), self.heap_offset, 1);

            self.heap_offset += Page::SIZE;
        }

        Ok(current_offset as *mut u8)
    }

    fn virtual_dealloc(
        &mut self,
        _offset: VirtualAddress,
        _pages_count: usize,
    ) {
    }
    //alloc at least desireable count of pages
    fn alloc_entries(
        &mut self,
        count: usize,
        object_size: u16,
    ) -> Result<TinyLinkedList<'static, SlabEntry>, AllocError> {
        assert!(object_size > 0);

        let slab_size_in_pages =
            Page::upper_bound(object_size as usize * MAX_SLAB_CAPACITY);

        let pages_to_alloc =
            Page::upper_bound(count * mem::size_of::<SlabEntry>());

        let allocated_pages =
            self.allocator.alloc_continuous_pages(pages_to_alloc)?;

        let mut allocated_entries =
            self.commit_new_entries(allocated_pages, object_size);

        for entry in allocated_entries.iter_mut() {
            let entry_pages = self
                .allocator
                .alloc_continuous_pages(slab_size_in_pages)
                .expect("Failed to allocate heap for slab entry")
                .into_pages();

            let physical_offset = entry_pages[0].as_physical();

            let slab_heap_offset =
                commit(physical_offset, self.heap_offset, slab_size_in_pages);

            self.heap_offset += Page::SIZE * slab_size_in_pages;

            unsafe { entry.set(slab_heap_offset, entry_pages) }
        }

        Ok(allocated_entries)
    }

    fn commit_new_entries(
        &mut self,
        batch: BuddyBatch,
        object_size: u16,
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

                    current_node.write(SlabEntry::new(node, object_size));

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
