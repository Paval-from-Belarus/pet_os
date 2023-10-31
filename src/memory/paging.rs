use core::{mem, ptr, slice};
use core::intrinsics::{unreachable};
use crate::{bitflags, declare_constants};
use crate::memory::{KERNEL_LAYOUT_FLAGS, MemoryMappingFlag, MemoryMappingRegion, Page, PhysicalAddress, VirtualAddress};


extern "C" {
    //Physical address where kernel is stored
    static KERNEL_PHYSICAL_OFFSET: usize;
    //compile-time info about effective size of kernel
    static KERNEL_SIZE: usize;
    //offset after which memory is free to use
    static KERNEL_VIRTUAL_OFFSET: usize;
    pub(crate) static KERNEL_STACK_SIZE: usize;
}



declare_constants!(
    usize,
    DIRECTORY_ENTRIES_COUNT = 1024;
    TABLE_ENTRIES_COUNT = 1024;
    DIRECTORY_PAGES_COUNT = 1;
    TABLE_PAGES_COUNT = 1;
);
#[deprecated]
pub fn get_heap_initial_offset() -> VirtualAddress {
    //runtime solve
    0
}

pub fn get_kernel_binary_size() -> usize {
    unsafe { KERNEL_SIZE }
}

pub fn get_kernel_virtual_offset() -> usize {
    unsafe { KERNEL_VIRTUAL_OFFSET }
}

pub fn get_kernel_physical_offset() -> usize {
    unsafe { KERNEL_PHYSICAL_OFFSET }
}

pub fn get_kernel_mapping_region() -> &'static mut MemoryMappingRegion {
    let page_list_size = 42; //replace with valid value
    let _kernel_size = get_kernel_binary_size() + page_list_size;
    let _kernel_region = MemoryMappingRegion {
        flags: MemoryMappingFlag::from(MemoryMappingFlag::PRESENT),
        virtual_offset: 0,
        physical_offset: 0,
        page_count: 0,
        next: ptr::null_mut(),
    };
    unsafe { &mut *(ptr::null_mut() as *mut MemoryMappingRegion) }
}

pub trait ToPhysicalAddress {
    const NULL: usize = 0;
    fn as_physical(&self) -> PhysicalAddress;
}

pub trait ToVirtualAddress {
    fn as_virtual(&self) -> VirtualAddress;
}

/// The struct is simply used to transfer physical layout for page allcoator
pub struct PageMarker<T, S>
    where T: FnMut(usize) -> Option<PhysicalAddress>, //allocate specific count of physical pages
          S: FnMut(PhysicalAddress) {
    directory: RefTable<DirEntry>,
    alloc_handler: T,
    dealloc_handler: S,
}

pub struct RefTable<T> {
    entries: *mut T,
    size: usize,
}

unsafe impl<T: Sized + Copy + Clone> Send for RefTable<T> {}

unsafe impl<T: Sized + Copy + Clone> Sync for RefTable<T> {}

pub trait RefTableEntry {
    fn empty() -> Self;
    fn clear(&mut self);
}

impl RefTableEntry for DirEntry {
    fn empty() -> Self {
        DirEntry { entry: PhysicalAddress::NULL | DirEntryFlag::EMPTY }
    }
    fn clear(&mut self) {
        self.entry = (PhysicalAddress::NULL) | DirEntryFlag::EMPTY;
    }
}

impl RefTableEntry for TableEntry {
    fn empty() -> Self {
        TableEntry { entry: PhysicalAddress::NULL | TableEntryFlag::EMPTY }
    }

    fn clear(&mut self) {
        self.entry = PhysicalAddress::NULL | TableEntryFlag::EMPTY;
    }
}

impl<T: Sized + Copy + Clone + RefTableEntry> RefTable<T> {
    pub fn wrap(entries: *mut T, size: usize) -> Self {
        debug_assert!(!entries.is_null(), "Impossible to create PageDirectory from null pointer");
        Self { entries, size }
    }
    //the table will be initialized with default values
    pub fn with_default_values(entries: *mut T, size: usize) -> Self {
        let mut table = RefTable::wrap(entries, size);
        table.as_mut_slice()
            .iter_mut()
            .for_each(RefTableEntry::clear);
        table
    }
    pub fn get(&self, index: usize) -> Option<&T> {
        if index >= self.size {
            return None;
        }
        unsafe { Some(self.get_unchecked(index)) }
    }
    pub unsafe fn get_unchecked(&self, index: usize) -> &T {
        debug_assert!(index < self.size);
        let pointer: *mut T = self.entries.add(index);
        &*pointer
    }
    pub fn get_mut(&mut self, index: usize) -> Option<&mut T> {
        if index >= self.size {
            return None;
        }
        unsafe { Some(self.get_mut_unchecked(index)) }
    }
    pub unsafe fn get_mut_unchecked(&mut self, index: usize) -> &mut T {
        debug_assert!(index < self.size);
        let pointer: *mut T = self.entries.add(index);
        &mut *pointer
    }
    pub fn as_slice(&self) -> &[T] {
        unsafe { slice::from_raw_parts(self.entries, self.size) }
    }
    pub fn as_mut_slice(&mut self) -> &mut [T] {
        unsafe { slice::from_raw_parts_mut(self.entries, self.size) }
    }
    pub fn set(&mut self, index: usize, entry: T) -> Result<(), CommonError> {
        if index >= self.size {
            return Err(CommonError::OutOfBounds);
        }
        let pointer = unsafe { self.entries.add(index) };
        unsafe { pointer.write(entry) };
        Ok(())
    }
}

impl RefTable<TableEntry> {
    pub fn wrap_page_table(entry: DirEntry) -> Option<Self> {
        let table_offset = entry.get_table_offset();
        if table_offset == VirtualAddress::NULL {
            return None;
        }
        let entries = table_offset as *mut TableEntry;
        let size = TABLE_ENTRIES_COUNT;
        Some(Self { entries, size })
    }
}

pub enum CommonError {
    OutOfBounds
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

#[repr(C, packed)]
pub struct GDTHandle {
    table_size: u16,
    table: *mut GDTEntry,
}

pub struct CaptureMemRec {
    memory_offset: PhysicalAddress,
    page_cnt: usize,
    next_page: usize,
}

pub struct CaptureAllocator {
    pivots: &'static mut [CaptureMemRec],
}

#[repr(C, packed)]
#[derive(Clone, Copy)]
pub struct DirEntry {
    entry: usize,
}

#[repr(C, packed)]
#[derive(Clone, Copy)]
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

impl PagingProperties {
    pub fn page_directory(&self) -> RefTable<DirEntry> {
        RefTable::wrap(self.directory, DIRECTORY_ENTRIES_COUNT)
    }
    pub fn allocator(&self) -> CaptureAllocator {
        let captures: &mut [CaptureMemRec] =
            unsafe { slice::from_raw_parts_mut(self.captures, self.captures_cnt) };
        CaptureAllocator::new(captures)
    }
    //not used
    #[deprecated]
    fn get_captured_pages() -> usize {
        // let captured_pages: usize = marker
        //     .entries()
        //     .iter()
        //     .filter(|entry| entry.is_present())
        //     .map(|entry| -> usize {
        //         let optional_table_entries = entry.get_table_entries();
        //         if let Some(table_entries) = optional_table_entries {
        //             let live_page_cnt: usize = table_entries
        //                 .iter()
        //                 .filter(|entry| entry.is_present())
        //                 .count();
        //             return live_page_cnt
        //                 + Page::upper_bound(TABLE_ENTRIES_COUNT * TableEntry::BYTE_SIZE);
        //         } else {
        //             unsafe { intrinsics::unreachable(); }
        //         }
        //     })
        //     .sum();
        // return captured_pages;
        0
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
        page_count: usize,
    ) -> Option<PhysicalAddress> {
        let mut mem_offset = None;
        for pivot in self.pivots.iter_mut() {
            if search_offset < pivot.memory_offset {
                mem_offset = pivot.capture_offset(page_count);
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

impl MemoryMappingRegion {
    #[deprecated]
    #[doc = "Show to be replaced by upper list implementation"]
    pub fn next(&self) -> Option<&mut MemoryMappingRegion> {
        if self.next.is_null() {
            return None;
        }
        unsafe { Some(&mut *self.next) }
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
    pub fn new(table_offset: VirtualAddress, flags: DirEntryFlag) -> DirEntry {
        let entry: usize = table_offset.as_physical() | flags.value();
        DirEntry { entry }
    }
    //This is impossible to change offset to PageTable
    //The first reason ― it's a problem how to access memory
    pub fn set_flags(&mut self, flags: DirEntryFlag) {
        self.entry = (self.entry & DirEntry::ADDRESS_MASK) | flags.value();
    }
    pub const fn get_flags(&self) -> DirEntryFlag {
        DirEntryFlag(self.entry & !DirEntry::ADDRESS_MASK)
    }
    pub fn is_present(&self) -> bool {
        self.get_flags().contains(DirEntryFlag::PRESENT)
    }
    pub fn set_table_offset(&mut self, table_offset: VirtualAddress) {
        let flags = self.get_flags();
        self.entry = (table_offset.as_physical() & DirEntry::ADDRESS_MASK) | flags.value();
    }
    pub fn get_table_offset(&self) -> VirtualAddress {
        (self.entry & DirEntry::ADDRESS_MASK).as_virtual()
    }
}

impl TableEntry {
    const ADDRESS_MASK: usize = 0xFF_FF_FC_00;
    const BYTE_SIZE: usize = mem::size_of::<usize>();
    //TableEntry is fully mutable
    //Page and flags should be change per time for entry consistent
    pub fn new(page_offset: PhysicalAddress, flags: TableEntryFlag) -> TableEntry {
        let entry = (page_offset & TableEntry::ADDRESS_MASK) | flags.value();
        TableEntry { entry }
    }
    pub fn set_flags(&mut self, flags: TableEntryFlag) {
        self.entry = (self.entry & TableEntry::ADDRESS_MASK) | flags.value();
    }
    pub fn set_page_offset(&mut self, offset: PhysicalAddress) {
        self.entry = (offset & TableEntry::ADDRESS_MASK) | self.get_flags().value();
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

impl MemoryMappingFlag {
    pub fn as_table_flag(&self) -> TableEntryFlag {
        TableEntryFlag(self.0)
    }
    pub fn as_directory_flag(&self) -> DirEntryFlag {
        DirEntryFlag(self.0)
    }
}
bitflags!(
  pub UnmapParamsFlag(usize),
    PAGES = 0b1,
    TABLES = 0b10

);
impl<T, S> PageMarker<T, S> where
    T: FnMut(usize) -> Option<PhysicalAddress>, //allocate specific count of physical pages
    S: FnMut(PhysicalAddress) {
    pub fn wrap(directory: RefTable<DirEntry>, alloc_handler: T, dealloc_handler: S) -> Self {
        Self { directory, alloc_handler, dealloc_handler }
    }
    fn alloc_pages(&mut self, page_count: usize) -> Option<PhysicalAddress> {
        (self.alloc_handler)(page_count)
    }
    fn dealloc_page(&mut self, offset: PhysicalAddress) {
        (self.dealloc_handler)(offset)
    }
    #[deprecated]
    fn entries(&mut self) -> &mut [DirEntry] {
        self.directory.as_mut_slice()
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

    fn mark_dir_entry(&mut self, virtual_offset: VirtualAddress, flags: DirEntryFlag) {
        let dir_entry = unsafe {
            self.entries()
                .get_unchecked_mut(table_index!(virtual_offset))
        };
        dir_entry.set_flags(flags);
    }
    pub fn map_user_range(
        &mut self,
        map_region: &MemoryMappingRegion,
        flags: MemoryMappingFlag) -> Result<(), PageMarkerError> {
        unsafe {
            self.map_range_unsafe(
                map_region,
                flags,
                true)
        }
    }
    ///the method mark memory in kernel space (doesn't check validness of region offset). That is, not additional memory can be allocated (we mark kernel, ie. memory already mapped)
    pub fn map_kernel_range(
        &mut self,
        map_region: &MemoryMappingRegion,
        flags: MemoryMappingFlag) -> Result<(), PageMarkerError> {
        unsafe {
            self.map_range_unsafe(
                map_region,
                flags,
                false)
        }
    }
    ///This method is used during initialization of kernel structures in bootstrap process.
    ///When no Pages even exists
    //range_offset should be aligned to Page::SIZE
    unsafe fn map_range_unsafe(
        &mut self,
        map_region: &MemoryMappingRegion,
        flags: MemoryMappingFlag,
        can_allocate: bool) -> Result<(), PageMarkerError> {
        let mut addressable_offset = map_region.virtual_offset;
        let mut memory_offset = map_region.physical_offset;
        for _ in 0..map_region.page_count {
            let table_index = table_index!(addressable_offset);
            let entry_index = entry_index!(addressable_offset);
            let dir_entry = self.directory.get_mut_unchecked(table_index);
            let mut page_table = {
                let page_table_option = RefTable::wrap_page_table(dir_entry.clone());
                dir_entry.set_flags(flags.as_directory_flag());
                match page_table_option {
                    None => {
                        if !can_allocate {
                            unreachable()
                            //truly, we should panic
                        }
                        let option_table_offset = self.alloc_pages(TABLE_PAGES_COUNT);
                        if let Some(table_offset) = option_table_offset {
                            RefTable::<TableEntry>::with_default_values(table_offset as *mut TableEntry, TABLE_ENTRIES_COUNT)
                        } else {
                            return Err(PageMarkerError::OutOfMemory);
                        }
                    }
                    Some(page_table) => page_table
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
    pub fn unmap_range(&mut self, virtual_offset: VirtualAddress, page_count: usize, params: UnmapParamsFlag) {
        let mut addressable_offset = virtual_offset;
        for _ in 0..page_count {
            let table_index = table_index!(addressable_offset);
            let entry_index = entry_index!(addressable_offset);
            let dir_entry = unsafe { self.directory.get_unchecked(table_index) };
            let option_page_table = RefTable::wrap_page_table(dir_entry.clone());
            if let Some(mut page_table) = option_page_table {
                let table_entry = unsafe { page_table.get_mut_unchecked(entry_index) };
                table_entry.clear();
                self.dealloc_page(table_entry.get_page_offset());
            }
            addressable_offset += Page::SIZE;
        }
        if !params.contains(UnmapParamsFlag::TABLES) { //no needs to unmap page tables
            return;
        }
        addressable_offset = virtual_offset;
        for _ in 0..page_count {
            let table_index = table_index!(addressable_offset);
            let dir_entry = unsafe { self.directory.get_mut_unchecked(table_index) };
            let page_offset = dir_entry.get_table_offset().as_physical();
            dir_entry.clear();
            self.dealloc_page(page_offset);
        }
    }
    pub fn new(
        &mut self,
        alloc_handler: T,
        dealloc_handler: S) -> Result<PageMarker<T, S>, PageMarkerError>
        where
            T: FnMut(usize) -> Option<PhysicalAddress>,
            S: FnMut(PhysicalAddress) {
        let option_directory_offset: Option<PhysicalAddress> = self.alloc_pages(DIRECTORY_PAGES_COUNT);
        let mut marker: PageMarker<T, S>;
        if let Some(directory_offset) = option_directory_offset {
            let directory = RefTable::<DirEntry>::with_default_values(directory_offset as *mut DirEntry, DIRECTORY_ENTRIES_COUNT);
            marker = PageMarker::wrap(directory, alloc_handler, dealloc_handler);
            let mut map_region = get_kernel_mapping_region();
            loop {
                if let Err(error_code) = unsafe { marker.map_range_unsafe(map_region, KERNEL_LAYOUT_FLAGS, true) } {
                    return Err(error_code);
                }
                if let Some(next_region) = map_region.next() {
                    map_region = next_region;
                } else {
                    break;
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
    use crate::memory::{PhysicalAddress, ToVirtualAddress};

    #[test]
    fn import() {
        // let offset: PhysicalAddress = 0;
        // assert_eq!(offset.as_virtual(), 0xC0_000_000);
    }
}
