use core::arch::asm;

use kernel_types::collections::LinkedList;

use crate::{
    log,
    memory::{
        AllocHandler, DeallocHandler, DirEntry, MemoryMappingFlag,
        MemoryMappingRegion, Page, PhysicalAddress, ToPhysicalAddress,
        ToVirtualAddress, VirtualAddress,
    },
    page_index, table_index,
};

use super::{
    table::RefTableEntry, PageDirectory, PageMarkerError, UnmapParamsFlag,
    DIRECTORY_ENTRIES_COUNT, DIRECTORY_PAGES_COUNT, TABLE_PAGES_COUNT,
};

/// The struct is simply used to transfer physical layout for page allcoator
pub struct PageMarker<'a> {
    // directory: &'a mut [DirEntry<'a>; DIRECTORY_ENTRIES_COUNT],
    directory: PageDirectory<'a, 'a>,
    alloc_handler: AllocHandler,
    dealloc_handler: DeallocHandler,
}

impl PageMarker<'static> {
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

        if page_entry.has_page() {
            Some(page_entry.page_offset())
        } else {
            None
        }
    }
}

impl<'a> PageMarker<'a> {
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

    pub fn directory(&self) -> &PageDirectory<'a, 'a> {
        &self.directory
    }

    pub fn new(
        directory: PageDirectory<'a, 'a>,
        alloc_handler: AllocHandler,
        dealloc_handler: DeallocHandler,
    ) -> Self {
        Self {
            directory,
            alloc_handler,
            dealloc_handler,
        }
    }

    pub fn set_dealloc_handler(&mut self, handler: DeallocHandler) {
        self.dealloc_handler = handler;
    }

    fn alloc_pages(&self, page_count: usize) -> Option<PhysicalAddress> {
        (self.alloc_handler)(page_count)
    }

    fn dealloc_page(&self, offset: PhysicalAddress) {
        (self.dealloc_handler)(offset)
    }

    fn mark_pageg(
        &'a mut self,
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
        let mut addressable_offset = map_region.virtual_offset;
        let mut memory_offset = map_region.physical_offset;

        let flags = map_region.flags;

        let allocator = &self.alloc_handler;

        for _ in 0..map_region.page_count {
            let table_index = table_index!(addressable_offset);
            let entry_index = page_index!(addressable_offset);

            let dir_entry = &mut self.directory.entries[table_index];

            dir_entry.set_flags(flags.as_directory_flag());

            if !dir_entry.has_page_table() {
                if !can_allocate {
                    return Err(PageMarkerError::EmptyDirEntry);
                }

                let Some(pages) = allocator(TABLE_PAGES_COUNT) else {
                    return Err(PageMarkerError::OutOfMemory);
                };

                dir_entry.set_table_offset(pages);
            }

            let page_table = dir_entry.page_table_mut().unwrap();

            let table_entry = &mut page_table[entry_index];

            table_entry.set_page_offset(memory_offset);
            table_entry.set_flags(flags.as_table_flag());

            addressable_offset += Page::SIZE;
            memory_offset += Page::SIZE;
        }

        Ok(())
    }

    pub fn unmap_range(
        &'a mut self,
        virtual_offset: VirtualAddress,
        pages_count: usize,
        params: UnmapParamsFlag,
    ) {
        let mut addressable_offset = virtual_offset;
        let deallocator = self.dealloc_handler;

        for _ in 0..pages_count {
            let table_index = table_index!(addressable_offset);
            let entry_index = page_index!(addressable_offset);

            let dir_entry = &mut self.directory.entries[table_index];

            if let Some(page_table) = dir_entry.page_table_mut() {
                let table_entry = &mut page_table[entry_index];

                if table_entry.has_page() {
                    deallocator(table_entry.page_offset());
                    table_entry.clear();
                } else {
                    log!("Unmapping not existing page table");
                }
            } else {
                log!("Unmapping not existing dir table");
            }

            addressable_offset += Page::SIZE;
        }

        if !params.test_with(UnmapParamsFlag::TABLES) {
            //no needs to unmap page tables
            return;
        }

        addressable_offset = virtual_offset;
        for _ in 0..pages_count {
            let table_index = table_index!(addressable_offset);
            let dir_entry = &mut self.directory.entries[table_index];

            if dir_entry.has_page_table() {
                let page_offset = dir_entry.table_offset();
                dir_entry.clear();
                deallocator(page_offset);
            }
        }
    }
}

impl<'a> Drop for PageMarker<'a> {
    fn drop(&mut self) {
        log!("Deallocation page marker");
        let deallocator = self.dealloc_handler;

        for dir_entry in self.directory.entries.iter_mut() {
            let Some(page_table) = dir_entry.page_table_mut() else {
                continue;
            };

            for table_entry in page_table.iter_mut() {
                if table_entry.has_page() {
                    deallocator(table_entry.page_offset());
                }
                // table_entry.clear()
            }

            deallocator(dir_entry.table_offset());
        }

        let dir_offset = self.directory.physical_offset;

        deallocator(dir_offset);
    }
}
