use core::{ops::Range, ptr::NonNull};

use kernel_macro::ListNode;
use kernel_types::collections::{BoxedNode, ListNode};

use super::{
    slab_alloc, virtual_alloc, virtual_dealloc, MemoryRegionFlag, Page,
    SlabBox, VirtualAddress,
};

pub struct MemoryRegionBox {
    region: SlabBox<MemoryRegion>,
}

#[derive(ListNode)]
#[repr(C)]
pub struct MemoryRegion {
    #[list_pivots]
    node: ListNode<MemoryRegion>,
    // parent: NonNull<ProcessState>,
    pub range: Range<VirtualAddress>,
    pub flag: MemoryRegionFlag,
    //mapped_file: MemoryMappedFile,
    //file_offset: usize
}

impl MemoryRegion {
    pub fn new_uninit(size: usize, flag: MemoryRegionFlag) -> MemoryRegionBox {
        let offset = virtual_alloc(size, flag);

        let region = slab_alloc(Self {
            node: unsafe { ListNode::empty() },
            range: offset..(offset + size as VirtualAddress),
            flag,
        })
        .unwrap();

        MemoryRegionBox { region }
    }

    pub fn new_zeroed(size: usize, flag: MemoryRegionFlag) -> MemoryRegionBox {
        let mut region = Self::new_uninit(size, flag);

        let bytes = unsafe {
            core::slice::from_raw_parts_mut(
                region.as_range_mut_ptr(),
                region.size(),
            )
        };

        for byte in bytes {
            *byte = 0;
        }

        region
    }

    pub fn copy_from(&self, source: &[u8]) {
        let target = unsafe {
            core::slice::from_raw_parts_mut(
                self.range.start as *mut u8,
                self.range.len(),
            )
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
    pub fn as_range_ptr(&self) -> *const u8 {
        self.range.start as *const u8
    }

    pub unsafe fn as_range_mut_ptr(&mut self) -> *mut u8 {
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
        virtual_dealloc(self.as_range_ptr() as VirtualAddress);
    }
}

impl BoxedNode for MemoryRegion {
    type Target = MemoryRegionBox;

    fn into_boxed(node: &mut Self::Item) -> Self::Target {
        let region = unsafe { SlabBox::from_raw_in(node, super::Kernel) };

        MemoryRegionBox { region }
    }
}
