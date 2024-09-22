use core::arch::asm;
use core::cell::UnsafeCell;
use core::intrinsics::unreachable;
use core::mem::MaybeUninit;
use core::ptr::NonNull;
use core::slice;

use multiboot2::{BootInformation, BootInformationHeader};
use static_assertions::assert_eq_size;

use kernel_types::collections::LinkedList;
use kernel_types::{bitflags, declare_constants, Zeroed};
use table::{RefTable, RefTableEntry};

use crate::memory::paging::table::{
    DirEntry, DirEntryFlag, TableEntry, TableEntryFlag,
};
use crate::memory::{
    AllocHandler, DeallocHandler, MemoryDescriptor, MemoryMappingFlag,
    MemoryMappingRegion, Page, PhysicalAddress, SegmentSelector,
    TaskStateDescriptor, ToPhysicalAddress, ToVirtualAddress, VirtualAddress,
};

pub(crate) mod table;

// pub(crate) use

declare_constants!(
    pub usize,
    DIRECTORY_ENTRIES_COUNT = 1024;
    TABLE_ENTRIES_COUNT = 1024;
    DIRECTORY_PAGES_COUNT = 1;
    TABLE_PAGES_COUNT = 1;
);

/// The struct is simply used to transfer physical layout for page allcoator
pub struct PageMarker {
    directory: RefTable<DirEntry>,
    alloc_handler: AllocHandler,
    dealloc_handler: DeallocHandler,
}

pub enum CommonError {
    OutOfBounds,
}

#[derive(Debug)]
pub enum PageMarkerError {
    EmptyDirEntry,
    EmptyTableEntry,
    InvalidTableAddress,
    OutOfMemory,
    CapturedMemoryRange,
}

/// show which modules should be disabled/enabled at boot time

#[repr(C)]
pub struct PagingProperties {
    directory: *mut DirEntry,
    handle: *mut GDTHandle,
    heap_offset: VirtualAddress,
    captures: *mut CaptureMemRec,
    captures_cnt: usize,
}

#[repr(C)]
pub struct GDTTable {
    null: Zeroed<MemoryDescriptor>,
    kernel_code: UnsafeCell<MemoryDescriptor>,
    kernel_data: UnsafeCell<MemoryDescriptor>,
    user_code: UnsafeCell<MemoryDescriptor>,
    user_data: UnsafeCell<MemoryDescriptor>,
    task: TaskStateDescriptor,
}

assert_eq_size!(GDTTable, [usize; 2 * 6]);

impl GDTTable {
    pub const fn null() {
        unsafe { MaybeUninit::zeroed().assume_init() }
    }
    pub fn load_task(&mut self, task: TaskStateDescriptor) {
        self.task = task;
        unsafe {
            asm!(
            "ltr ax",
            in("ax") u16::from(SegmentSelector::TASK),
            options(preserves_flags, nomem, nostack));
        }
    }
}

pub struct GDTEntry {
    low_segment_limit: u16,
    low_base_address: u16,
    middle_base_address: u8,
    first_flag: u8,
    second_flag: u8,
    high_base_address: u8,
}

#[repr(C, packed)]
pub struct GDTHandle {
    table_size: u16,
    table: PhysicalAddress,
}

///The common information about physical memory region
///Supported only ZONE_NORMAL memory (see linux kernel docs)
pub struct CaptureMemRec {
    ///The next free page
    next_page: usize,
    ///The common count of pages in region
    page_count: usize,
    ///The start physical offset of region
    memory_offset: PhysicalAddress,
}

pub struct BootAllocator<'a> {
    pivots: NonNull<CaptureMemRec>,
    len: &'a mut usize,
}

impl PagingProperties {
    pub fn page_directory(&self) -> RefTable<DirEntry> {
        RefTable::wrap(self.directory, DIRECTORY_ENTRIES_COUNT)
    }

    pub fn boot_allocator(&mut self) -> BootAllocator {
        let pivots = unsafe { NonNull::new_unchecked(self.captures) };

        BootAllocator {
            pivots,
            len: &mut self.captures_cnt,
        }
    }

    pub fn heap_offset(&self) -> VirtualAddress {
        self.heap_offset
    }

    #[cfg(target_arch = "x86")]
    pub fn gdt(&self) -> NonNull<GDTTable> {
        unsafe {
            // ptr::read_unaligned(&self.(
            let table_offset = (*self.handle).table;
            let raw_table = table_offset.as_virtual() as *mut GDTTable;
            NonNull::new_unchecked(raw_table)
        }
    }
}

impl CaptureMemRec {
    pub fn new(memory_offset: PhysicalAddress, size: usize) -> Self {
        let page_count = Page::lower_bound(size);

        Self {
            next_page: 0,
            page_count,
            memory_offset,
        }
    }

    pub fn capture_offset(
        &mut self,
        page_cnt: usize,
    ) -> Option<PhysicalAddress> {
        let rest_pages = self.free_pages_count();
        if rest_pages >= page_cnt {
            self.next_page += page_cnt;
            let offset = self.memory_offset + page_cnt * Page::SIZE;
            Some(offset)
        } else {
            None
        }
    }

    pub fn free_pages_count(&self) -> usize {
        self.page_count - self.next_page
    }

    ///return next free physical offset in region
    pub fn next_offset(&self) -> PhysicalAddress {
        self.memory_offset + self.next_page * Page::SIZE
    }
}

impl<'a> BootAllocator<'a> {
    pub fn alloc(
        &mut self,
        search_offset: PhysicalAddress,
        page_count: usize,
    ) -> Option<PhysicalAddress> {
        self.as_slice_mut()
            .iter_mut()
            .find(|pivot| pivot.memory_offset >= search_offset)
            .and_then(|p| p.capture_offset(page_count))
    }

    pub fn free(&self) -> usize {
        self.as_slice()
            .iter()
            .map(|pivot| pivot.free_pages_count() * Page::SIZE)
            .sum::<usize>()
    }

    pub unsafe fn set_len(&mut self, len: usize) {
        *self.len = len;
    }

    pub fn as_slice(&self) -> &'a [CaptureMemRec] {
        unsafe { core::slice::from_raw_parts(self.pivots.as_ref(), *self.len) }
    }

    pub fn as_slice_mut(&mut self) -> &'a mut [CaptureMemRec] {
        unsafe {
            core::slice::from_raw_parts_mut(self.pivots.as_mut(), *self.len)
        }
    }
}

#[macro_export]
macro_rules! table_index {
    ($argument:expr) => {
        ($argument >> 22) & 0x3FF
    };
}

#[macro_export]
macro_rules! entry_index {
    ($argument:expr) => {
        ($argument >> 12) & 0x3FF
    };
}

impl MemoryMappingFlag {
    pub fn as_table_flag(&self) -> TableEntryFlag {
        unsafe { TableEntryFlag::wrap(self.0) }
    }
    pub fn as_directory_flag(&self) -> DirEntryFlag {
        unsafe { DirEntryFlag::wrap(self.0) }
    }
}
bitflags!(
  pub UnmapParamsFlag(usize),
    PAGES = 0b1,
    TABLES = 0b10

);
impl PageMarker {
    pub fn wrap(
        directory: RefTable<DirEntry>,
        alloc_handler: AllocHandler,
        dealloc_handler: DeallocHandler,
    ) -> Self {
        Self {
            directory,
            alloc_handler,
            dealloc_handler,
        }
    }
    #[deprecated]
    pub fn set_dealloc_handler(&mut self, handler: DeallocHandler) {
        self.dealloc_handler = handler;
    }
    fn alloc_pages(&mut self, page_count: usize) -> Option<PhysicalAddress> {
        (self.alloc_handler)(page_count)
    }
    fn dealloc_page(&mut self, offset: PhysicalAddress) {
        (self.dealloc_handler)(offset)
    }
    #[deprecated]
    fn entries(&mut self) -> &mut [DirEntry] {
        self.directory.as_slice_mut()
    }
    pub fn table(&mut self) -> &mut RefTable<DirEntry> {
        &mut self.directory
    }
    fn get_page_entry(
        &mut self,
        virtual_address: VirtualAddress,
    ) -> Result<&mut TableEntry, PageMarkerError> {
        let dir_entry_index = table_index!(virtual_address);
        let _table_entry_index = entry_index!(virtual_address);
        // let dir_entry = unsafe { self.entries().get_mut(dir_entry_index).unwrap_unchecked() };
        let entries = self.entries();
        let _dir_entry = entries.get_mut(dir_entry_index);
        // if dir_entry.is_none() {
        //     stop_execution();
        // }
        // let entry: &mut TableEntry;
        // if let Some(dir_entry) = dir_entry {
        //     if dir_entry.is_present() {
        //         let option_entries = dir_entry.get_table_entries();
        //         // entry = unsafe {(dir_entry as *mut DirEntry as *mut TableEntry)};
        //         if let Some(table_entries) = option_entries {
        //             entry = unsafe { table_entries.get_unchecked_mut(table_entry_index) };
        //         } else {
        //             return Err(PageMarkerError::InvalidTableAddress);
        //         }
        //     } else {
        //         return Err(PageMarkerError::EmptyDirEntry);
        //     }
        // } else {
        //     unsafe {
        //         intrinsics::unreachable();
        //     }
        // }
        return Err(PageMarkerError::EmptyDirEntry);
        // return Ok(entry);
    }
    //physical address automatically align to page (for potential performance increase)
    //TableEntryFlag::PRESENT is used automatically in best case (if even passed flag doesn't holds present flag -> it will holds PRESENT)
    // #[deprecated]
    // pub fn mark_page(
    //     &mut self,
    //     physical_address: PhysicalAddress,
    //     virtual_address: VirtualAddress,
    //     page_flags: TableEntryFlag,
    // ) -> Result<(), PageMarkerError> {
    //     let physical_address: PhysicalAddress = Page::upper_bound(physical_address);
    //     let dir_entry_index = table_index!(virtual_address);
    //     let table_entry_index = entry_index!(virtual_address);
    //     let dir_entry = unsafe { self.entries().get_unchecked_mut(dir_entry_index) };
    //     if !dir_entry.is_present() {
    //         return Err(PageMarkerError::EmptyDirEntry);
    //     }
    //     let option_entries = dir_entry.get_table_entries();
    //     if let Some(table_entries) = option_entries {
    //         let entry = unsafe { table_entries.get_unchecked_mut(table_entry_index) };
    //         if !entry.is_present() {
    //             return Err(PageMarkerError::InvalidTableAddress);
    //         }
    //         entry.set(
    //             physical_address,
    //             TableEntryFlag(page_flags.0 | TableEntryFlag::PRESENT),
    //         );
    //     } else {
    //         return Err(PageMarkerError::EmptyDirEntry);
    //     }
    //     return Ok(());
    // }

    fn mark_dir_entry(
        &mut self,
        virtual_offset: VirtualAddress,
        flags: DirEntryFlag,
    ) {
        let dir_entry = unsafe {
            self.entries()
                .get_unchecked_mut(table_index!(virtual_offset))
        };
        dir_entry.set_flags(flags);
    }
    pub fn map_user_range(
        &mut self,
        map_region: &MemoryMappingRegion,
    ) -> Result<(), PageMarkerError> {
        unsafe { self.map_range_unsafe(map_region, true) }
    }
    ///the method mark memory in kernel space (doesn't check validness of region offset). That is, not additional memory can be allocated (we mark kernel, ie. memory already mapped)
    pub fn map_kernel_range(
        &mut self,
        map_region: &MemoryMappingRegion,
    ) -> Result<(), PageMarkerError> {
        unsafe { self.map_range_unsafe(map_region, false) }
    }
    ///This method is used during initialization of kernel structures in bootstrap process.
    ///When no Pages even exists
    //range_offset should be aligned to Page::SIZE
    unsafe fn map_range_unsafe(
        &mut self,
        map_region: &MemoryMappingRegion,
        can_allocate: bool,
    ) -> Result<(), PageMarkerError> {
        let mut addressable_offset = map_region.virtual_offset;
        let mut memory_offset = map_region.physical_offset;
        let flags = map_region.flags;
        for _ in 0..map_region.page_count {
            let table_index = table_index!(addressable_offset);
            let entry_index = entry_index!(addressable_offset);
            let dir_entry = self.directory.get_mut_unchecked(table_index);
            let mut page_table = {
                let page_table_option =
                    RefTable::wrap_page_table(dir_entry.clone());
                dir_entry.set_flags(flags.as_directory_flag());
                match page_table_option {
                    None => {
                        if !can_allocate {
                            unreachable()
                            //truly, we should panic
                        }
                        let option_table_offset =
                            self.alloc_pages(TABLE_PAGES_COUNT);
                        if let Some(table_offset) = option_table_offset {
                            RefTable::<TableEntry>::with_default_values(
                                table_offset as *mut TableEntry,
                                TABLE_ENTRIES_COUNT,
                            )
                        } else {
                            return Err(PageMarkerError::OutOfMemory);
                        }
                    }
                    Some(page_table) => page_table,
                }
            };
            let table_entry = page_table.get_mut_unchecked(entry_index);
            table_entry.set_page_offset(memory_offset);
            table_entry.set_flags(flags.as_table_flag());
            addressable_offset += Page::SIZE;
            memory_offset += Page::SIZE;
        }
        return Ok(());
    }
    #[inline(never)]
    pub fn unmap_range(
        &mut self,
        virtual_offset: VirtualAddress,
        page_count: usize,
        params: UnmapParamsFlag,
    ) {
        let mut addressable_offset = virtual_offset;
        for _ in 0..page_count {
            let table_index = table_index!(addressable_offset);
            let entry_index = entry_index!(addressable_offset);
            let dir_entry =
                unsafe { self.directory.get_unchecked(table_index) };
            let option_page_table = RefTable::wrap_page_table(*dir_entry);
            if let Some(mut page_table) = option_page_table {
                let table_entry =
                    unsafe { page_table.get_mut_unchecked(entry_index) };
                if table_entry.is_present() {
                    self.dealloc_page(table_entry.get_page_offset());
                    table_entry.clear();
                }
            }
            addressable_offset += Page::SIZE;
        }
        if !params.test_with(UnmapParamsFlag::TABLES) {
            //no needs to unmap page tables
            return;
        }
        addressable_offset = virtual_offset;
        for _ in 0..page_count {
            let table_index = table_index!(addressable_offset);
            let dir_entry =
                unsafe { self.directory.get_mut_unchecked(table_index) };
            let page_offset = dir_entry.get_table_offset();
            dir_entry.clear();
            self.dealloc_page(page_offset);
        }
    }
    //simple linux break method
    pub fn commit(&mut self, offset: PhysicalAddress) -> VirtualAddress {
        todo!()
    }
    pub fn new(
        &mut self,
        mapping_regions: LinkedList<MemoryMappingRegion>,
        alloc_handler: AllocHandler,
        dealloc_handler: DeallocHandler,
    ) -> Result<PageMarker, PageMarkerError> {
        let option_directory_offset: Option<PhysicalAddress> =
            self.alloc_pages(DIRECTORY_PAGES_COUNT);
        let mut marker: PageMarker;
        if let Some(directory_offset) = option_directory_offset {
            let directory = RefTable::<DirEntry>::with_default_values(
                directory_offset as *mut DirEntry,
                DIRECTORY_ENTRIES_COUNT,
            );
            marker =
                PageMarker::wrap(directory, alloc_handler, dealloc_handler);
            for region in mapping_regions.iter() {
                unsafe {
                    marker.map_range_unsafe(region, true)?;
                }
            }
        } else {
            return Err(PageMarkerError::OutOfMemory);
        }
        return Ok(marker);
    }
}

#[cfg(test)]
mod tests {
    extern crate alloc;
    extern crate std;

    #[test]
    fn import() {
        // let offset: PhysicalAddress = 0;
        // assert_eq!(offset.as_virtual(), 0xC0_000_000);
    }
}
