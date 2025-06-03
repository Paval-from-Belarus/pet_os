mod allocator;
mod object;
mod slab_entry;
mod slab_head;
mod tree;

use allocator::SlabAllocator;

use kernel_types::declare_constants;
use tree::SlabTree;

use crate::memory::{AllocError, Page, PhysicalAllocator, VirtualAddress};

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

pub enum AllocContext {
    Kernel,
    Interrupt,
}

struct MemBounds {
    lower: VirtualAddress,
    upper: VirtualAddress,
}

#[repr(transparent)]
#[derive(Copy, Clone)]
pub struct SlabSize(u16);

bitflags::bitflags! {
    #[derive(Default, Clone, Copy)]
    pub struct MemoryAllocationFlag: u8 {
        const ZEROED = 0x01;
        const CONTINOUS = 0x02;
        /// all memory regions are read by default
        const WRITE = 0x04;
        const READ = 0x08;
        const READ_WRITE = Self::WRITE.bits() | Self::READ.bits();
    }
}

#[derive(Debug, Clone)]
pub struct SlabAlloc {
    pub name: &'static str,
    pub size: u16,
    pub alignment: Alignment,
}

pub struct SystemAllocator {
    tree: spin::Mutex<SlabTree>,
    allocator: spin::Mutex<SlabAllocator>,
}

unsafe impl Send for SystemAllocator {}

unsafe impl Sync for SystemAllocator {}

const RESERVED_SLAB_HEAD: SlabName = "reserved";

//each method of this struct is thread-safe
impl SystemAllocator {
    declare_constants! {
      pub usize,
      POOL_SIZE = 4, "the default size of pool";
    }

    pub fn new(
        allocator: &'static PhysicalAllocator,
        heap_offset: VirtualAddress,
    ) -> Result<SystemAllocator, AllocError> {
        let allocator = SlabAllocator::new(allocator, heap_offset);
        let tree = SlabTree::new();

        Ok(Self {
            tree: spin::Mutex::new(tree),
            allocator: spin::Mutex::new(allocator),
        })
    }

    pub fn alloc_slab(
        &'static self,
        allocation: SlabAlloc,
    ) -> Result<*mut u8, AllocError> {
        log::debug!("Allocating slab {:?}", allocation);

        let mut tree = self.tree.try_lock().unwrap();

        let head = tree.find_head_or_alloc(allocation.name, || {
            let mut allocator = self.allocator.try_lock().unwrap();

            allocator.alloc_slab_head(&allocation)
        })?;

        match head.try_alloc() {
            Some(offset) => Ok(offset as *mut u8),
            None => {
                let entries = {
                    let mut allocator = self.allocator.try_lock().unwrap();

                    allocator.alloc_slab_entries(1, allocation.size)?
                };

                head.extend_with_free_entries(entries);

                let offset =
                    head.try_alloc().expect("New entries are submitted");

                Ok(offset as *mut u8)
            }
        }
    }

    pub fn dealloc_slab(&'static self, name: SlabName, ptr: *mut u8) {
        let offset = ptr as VirtualAddress;

        let mut tree = self.tree.try_lock().unwrap();

        let Some(head) = tree.find_head(name) else {
            panic!("Unknown slab with name = {name}");
        };

        head.dealloc(offset);
    }

    pub fn virtual_alloc(
        &'static self,
        bytes: usize,
        flags: MemoryAllocationFlag,
    ) -> Result<*mut u8, AllocError> {
        log::debug!("Virtual alloc: {bytes}");

        let pages_count = Page::upper_bound(bytes);

        let mut allocator = self.allocator.try_lock().unwrap();

        allocator.virtual_alloc(pages_count, flags)
    }

    pub fn virtual_dealloc(
        &'static self,
        offset: VirtualAddress,
        size_in_bytes: usize,
    ) {
        let pages_count = Page::upper_bound(size_in_bytes);

        let mut allocator = self.allocator.try_lock().unwrap();

        allocator.virtual_dealloc(offset, pages_count);
    }
}
