use core::iter::Filter;
use core::mem::size_of;
use core::ptr;
use bitflags::{bitflags, Flags};
use crate::memory::{PhysicalAddress, VirtualAddress, Page};

extern "C" {
    //Physical address where kernel is stored
    static KERNEL_PHYSICAL_OFFSET: usize;
    //compile-time info about effective size of kernel
    static KERNEL_SIZE: usize;
}

const KERNEL_VIRTUAL_OFFSET: usize = 0xC0_000_000;
//exactly quarter of virtual memory
const ENTRIES_PER_DIRECTORY: usize = 1024;
const ENTRIES_PER_TABLE: usize = 1024;

pub trait ToPhysicalAddress {
    const NULL: usize = 0;
    fn as_physical(&self) -> PhysicalAddress;
}

pub trait ToVirtualAddress {
    fn as_virtual(&self) -> VirtualAddress;
}

pub struct PageMarker {
    dir_entries: &'static mut [DirEntry; ENTRIES_PER_DIRECTORY],
}

pub enum PageMarkerError {
    EmptyDirEntry,
    EmptyTableEntry,
    InvalidTableAddress,
    OutOfMemory,
}

///The Kernel properties are passed from Operation System Loader (asm stub)
/// On each architecture KernelProperties has specific layout and structure
///
#[repr(packed)]
pub struct PagingProperties {
    captures: *mut CaptureMemRec,
    captures_cnt: usize,
    //offset to DirectoryTable
    directory: *mut [DirEntry; ENTRIES_PER_DIRECTORY],
}

pub struct CaptureMemRec {
    memory_offset: PhysicalAddress,
    page_cnt: usize,
    next_page: usize,
}

pub struct CaptureAllocator<'a> {
    pivots: &'a mut [CaptureMemRec],
}

pub struct DirEntry {
    entry: usize,
}

pub struct TableEntry {
    entry: usize,
}
bitflags! {
    pub struct DirEntryFlag: usize {
    const HUGE_SIZE = 0b10_000_000;
    const ACCESSED= 0b100_000;
    const CACHE_DISABLED = 0b10_000;
    const WRITE_THROUGH = 0b1000;
    const NO_PRIVILEGE = 0b100;
    const WRITABLE = 0b10;
    const PRESENT = 0b1;
    const EMPTY = 0b0;
    }
}
bitflags! {
    pub struct TableEntryFlag: usize {
        const GLOBAL = 0b10_000_000;
        const DIRTY = 0b10_000_000;
        const ACCESSED = 0b100_000;
        const CACHE_DISABLED = 0b10_000;
        const WRITE_THROUGH = 0b1000;
        const NO_PRIVILEGE = 0b100;
        const WRITABLE = 0b10;
        const PRESENT = 0b1;
        const EMPTY = 0b0;
    }
}
impl PagingProperties {
    pub fn page_marker(&self) -> PageMarker {
        let dir_entries: &mut [DirEntry; ENTRIES_PER_DIRECTORY] = unsafe {
            self.directory.as_mut().expect("Invalid pointer to PageDirectoryTable")
        };
        PageMarker::wrap(dir_entries)
    }
    pub fn allocator(&mut self) -> CaptureAllocator {
        let captures: &mut [CaptureMemRec] = unsafe {
            core::slice::from_raw_parts_mut(self.captures, self.captures_cnt)
        };
        return CaptureAllocator::new(captures);
    }
    //not used
    fn get_captured_pages(marker: &PageMarker) -> usize {
        let captured_pages: usize = marker.dir_entries.iter()
            .filter(|entry| entry.is_present())
            .map(|entry| -> usize {
                let table_entries: &mut [TableEntry] = entry.table_entries().unwrap();
                let live_page_cnt: usize = table_entries.iter()
                    .filter(|entry| entry.is_present())
                    .count();
                return live_page_cnt + Page::upper_bound(ENTRIES_PER_TABLE * TableEntry::BYTE_SIZE);
            }).sum();
        return captured_pages;
    }
}

impl CaptureMemRec {
    pub fn free_pages(&self) -> usize {
        return self.page_cnt - self.next_page;
    }
    pub fn capture_offset(&mut self, page_cnt: usize) -> Option<PhysicalAddress> {
        let rest_pages = self.free_pages();
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
}

impl<'a> CaptureAllocator<'a> {
    pub fn new(captures: &mut [CaptureMemRec]) -> CaptureAllocator {
        CaptureAllocator { pivots: captures }
    }
    pub fn alloc(&mut self, search_offset: Option<usize>, page_cnt: usize) -> Option<PhysicalAddress> {
        let mut mem_offset = None;
        for pivot in self.pivots.iter_mut() {
            if search_offset.is_none() || search_offset.unwrap() <= pivot.memory_offset {
                mem_offset = pivot.capture_offset(page_cnt);
            }
            if mem_offset.is_some() {
                break;
            }
        }
        return mem_offset;
    }
}

impl ToPhysicalAddress for VirtualAddress {
    fn as_physical(&self) -> PhysicalAddress {
        return unsafe {
            self - KERNEL_VIRTUAL_OFFSET
        };
    }
}

impl ToVirtualAddress for PhysicalAddress {
    fn as_virtual(&self) -> VirtualAddress {
        return unsafe {
            self + KERNEL_VIRTUAL_OFFSET
        };
    }
}

impl DirEntryFlag {
    pub fn as_table_entry_flags(&self) -> TableEntryFlag {
        return TableEntryFlag::from_bits_truncate(self.bits() & !(DirEntryFlag::HUGE_SIZE.bits()));
    }
}

impl TableEntryFlag {
    pub fn as_dir_entry_flags(&self) -> DirEntryFlag {
        return DirEntryFlag::from_bits_truncate(self.bits() & !(TableEntryFlag::GLOBAL.bits() | TableEntryFlag::DIRTY.bits()));
    }
}

impl DirEntry {
    const ADDRESS_MASK: usize = 0xFF_FF_FC_00;
    const BYTE_SIZE: usize = core::mem::size_of::<usize>();
    //upper 20 bits
    pub fn set(&mut self, table_offset: Option<&'static mut [TableEntry]>, flags: DirEntryFlag) {
        let virtual_offset: VirtualAddress;
        if table_offset.is_some() {
            let table_offset: *mut TableEntry = table_offset.unwrap().as_mut_ptr();
            virtual_offset = table_offset as VirtualAddress;
        } else {
            virtual_offset = VirtualAddress::NULL;
        }
        self.entry = virtual_offset.as_physical() | flags.bits();
    }
    pub fn flags(&self) -> DirEntryFlag {
        return DirEntryFlag::from_bits_truncate(self.entry);
    }
    pub fn is_present(&self) -> bool {
        return self.flags().contains(DirEntryFlag::PRESENT);
    }
    //return virtual offset stored in entry
    //Each should be already accessible. So, this method only use real value of entry and convert to reference (whereas of value)
    pub fn table_entries(&self) -> Option<&mut [TableEntry]> {
        let table_offset: Option<&mut [TableEntry]>;
        let address: PhysicalAddress = self.entry & DirEntry::ADDRESS_MASK;
        if address != PhysicalAddress::NULL {
            let virtual_offset: &mut [TableEntry] = unsafe {
                core::slice::from_raw_parts_mut(address.as_virtual() as *mut TableEntry, ENTRIES_PER_TABLE)
            };
            table_offset = Some(virtual_offset);
        } else {
            table_offset = None;
        }
        return table_offset;
    }
}

impl TableEntry {
    const ADDRESS_MASK: usize = 0xFF_FF_FC_00;
    const BYTE_SIZE: usize = core::mem::size_of::<usize>();
    //upper 20 bits
    pub fn set(&mut self, page_offset: PhysicalAddress, flags: TableEntryFlag) {
        self.entry = page_offset & TableEntry::ADDRESS_MASK | flags.bits();
    }
    pub fn flags(&self) -> TableEntryFlag {
        return TableEntryFlag::from_bits_truncate(self.entry);
    }
    pub fn page_offset(&self) -> PhysicalAddress {
        return self.entry & TableEntry::ADDRESS_MASK;
    }
    pub fn is_present(&self) -> bool {
        return self.flags().contains(TableEntryFlag::PRESENT);
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

impl PageMarker {
    pub fn wrap(dir_entries: &'static mut [DirEntry; ENTRIES_PER_DIRECTORY]) -> PageMarker {
        PageMarker { dir_entries }
    }
    pub fn reset(&mut self) {
        for dir_entry in self.dir_entries.iter_mut() {
            dir_entry.set(None, DirEntryFlag::EMPTY);
        }
    }
    //physical address automatically align to page (for potential performance increase)
    //TableEntryFlag::PRESENT is used automatically in best case (if even passed flag doesn't holds present flag -> it will holds PRESENT)
    pub fn mark_table_entry(&mut self, physical_address: PhysicalAddress, virtual_address: VirtualAddress, page_flags: TableEntryFlag) -> Result<(), PageMarkerError> {
        let physical_address: PhysicalAddress = Page::upper_bound(physical_address);
        let dir_entry_index = table_index!(virtual_address);
        let table_entry_index = entry_index!(virtual_address);
        let dir_entry = unsafe {
            self.dir_entries.get_unchecked_mut(dir_entry_index)
        };
        let result: Result<(), PageMarkerError>;
        if dir_entry.is_present() {
            let table_entries = dir_entry.table_entries();
            if table_entries.is_some() {
                let table_entries = table_entries.unwrap();
                let entry = unsafe {
                    table_entries.get_unchecked_mut(table_entry_index)
                };
                if entry.is_present() {
                    entry.set(physical_address, page_flags | TableEntryFlag::PRESENT);
                    result = Ok(());
                } else {
                    result = Err(PageMarkerError::EmptyTableEntry);
                }
            } else {
                result = Err(PageMarkerError::InvalidTableAddress);
            }
        } else {
            result = Err(PageMarkerError::EmptyDirEntry);
        }
        return result;
    }
    pub fn new<T, S>(&self, alloc_handler: T, free_handler: S) -> Result<PageMarker, PageMarkerError>
        where T: FnMut(usize) -> Option<PhysicalAddress>,
              S: FnMut(PhysicalAddress) -> () {
        let result: Result<PageMarker, PageMarkerError>;
        let directory = alloc_handler(Page::upper_bound(ENTRIES_PER_DIRECTORY) * DirEntry::BYTE_SIZE);
        if directory.is_some() {
            let directory_offset = directory.unwrap();
            let tables = alloc_handler(ENTRIES_PER_DIRECTORY);
            if tables.is_some() {} else {
                free_handler(directory_offset);
                result = Err(PageMarkerError::OutOfMemory);
            }
        } else {
            result = Err(PageMarkerError::OutOfMemory);
        }
        return result;
    }
}
