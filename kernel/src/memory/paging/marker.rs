use core::{arch::asm, ops::Range};

use crate::{
    memory::{
        self, MemoryMappingFlag, MemoryMappingRegion, Page, PhysicalAddress,
        VirtualAddress,
    },
    page_index, table_index,
};

use super::{PageDirectory, PageMarkerError, TABLE_PAGES_COUNT};

/// The struct is simply used to transfer physical layout for page allcoator
#[derive(Debug)]
pub struct PageMarker {
    // directory: &'a mut [DirEntry<'a>; DIRECTORY_ENTRIES_COUNT],
    directory: PageDirectory<'static, 'static>,
}

impl PageMarker {
    ///load underlying directory table to cpu
    #[inline(always)]
    pub fn load(&self) {
        let directory: PhysicalAddress = self.directory.physical_offset;

        unsafe {
            asm! {
                "mov cr3, eax",
                in("eax") directory,
                options(nostack, preserves_flags, nomem)
            }
        }
    }

    pub fn lookup_physical(
        &self,
        offset: VirtualAddress,
    ) -> Option<PhysicalAddress> {
        let table_index = table_index!(offset);
        let table_entry = self.directory.entries[table_index];

        let page_table = table_entry.page_table()?;

        let page_entry = &page_table[page_index!(offset)];

        page_entry.ph_offset()
    }
}

impl PageMarker {
    // /// build new page marker for memory regions
    // pub fn from_regions(
    //     regions: LinkedList<MemoryMappingRegion>,
    //     alloc_handler: AllocHandler,
    //     dealloc_handler: DeallocHandler,
    // ) -> Result<PageMarker<'a>, PageMarkerError> {
    //     let Some(dir_offset) = alloc_handler(DIRECTORY_PAGES_COUNT) else {
    //         return Err(PageMarkerError::OutOfMemory);
    //     };
    //
    //     let directory = unsafe {
    //         core::mem::transmute::<
    //             VirtualAddress,
    //             &'a mut [DirEntry<'a>; DIRECTORY_ENTRIES_COUNT],
    //         >(dir_offset.as_virtual())
    //     };
    //
    //     let mut marker = PageMarker {
    //         directory,
    //         alloc_handler,
    //         dealloc_handler,
    //     };
    //
    //     for region in regions.iter() {
    //         marker.map_user_range(region)?;
    //     }
    //
    //     Ok(marker)
    // }

    pub fn directory(&self) -> &PageDirectory<'static, 'static> {
        &self.directory
    }

    pub fn new(directory: PageDirectory<'static, 'static>) -> Self {
        Self { directory }
    }

    fn mark_pageg(
        &mut self,
        virtual_offset: VirtualAddress,
        flags: MemoryMappingFlag,
    ) {
        let dir_entry =
            &mut self.directory.entries[table_index!(virtual_offset)];
        dir_entry.set_flags(flags.as_directory_flag());

        if let Some(page_table) = dir_entry.page_table_mut() {
            for table_entry in page_table.iter_mut() {
                table_entry.set_flags(flags.as_table_flag());
            }
        }
    }

    #[inline(never)]
    pub fn map_user_range(
        &mut self,
        map_region: &MemoryMappingRegion,
    ) -> Result<(), PageMarkerError> {
        unsafe { self.map_range_unchecked(map_region, true) }
    }

    ///the method mark memory in kernel space (doesn't check validness of region offset). That is, not additional memory can be allocated (we mark kernel, ie. memory already mapped)
    pub fn map_kernel_range(
        &mut self,
        map_region: &MemoryMappingRegion,
    ) -> Result<(), PageMarkerError> {
        unsafe { self.map_range_unchecked(map_region, false) }
    }

    ///This method is used during initialization of kernel structures in bootstrap process.
    ///When no Pages even exists
    //range_offset should be aligned to Page::SIZE
    unsafe fn map_range_unchecked(
        &mut self,
        map_region: &MemoryMappingRegion,
        can_allocate: bool,
    ) -> Result<(), PageMarkerError> {
        let flags = map_region.flags;

        let mut ph_offset = map_region.physical_offset;
        let mut virt_offset = map_region.virtual_offset;

        for _ in 0..map_region.page_count {
            let table_index = table_index!(virt_offset);
            let entry_index = page_index!(virt_offset);

            let dir_entry = &mut self.directory.entries[table_index];

            dir_entry.set_flags(flags.as_directory_flag());

            if !dir_entry.has_page_table() {
                log::debug!("Table index: {table_index}");

                if !can_allocate {
                    return Err(PageMarkerError::EmptyDirEntry(
                        virt_offset as _,
                    ));
                }

                let Some(ph_offset) =
                    memory::alloc_physical_pages(TABLE_PAGES_COUNT)
                else {
                    return Err(PageMarkerError::OutOfMemory);
                };

                dir_entry.set_ph_offset(ph_offset);
            }

            if dir_entry.page_table_mut().is_none() {
                let page = Page::take(dir_entry.ph_offset().unwrap());
            }
            let page_table = dir_entry.page_table_mut().unwrap();

            let page_entry = &mut page_table[entry_index];

            let page = Page::take(ph_offset);

            page_entry.set_page_offset(page.as_physical());
            page_entry.set_flags(flags.as_table_flag());

            virt_offset += Page::SIZE;
            ph_offset += Page::SIZE;
        }

        Ok(())
    }

    pub fn unmap_range(
        &mut self,
        range: Range<VirtualAddress>,
        unmap_all: bool,
    ) {
        let mut virt_offset = range.start;

        while virt_offset < range.end {
            let table_index = table_index!(virt_offset);
            let page_index = page_index!(virt_offset);

            let dir_entry = &mut self.directory.entries[table_index];

            if let Some(page_table) = dir_entry.page_table_mut() {
                let table_entry = &mut page_table[page_index];

                if let Some(ph_offset) = table_entry.clear() {
                    memory::dealloc_physical_page(ph_offset);
                }
            }

            virt_offset += Page::SIZE;
        }

        if !unmap_all {
            return;
        }

        let mut virt_offset = range.start;

        while virt_offset < range.end {
            let table_index = table_index!(virt_offset);
            let dir_entry = &mut self.directory.entries[table_index];

            if let Some(ph_offset) = dir_entry.clear() {
                memory::dealloc_physical_page(ph_offset);
            }

            virt_offset += Page::SIZE;
        }
    }
}

impl Drop for PageMarker {
    fn drop(&mut self) {
        log::debug!("Deallocation page marker");

        for dir_entry in self.directory.entries.iter_mut() {
            let Some(page_table) = dir_entry.page_table_mut() else {
                continue;
            };

            for table_entry in page_table.iter_mut() {
                if let Some(ph_offset) = table_entry.clear() {
                    memory::dealloc_physical_page(ph_offset);
                }
            }

            if let Some(ph_offset) = dir_entry.clear() {
                memory::dealloc_physical_page(ph_offset);
            }

            memory::dealloc_physical_page(self.directory.physical_offset);

            self.directory.physical_offset = 0;
        }
    }
}
