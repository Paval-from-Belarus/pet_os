use core::{ops::Range, ptr::NonNull};

use kernel_macro::ListNode;
use kernel_types::collections::{BoxedNode, LinkedList, ListNode};

use super::{
    slab_alloc, virtual_alloc, virtual_dealloc, AllocError, Page, Slab,
    SlabBox, VirtualAddress,
};

pub struct MemoryRegionBox {
    region: SlabBox<MemoryRegion>,
}

/// The region of continous virtual memory
#[derive(Debug, ListNode)]
#[repr(C)]
pub struct MemoryRegion {
    #[list_pivots]
    node: ListNode<MemoryRegion>,
    // parent: NonNull<ProcessState>,
    pub range: Range<VirtualAddress>,
    pub flag: MemoryRegionFlag,
    //mapped_file: MemoryMappedFile,
    //file_offset: usize
    pub pages: LinkedList<'static, Page>,
}

bitflags::bitflags! {
    #[derive(Debug, Clone, Copy)]
    pub struct MemoryRegionFlag: u8 {
        const READ = 0x01;
        const WRITE = 0x02;
        const EXEC = 0x04;

        const SHARED = 0x08;

        const SEQ_READ = 0x10;
        const RAND_READ = 0x20;
    }
}

impl MemoryRegion {
    /// Create new region with no underlying physical memory
    pub unsafe fn empty(
        range: Range<VirtualAddress>,
        flag: MemoryRegionFlag,
    ) -> Result<MemoryRegionBox, AllocError> {
        let region = slab_alloc(Self {
            node: ListNode::empty(),
            pages: LinkedList::empty(),
            flag,
            range,
        })?;

        Ok(MemoryRegionBox { region })
    }

    pub fn new_uninit(
        size: usize,
        flag: MemoryRegionFlag,
    ) -> Result<MemoryRegionBox, AllocError> {
        assert!(size % Page::SIZE == 0);

        let offset = virtual_alloc(size, flag)?;

        unsafe { Self::empty(offset..(offset + size), flag) }
    }

    pub fn new_zeroed(
        size: usize,
        flag: MemoryRegionFlag,
    ) -> Result<MemoryRegionBox, AllocError> {
        let mut region = Self::new_uninit(size, flag)?;

        let bytes = unsafe {
            core::slice::from_raw_parts_mut(region.mem_mut_ptr(), region.size())
        };

        for byte in bytes {
            *byte = 0;
        }

        Ok(region)
    }

    pub fn copy_from(&self, source: &[u8]) {
        let len = usize::min(self.range.len(), source.len());

        let target = unsafe {
            core::slice::from_raw_parts_mut(self.range.start as *mut u8, len)
        };

        target.copy_from_slice(source);
    }

    ///invoked when MemoryRegion is removed from address space
    pub fn close() {}

    //it's simple callback to find page during page_fault_exception
    pub fn no_page(&mut self) -> NonNull<Page> {
        todo!()
    }

    pub fn populate(&mut self) -> usize {
        0
    }
    pub fn expand(&mut self) {
        todo!()
    }

    /// the size of region in bytes
    pub fn size(&self) -> usize {
        self.range.len()
    }

    //return the ptr to the memory range
    pub fn mem_ptr(&self) -> *const u8 {
        self.range.start as *const u8
    }

    pub unsafe fn mem_mut_ptr(&mut self) -> *mut u8 {
        self.range.start as *mut u8
    }
}

impl MemoryRegionBox {
    pub fn into_node(self) -> &'static mut ListNode<MemoryRegion> {
        unsafe { &mut *SlabBox::into_raw(self.region) }.as_node()
    }
}

impl core::ops::Deref for MemoryRegionBox {
    type Target = MemoryRegion;
    fn deref(&self) -> &Self::Target {
        &self.region
    }
}

impl core::ops::DerefMut for MemoryRegionBox {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.region
    }
}

impl Drop for MemoryRegion {
    fn drop(&mut self) {
        virtual_dealloc(self.mem_ptr() as VirtualAddress, self.size());
    }
}

impl Slab for MemoryRegion {
    const NAME: &str = "mem_region";
}

impl BoxedNode for MemoryRegion {
    type Target = MemoryRegionBox;

    fn into_boxed(node: &mut Self::Item) -> Self::Target {
        let region = super::into_boxed(node.into());

        MemoryRegionBox { region }
    }
}
