use core::{hint, intrinsics, mem};

use crate::bitflags;

use crate::memory::{MemRangeFlag, Page, PhysicalAddress, VirtualAddress};

extern "C" {
    //Physical address where kernel is stored
    static KERNEL_PHYSICAL_OFFSET: usize;
    //compile-time info about effective size of kernel
    static KERNEL_SIZE: usize;
    //offset after which memory is free to use
    static KERNEL_VIRTUAL_OFFSET: usize;
    pub(crate) static KERNEL_STACK_SIZE: usize;
}

struct MemoryMappingRegion {
    //used to copy
    virtual_offset: VirtualAddress,
    physical_offset: PhysicalAddress,
    size: usize,
}

//exactly quarter of virtual memory
const ENTRIES_PER_DIRECTORY: usize = 1024;
const ENTRIES_PER_TABLE: usize = 1024;

#[deprecated]
pub fn get_heap_initial_offset() -> VirtualAddress {
    //runtime solve
    todo!()
}

pub trait ToPhysicalAddress {
    const NULL: usize = 0;
    fn as_physical(&self) -> PhysicalAddress;
}

pub trait ToVirtualAddress {
    fn as_virtual(&self) -> VirtualAddress;
}

/// The struct is simply used to transfer physical layout for page allcoator
#[derive(Copy, Clone)]
pub struct PageMarker {
    dir_entries: *mut DirEntry,
}

pub enum PageMarkerError {
    EmptyDirEntry,
    EmptyTableEntry,
    InvalidTableAddress,
    OutOfMemory,
    CapturedMemoryRange,
}

pub struct KernelProperties {
    boot_device: u8,
    //used to invoke virtual task
    ranges: *const u8,
}

#[repr(C)]
pub struct PagingProperties {
    directory: *mut DirEntry,
    handle: *mut GDTHandle,
    heap_offset: PhysicalAddress,
    captures: *mut CaptureMemRec,
    captures_cnt: usize,
}
pub struct GDTTable {
    entries: *mut GDTEntry,
    count: usize,

}

impl GDTTable {
    pub const fn new(entries: *mut GDTEntry, count: usize) -> GDTTable {
        GDTTable { entries, count }
    }

}

pub struct GDTEntry {
    entry: usize,
}

pub struct GDTHandle {
    table_size: usize,
    table: *mut GDTTable,
}

pub struct CaptureMemRec {
    memory_offset: PhysicalAddress,
    page_cnt: usize,
    next_page: usize,
}

pub struct CaptureAllocator {
    pivots: &'static mut [CaptureMemRec],
}

pub struct DirEntry {
    entry: usize,
}

pub struct TableEntry {
    entry: usize,
}
bitflags!(
    pub DirEntryFlag(usize),
    HUGE_SIZE = 0b10_000_000,
    ACCESSED= 0b100_000,
    CACHE_DISABLED = 0b10_000,
    WRITE_THROUGH = 0b1000,
    NO_PRIVILEGE = 0b100,
    WRITABLE = 0b10,
    PRESENT = 0b1,
    EMPTY = 0b0
);
bitflags!(
    pub TableEntryFlag(usize),
    GLOBAL = 0b10_000_000,
    DIRTY = 0b10_000_000,
    ACCESSED = 0b100_000,
    CACHE_DISABLED = 0b10_000,
    WRITE_THROUGH = 0b1000,
    NO_PRIVILEGE = 0b100,
    WRITABLE = 0b10,
    PRESENT = 0b1,
    EMPTY = 0b0
);
pub(crate) struct MemoryMappingFlag {
    directory_flag: DirEntryFlag,
    table_flag: TableEntryFlag,
}

impl PagingProperties {
    pub fn page_marker(&self) -> PageMarker {
        PageMarker::wrap(self.directory)
    }
    pub fn allocator(&self) -> CaptureAllocator {
        let captures: &mut [CaptureMemRec] =
            unsafe { core::slice::from_raw_parts_mut(self.captures, self.captures_cnt) };
        CaptureAllocator::new(captures)
    }
    //not used
    fn get_captured_pages(marker: &mut PageMarker) -> usize {
        let captured_pages: usize = marker
            .entries()
            .iter()
            .filter(|entry| entry.is_present())
            .map(|entry| -> usize {
                let optional_table_entries = entry.get_table_entries();
                if let Some(table_entries) = optional_table_entries {
                    let live_page_cnt: usize = table_entries
                        .iter()
                        .filter(|entry| entry.is_present())
                        .count();
                    return live_page_cnt
                        + Page::upper_bound(ENTRIES_PER_TABLE * TableEntry::BYTE_SIZE);
                } else {
                    unsafe { intrinsics::unreachable(); }
                }
            })
            .sum();
        return captured_pages;
    }
}

impl CaptureMemRec {
    pub fn capture_offset(&mut self, page_cnt: usize) -> Option<PhysicalAddress> {
        let rest_pages = self.get_free_pages_cnt();
        let result: Option<PhysicalAddress>;
        if rest_pages >= page_cnt {
            self.next_page += page_cnt;
            let offset = self.memory_offset + page_cnt * Page::SIZE;
            result = Some(offset);
        } else {
            result = None;
        }
        return result;
    }
    pub fn get_free_pages_cnt(&self) -> usize {
        return self.page_cnt - self.next_page;
    }
    pub fn get_memory_offset(&self) -> PhysicalAddress {
        return self.memory_offset;
    }
}

impl CaptureAllocator {
    pub fn new(captures: &'static mut [CaptureMemRec]) -> CaptureAllocator {
        CaptureAllocator { pivots: captures }
    }
    pub fn alloc(
        &mut self,
        search_offset: VirtualAddress,
        page_cnt: usize,
    ) -> Option<PhysicalAddress> {
        let mut mem_offset = None;
        for pivot in self.pivots.iter_mut() {
            if search_offset < pivot.memory_offset {
                mem_offset = pivot.capture_offset(page_cnt);
            }
            if mem_offset.is_some() {
                break;
            }
        }
        return mem_offset;
    }
    pub fn free_memory(&self) -> usize {
        return self
            .pivots
            .iter()
            .map(|pivot| pivot.get_free_pages_cnt() * Page::SIZE)
            .sum::<usize>();
    }
    pub fn as_pivots(&mut self) -> &mut [CaptureMemRec] {
        return self.pivots;
    }
}

impl ToPhysicalAddress for VirtualAddress {
    fn as_physical(&self) -> PhysicalAddress {
        return unsafe { self - KERNEL_VIRTUAL_OFFSET };
    }
}

impl ToVirtualAddress for PhysicalAddress {
    fn as_virtual(&self) -> VirtualAddress {
        return unsafe { self + KERNEL_VIRTUAL_OFFSET };
    }
}

impl DirEntry {
    const ADDRESS_MASK: usize = 0xFF_FF_FC_00;
    const BYTE_SIZE: usize = mem::size_of::<usize>();
    pub fn new(
        table_offset_option: Option<&'static mut [TableEntry]>,
        flags: DirEntryFlag,
    ) -> DirEntry {
        let virtual_offset: VirtualAddress;
        if let Some(table_offset) = table_offset_option {
            virtual_offset = table_offset.as_ptr() as VirtualAddress;
        } else {
            virtual_offset = VirtualAddress::NULL;
        }
        DirEntry {
            entry: virtual_offset.as_physical() | flags.0,
        }
    }
    //This is impossible to change offset to PageTable
    //The first reason ― it's a problem how to access memory
    pub fn set_flags(&mut self, flags: DirEntryFlag) {
        self.entry = (self.entry & DirEntry::ADDRESS_MASK) | flags.0;
    }
    pub fn get_flags(&self) -> DirEntryFlag {
        DirEntryFlag(self.entry & !DirEntry::ADDRESS_MASK)
    }
    pub fn is_present(&self) -> bool {
        self.get_flags().contains(DirEntryFlag::PRESENT)
    }
    //return virtual offset stored in entry
    //Each should be already accessible. So, this method only use real value of entry and convert to reference (whereas of value)
    pub fn get_table_entries(&self) -> Option<&mut [TableEntry]> {
        let table_offset: Option<&mut [TableEntry]>;
        let address: PhysicalAddress = self.entry & DirEntry::ADDRESS_MASK;
        if address != PhysicalAddress::NULL {
            let virtual_offset: &mut [TableEntry] = unsafe {
                core::slice::from_raw_parts_mut(
                    address.as_virtual() as *mut TableEntry,
                    ENTRIES_PER_TABLE,
                )
            };
            table_offset = Some(virtual_offset);
        } else {
            table_offset = None;
        }
        table_offset
    }
}

impl TableEntry {
    const ADDRESS_MASK: usize = 0xFF_FF_FC_00;
    const BYTE_SIZE: usize = core::mem::size_of::<usize>();
    //TableEntry is fully mutable
    //Page and flags should be change per time for entry consistent
    pub fn new(page_offset: PhysicalAddress, flags: TableEntryFlag) -> TableEntry {
        TableEntry {
            entry: page_offset & TableEntry::ADDRESS_MASK | flags.0,
        }
    }
    pub fn set(&mut self, page_offset: PhysicalAddress, flags: TableEntryFlag) {
        self.entry = page_offset & TableEntry::ADDRESS_MASK | flags.0;
    }
    pub fn get_flags(&self) -> TableEntryFlag {
        TableEntryFlag(self.entry & !TableEntry::ADDRESS_MASK)
    }
    pub fn get_page_offset(&self) -> PhysicalAddress {
        self.entry & TableEntry::ADDRESS_MASK
    }
    pub fn is_present(&self) -> bool {
        self.get_flags().contains(TableEntryFlag::PRESENT)
    }
}

macro_rules! table_index {
    ($argument:expr) => {
        ($argument >> 22) & 0x3FF
    };
}
macro_rules! entry_index {
    ($argument:expr) => {
        ($argument >> 12) & 0x3FF
    };
}
impl DirEntryFlag {
    pub fn as_table_entry_flags(&self) -> TableEntryFlag {
        TableEntryFlag(self.0 & !(DirEntryFlag::HUGE_SIZE))
    }
}

impl TableEntryFlag {
    pub fn as_dir_entry_flags(&self) -> DirEntryFlag {
        DirEntryFlag(self.0 & !(TableEntryFlag::GLOBAL | TableEntryFlag::DIRTY))
    }
}

impl MemRangeFlag {
    pub fn as_table_flag(&self) -> TableEntryFlag {
        TableEntryFlag(self.0)
    }
    pub fn as_directory_flag(&self) -> DirEntryFlag {
        DirEntryFlag(self.0)
    }
}

impl PageMarker {
    pub fn wrap(dir_entries: *mut DirEntry) -> PageMarker {
        PageMarker { dir_entries }
    }
    fn entries(&mut self) -> &mut [DirEntry] {
        return unsafe { core::slice::from_raw_parts_mut(self.dir_entries, ENTRIES_PER_DIRECTORY) };
    }
    fn get_page_entry(
        &mut self,
        virtual_address: VirtualAddress,
    ) -> Result<&mut TableEntry, PageMarkerError> {
        let dir_entry_index = table_index!(virtual_address);
        let table_entry_index = entry_index!(virtual_address);
        // let dir_entry = unsafe { self.entries().get_mut(dir_entry_index).unwrap_unchecked() };
        let entries = self.entries();
        let dir_entry = entries.get_mut(dir_entry_index);
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
    #[deprecated]
    pub fn mark_page(
        &mut self,
        physical_address: PhysicalAddress,
        virtual_address: VirtualAddress,
        page_flags: TableEntryFlag,
    ) -> Result<(), PageMarkerError> {
        let physical_address: PhysicalAddress = Page::upper_bound(physical_address);
        let dir_entry_index = table_index!(virtual_address);
        let table_entry_index = entry_index!(virtual_address);
        let dir_entry = unsafe { self.entries().get_unchecked_mut(dir_entry_index) };
        if !dir_entry.is_present() {
            return Err(PageMarkerError::EmptyDirEntry);
        }
        let option_entries = dir_entry.get_table_entries();
        if let Some(table_entries) = option_entries {
            let entry = unsafe { table_entries.get_unchecked_mut(table_entry_index) };
            if !entry.is_present() {
                return Err(PageMarkerError::InvalidTableAddress);
            }
            entry.set(
                physical_address,
                TableEntryFlag(page_flags.0 | TableEntryFlag::PRESENT),
            );
        } else {
            return Err(PageMarkerError::EmptyDirEntry);
        }
        return Ok(());
    }

    fn mark_dir_entry(&mut self, virtual_offset: VirtualAddress, flags: DirEntryFlag) {
        let dir_entry = unsafe {
            self.entries()
                .get_unchecked_mut(table_index!(virtual_offset))
        };
        dir_entry.set_flags(flags);
    }
    //range_offset should be aligned to Page::SIZE
    pub fn mark_range(
        &mut self,
        mut virtual_offset: VirtualAddress,
        mut physical_offset: PhysicalAddress,
        range_size: usize,
        flags: MemRangeFlag,
    ) -> Result<(), PageMarkerError> {
        let page_cnt = Page::upper_bound(range_size);
        for _ in 0..page_cnt {
            let result_entries = self.get_page_entry(virtual_offset);
            match result_entries {
                Ok(table_entry) => {
                    if table_entry.is_present() {
                        table_entry.set(physical_offset, flags.as_table_flag());
                        self.mark_dir_entry(virtual_offset, flags.as_directory_flag());
                    } else {
                        //impossible to acquire already used MemoryRange
                        return Err(PageMarkerError::CapturedMemoryRange);
                    }
                }
                Err(error_code) => {
                    return Err(error_code);
                }
            }
            virtual_offset += Page::SIZE;
            physical_offset += Page::SIZE;
        }
        return Ok(());
    }
    pub fn new<T, S>(
        &self,
        mut alloc_handler: T,
        mut free_handler: S,
    ) -> Result<PageMarker, PageMarkerError>
        where
            T: FnMut(usize) -> Option<PhysicalAddress>,
            S: FnMut(PhysicalAddress) -> (),
    {
        let option_directory_offset =
            alloc_handler(Page::upper_bound(ENTRIES_PER_DIRECTORY) * DirEntry::BYTE_SIZE);
        let marker: PageMarker;
        if let Some(directory_offset) = option_directory_offset {
            let option_memory_offset = alloc_handler(ENTRIES_PER_DIRECTORY);
            if let Some(memory_offset) = option_memory_offset {
                marker = PageMarker {
                    dir_entries: memory_offset as *mut DirEntry,
                };
            } else {
                free_handler(directory_offset);
                return Err(PageMarkerError::OutOfMemory);
            }
        } else {
            return Err(PageMarkerError::OutOfMemory);
        }
        return Ok(marker);
    }
}

#[cfg(test)]
mod tests {
    use crate::memory::{PhysicalAddress, ToVirtualAddress};

    #[test]
    fn import() {
        // let offset: PhysicalAddress = 0;
        // assert_eq!(offset.as_virtual(), 0xC0_000_000);
    }
}
