use core::{arch::asm, ops::Range};

use crate::{
    memory::{
        AllocHandler, DeallocHandler, MemoryMappingFlag, MemoryMappingRegion,
        Page, PhysicalAddress, VirtualAddress,
    },
    page_index, table_index,
};

use super::{
    table::RefTableEntry, PageDirectory, PageMarkerError, TABLE_PAGES_COUNT,
};

/// The struct is simply used to transfer physical layout for page allcoator
#[derive(Debug)]
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

            let page_entry = &mut page_table[entry_index];

            page_entry.set_page_offset(memory_offset);
            page_entry.set_flags(flags.as_table_flag());

            addressable_offset += Page::SIZE;
            memory_offset += Page::SIZE;
        }

        Ok(())
    }

    pub fn unmap_range(
        &mut self,
        range: Range<VirtualAddress>,
        unmap_all: bool,
    ) {
        let mut page_offset = range.start;
        let deallocator = self.dealloc_handler;

        while page_offset < range.end {
            let table_index = table_index!(page_offset);
            let page_index = page_index!(page_offset);

            let dir_entry = &mut self.directory.entries[table_index];

            if let Some(page_table) = dir_entry.page_table_mut() {
                let table_entry = &mut page_table[page_index];

                if table_entry.has_page() {
                    deallocator(table_entry.page_offset());
                    table_entry.clear();
                }
            }

            page_offset += Page::SIZE;
        }

        if !unmap_all {
            return;
        }

        let mut page_offset = range.start;
        while page_offset < range.end {
            let table_index = table_index!(page_offset);
            let dir_entry = &mut self.directory.entries[table_index];

            if dir_entry.has_page_table() {
                deallocator(dir_entry.table_offset());
                dir_entry.clear();
            }

            page_offset += Page::SIZE;
        }
    }
}

impl<'a> Drop for PageMarker<'a> {
    fn drop(&mut self) {
        log::debug!("Deallocation page marker");

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
