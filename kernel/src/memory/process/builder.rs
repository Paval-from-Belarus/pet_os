use core::marker::PhantomData;

use alloc::sync::Arc;
use kernel_types::collections::LinkedList;

use crate::{
    error::KernelError,
    memory::{
        self, new_proccess_id, physical_alloc, AllocError, MemoryMappingRegion,
        MemoryRegion, MemoryRegionFlag, Page, PageMarker, ToPhysicalAddress,
        VirtualAddress,
    },
};

use super::{Process, ProcessState};

pub struct ProcessSpace;
pub struct KernelSpace;

pub trait AddressSpace {}

impl AddressSpace for ProcessSpace {}
impl AddressSpace for KernelSpace {}

pub struct ProcessBuilder<T: AddressSpace> {
    marker: PageMarker<'static>,
    regions: LinkedList<'static, MemoryRegion>,
    pages: LinkedList<'static, Page>,
    _space: PhantomData<T>,
}

impl ProcessBuilder<KernelSpace> {
    pub fn new() -> Result<Self, AllocError> {
        let marker = memory::new_page_marker()?;

        Ok(Self {
            marker,
            regions: LinkedList::empty(),
            pages: LinkedList::empty(),
            _space: PhantomData,
        })
    }

    pub fn switch_address_space(self) -> ProcessBuilder<ProcessSpace> {
        self.marker.load();

        ProcessBuilder {
            marker: self.marker,
            regions: self.regions,
            pages: self.pages,
            _space: PhantomData,
        }
    }
}

impl ProcessBuilder<ProcessSpace> {
    pub fn alloc_region(
        &mut self,
        start_offset: VirtualAddress,
        size: usize,
        flags: MemoryRegionFlag,
    ) -> Result<&mut MemoryRegion, KernelError> {
        let offset_in_page = start_offset % Page::SIZE;

        // let start_offset = start_offset - offset_in_page;
        // let size = size + offset_in_page;

        let region = unsafe {
            MemoryRegion::empty(start_offset..(start_offset + size), flags)
        }?;

        let mut pages = physical_alloc(size + offset_in_page)?;

        let mut offset = start_offset - offset_in_page;

        for page in pages.iter() {
            self.marker.map_user_range(&MemoryMappingRegion {
                flags: flags.into(),
                virtual_offset: offset,
                physical_offset: page.as_physical(),
                page_count: 1,
                ..Default::default()
            })?;

            offset += Page::SIZE;
        }

        self.regions.push_back(region.into_node());

        self.pages.splice(&mut pages);

        Ok(self.regions.last_mut().unwrap())
    }

    pub fn build(
        mut self,
        entry_point: VirtualAddress,
    ) -> Result<Process, KernelError> {
        let stack_region = self.alloc_region(
            0xB_000_000,
            0x2000,
            MemoryRegionFlag::READ | MemoryRegionFlag::WRITE,
        )?;

        let stack = stack_region.range.clone();

        let Some(id) = new_proccess_id() else {
            return Err(KernelError::NoPidAvailable);
        };

        let state = ProcessState {
            id,
            stack,
            entry_point,
            regions: self.regions,
            marker: self.marker,
            pages: self.pages,
        };

        Ok(Process {
            state: Arc::new(spin::Mutex::new(state)),
        })
    }
}
