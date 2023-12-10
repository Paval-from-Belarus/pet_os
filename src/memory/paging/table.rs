use core::{mem, slice};
use crate::bitflags;
use crate::memory::paging::{CommonError, TABLE_ENTRIES_COUNT};
use crate::memory::{PhysicalAddress, ToPhysicalAddress, ToVirtualAddress, VirtualAddress};

pub struct RefTable<T> {
    entries: *mut T,
    size: usize,
}

pub trait RefTableEntry {
    fn empty() -> Self;
    fn clear(&mut self);
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
#[repr(transparent)]
#[derive(Clone, Copy)]
pub struct DirEntry {
    entry: usize,
}

#[repr(transparent)]
#[derive(Clone, Copy)]
pub struct TableEntry {
    entry: usize,
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
impl RefTable<DirEntry> {
    ///load table in CPU register
    pub unsafe fn load(&self) {
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

//todo: replace DirEntry impl block with mask
//There are three groups of macro:
//1) none/present/bad (bad means present + accessed? but accessed is not used)
//2) permissions (read/write/execute)
//3) young/dirty (accessed and dirty)
//Additional function: mapping page entry to page struct; mapping page struct to page entry; storing page entry (all this function accomplish PageMarker)
impl DirEntry {
    const ADDRESS_MASK: usize = 0xFF_FF_FC_00;
    const BYTE_SIZE: usize = mem::size_of::<usize>();
    pub fn new(table_offset: VirtualAddress, flags: DirEntryFlag) -> DirEntry {
        let entry: usize = table_offset.as_physical() | flags.bits();
        DirEntry { entry }
    }
    //This is impossible to change offset to PageTable
    //The first reason ― it's a problem how to access memory
    pub fn set_flags(&mut self, flags: DirEntryFlag) {
        self.entry = (self.entry & DirEntry::ADDRESS_MASK) | flags.bits();
    }
    pub const fn get_flags(&self) -> DirEntryFlag {
        DirEntryFlag(self.entry & !DirEntry::ADDRESS_MASK)
    }
    pub fn is_present(&self) -> bool {
        self.get_flags().test_with(DirEntryFlag::PRESENT)
    }
    pub fn set_table_offset(&mut self, table_offset: VirtualAddress) {
        let flags = self.get_flags();
        self.entry = (table_offset.as_physical() & DirEntry::ADDRESS_MASK) | flags.bits();
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
        let entry = (page_offset & TableEntry::ADDRESS_MASK) | flags.bits();
        TableEntry { entry }
    }
    pub fn set_flags(&mut self, flags: TableEntryFlag) {
        self.entry = (self.entry & TableEntry::ADDRESS_MASK) | flags.bits();
    }
    pub fn set_page_offset(&mut self, offset: PhysicalAddress) {
        self.entry = (offset & TableEntry::ADDRESS_MASK) | self.get_flags().bits();
    }
    pub fn get_flags(&self) -> TableEntryFlag {
        TableEntryFlag(self.entry & !TableEntry::ADDRESS_MASK)
    }
    pub fn get_page_offset(&self) -> PhysicalAddress {
        self.entry & TableEntry::ADDRESS_MASK
    }
    pub fn is_present(&self) -> bool {
        self.get_flags().test_with(TableEntryFlag::PRESENT)
    }
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




