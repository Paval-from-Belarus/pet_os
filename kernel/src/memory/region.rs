use core::{ops::Range, ptr::NonNull};

use kernel_macro::ListNode;
use kernel_types::collections::{BoxedNode, LinkedList, ListNode};

use super::{
    physical_dealloc, slab_alloc, AllocError, MemoryAllocationFlag,
    MemoryMappingRegion, Page, Slab, SlabBox, VirtualAddress,
};

pub struct MemoryRegionBox {
    region: SlabBox<MemoryRegion>,
}

/// The region of continous virtual memory of the proccess
/// Each physical page should sequentially follow to virtual page
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

        const READ_WRITE = Self::READ.bits() | Self::WRITE.bits();

        const SHARED = 0x08;

        const SEQ_READ = 0x10;
        const RAND_READ = 0x20;
    }
}

impl From<MemoryRegionFlag> for MemoryAllocationFlag {
    fn from(value: MemoryRegionFlag) -> Self {
        let mut flags = MemoryAllocationFlag::ZEROED;

        if value.contains(MemoryRegionFlag::READ) {
            flags |= MemoryAllocationFlag::READ;
        }

        if value.contains(MemoryRegionFlag::WRITE) {
            flags |= MemoryAllocationFlag::WRITE;
        }

        if value.contains(MemoryRegionFlag::SEQ_READ) {
            flags |= MemoryAllocationFlag::CONTINOUS;
        }

        flags
    }
}

impl MemoryRegion {
    /// Create new region with no underlying physical memory
    pub unsafe fn empty(
        range: Range<VirtualAddress>,
        flag: MemoryRegionFlag,
    ) -> Result<MemoryRegionBox, AllocError> {
        if range.start % Page::SIZE != 0 {
            // return Err(AllocError::InvalidAlignment(super::Alignment::Page));
        }

        let region = slab_alloc(Self {
            node: ListNode::empty(),
            pages: LinkedList::empty(),
            flag,
            range,
        })?;

        Ok(MemoryRegionBox { region })
    }

    pub fn new_allocated(
        map_region: MemoryMappingRegion,
        flag: MemoryRegionFlag,
        pages: &mut LinkedList<'static, Page>,
    ) -> Result<MemoryRegionBox, AllocError> {
        let size = map_region.page_count * Page::SIZE;
        let offset = map_region.virtual_offset;

        let mut region = unsafe { Self::empty(offset..(offset + size), flag) }?;

        region.pages.splice(pages);

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

    pub fn expand_mem_before(&mut self, pages: &mut LinkedList<'static, Page>) {
        self.range.start -= Page::SIZE * pages.len();

        self.pages.splice(pages);
    }

    pub fn split_on(
        &mut self,
        offset: VirtualAddress,
        pages: LinkedList<'static, Page>,
    ) -> Result<Option<MemoryRegionBox>, AllocError> {
        assert!(offset >= self.range.start);
        assert!(!self.pages.is_empty());

        let rest_pages_count = (offset - self.range.start) / Page::SIZE;

        if rest_pages_count == 0 {
            //reuse this region instead allocation of new

            let mut to_dealloc = LinkedList::empty();
            to_dealloc.splice(&mut self.pages);
            physical_dealloc(to_dealloc);

            self.range.end = offset;
            self.pages = pages;

            return Ok(None);
        }

        let buddy_size = pages.len() * Page::SIZE;
        let mut buddy_region = unsafe {
            MemoryRegion::empty(offset..(offset + buddy_size), self.flag)
        }?;
        buddy_region.pages = pages;

        self.reduce_to(offset);

        Ok(buddy_region.into())
    }

    //update the start of the region
    pub fn reduce_to(&mut self, offset: VirtualAddress) {
        assert!(offset > self.range.start);

        let rest_pages_count = (offset - self.range.start) / Page::SIZE;

        self.range.end = offset;
        let mut to_dealloc = LinkedList::empty();

        let mut iter = self.pages.iter_mut();
        let mut index = 0;

        loop {
            if iter.next().is_none() {
                break;
            }

            if index >= rest_pages_count {
                let page = iter.unlink_watched().unwrap();
                to_dealloc.push_back(page);
            }

            index += 1;
        }

        physical_dealloc(to_dealloc);
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
        let mut to_dealloc = LinkedList::empty();

        to_dealloc.splice(&mut self.pages);

        physical_dealloc(to_dealloc);
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
