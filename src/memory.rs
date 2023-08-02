use core::ptr;
use bitflags::{bitflags, Flags};
use crate::memory::PageAllocationError::{EmptyDirEntry, ManagerInconsistency, OutOfMemory};
use crate::paging::{Allocator, AllocOffset, KernelAllocator, Page};
use crate::paging::AllocOffset::Any;

extern "C" {
    static KERNEL_VIRTUAL_OFFSET: usize;
    static KERNEL_SIZE: usize;
}

pub struct PageMarker {
    dir_entries: &'static mut [DirEntry; ENTRIES_PER_DIRECTORY],
}

const ENTRIES_PER_DIRECTORY: usize = 1024;
const ENTRIES_PER_TABLE: usize = 1024;

struct PageDirectory {
    entries: &'static mut [DirEntry; ENTRIES_PER_DIRECTORY],
}

pub type PhysicalAddress = usize;
pub type VirtualAddress = usize;

trait ToPhysicalAddress {
    fn to_physical(self) -> PhysicalAddress;
}

trait ToVirtualAddress {
    fn to_virtual(self) -> VirtualAddress;
}

impl ToPhysicalAddress for VirtualAddress {
    fn to_physical(self) -> PhysicalAddress {
        return unsafe {
            self - KERNEL_VIRTUAL_OFFSET
        };
    }
}

impl ToVirtualAddress for PhysicalAddress {
    fn to_virtual(self) -> VirtualAddress {
        return unsafe {
            self + KERNEL_VIRTUAL_OFFSET
        };
    }
}

//todo! make distinctions between physical and virtual address by kernel position
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
impl DirEntry {
    const ADDRESS_MASK: usize = 0xFF_FF_FC_00;
    //upper 20 bits
    //todo! Use available bits by
    pub fn set(&mut self, table_offset: *mut TableEntry, flags: DirEntryFlag) {
        let table_offset = table_offset as VirtualAddress;
        self.entry = table_offset.to_physical() | flags.bits();
    }
    pub fn flags(&self) -> DirEntryFlag {
        return DirEntryFlag::from_bits_truncate(self.entry);
    }
    pub fn table_offset(&self) -> *mut TableEntry {
        let address: PhysicalAddress = self.entry & DirEntry::ADDRESS_MASK;
        return address.to_virtual() as *mut TableEntry;
    }
}

impl TableEntry {
    const ADDRESS_MASK: usize = 0xFF_FF_FC_00;
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
pub enum PageAllocationError {
    EmptyDirEntry,
    EmptyTableEntry,
    OutOfMemory,
    ManagerInconsistency,
}

impl PageMarker {
    pub fn wrap(dir_entries: &'static mut [DirEntry; ENTRIES_PER_DIRECTORY]) -> PageMarker {
        PageMarker { dir_entries }
    }
    pub fn reset(&mut self) {
        for dir_entry in self.dir_entries.iter_mut() {
            dir_entry.set(ptr::null_mut(), DirEntryFlag::EMPTY);
        }
    }
    // pub fn mark_dir_entry(&mut self, )
    //this function allocate required space for pages
    //physical address automatically align to page (for potential performance increase)
    //The only one case when method return None ― when no more
    pub fn mark_table_entry(&mut self, physical_address: PhysicalAddress, virtual_address: VirtualAddress, page_flags: TableEntryFlag) -> Result<&mut TableEntry, PageAllocationError> {
        let physical_address: PhysicalAddress = Page::upper_bound(physical_address);
        let dir_entry_index = table_index!(virtual_address);
        let table_entry_index = entry_index!(virtual_address);
        let dir_entry = unsafe {
            self.dir_entries.get_unchecked_mut(dir_entry_index)
        };
        let result = if dir_entry.flags().contains(DirEntryFlag::PRESENT) {
            let table_entry = unsafe {
                core::slice::from_raw_parts_mut(dir_entry.table_offset(), ENTRIES_PER_DIRECTORY).get_unchecked_mut(table_entry_index)
            };
            table_entry.set(physical_address, page_flags);
            Ok(table_entry)
        } else {
            Err(EmptyDirEntry)
        };
        return result;
    }
}