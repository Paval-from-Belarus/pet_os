use core::marker::PhantomData;

use kernel_types::collections::LinkedList;

use crate::{
    error::KernelError,
    memory::{
        self, physical_alloc, physical_dealloc, AllocError,
        MemoryMappingRegion, MemoryRegion, MemoryRegionFlag, Page, PageMarker,
        ToPhysicalAddress, VirtualAddress,
    },
};

pub struct ProcessSpace;
pub struct KernelSpace;

pub trait AddressSpace {}

impl AddressSpace for ProcessSpace {}
impl AddressSpace for KernelSpace {}

pub struct ProcessBuilder<T: AddressSpace> {
    marker: PageMarker<'static>,
    regions: LinkedList<'static, MemoryRegion>,
    _space: PhantomData<T>,
}

impl ProcessBuilder<KernelSpace> {
    pub fn new() -> Result<Self, AllocError> {
        let marker = memory::new_page_marker()?;

        Ok(Self {
            marker,
            regions: LinkedList::empty(),
            _space: PhantomData,
        })
    }

    pub fn switch_address_space(&mut self) -> ProcessBuilder<ProcessSpace> {
        todo!()
    }
}

impl ProcessBuilder<ProcessSpace> {
    pub fn alloc_region(
        &mut self,
        start_offset: VirtualAddress,
        size: usize,
        flags: MemoryRegionFlag,
    ) -> Result<&mut MemoryRegion, KernelError> {
        assert!(start_offset % Page::SIZE == 0);

        let region = unsafe {
            MemoryRegion::empty(start_offset..(start_offset + size), flags)
        }?;

        let pages = physical_alloc(size)?;

        let mut offset = start_offset;
        for page in pages.iter() {
            self.marker.map_user_range(&MemoryMappingRegion {
                flags: flags.into(),
                virtual_offset: offset,
                physical_offset: page.as_physical(),
                page_count: pages.len(),
                ..Default::default()
            });

            offset += Page::SIZE;
        }

        self.regions.push_back(region.into_node());

        Ok(self.regions.last_mut().unwrap())
    }
}
