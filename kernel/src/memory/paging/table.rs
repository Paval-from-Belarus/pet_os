use core::marker::PhantomData;
use core::mem;
use kernel_types::bitflags;

use crate::memory::paging::TABLE_ENTRIES_COUNT;
use crate::memory::{Page, PhysicalAddress};

pub trait RefTableEntry {
    fn empty() -> Self;
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
#[derive(Debug, Clone, Copy)]
pub struct DirEntry<'a> {
    entry: usize,
    _marker: PhantomData<&'a mut u8>,
}

#[repr(transparent)]
#[derive(Clone)]
pub struct TableEntry<'a> {
    entry: usize,
    _marker: PhantomData<&'a mut u8>,
}

impl<'a> RefTableEntry for DirEntry<'a> {
    fn empty() -> Self {
        DirEntry {
            entry: 0,
            _marker: PhantomData,
        }
    }
}

impl<'a> RefTableEntry for TableEntry<'a> {
    fn empty() -> Self {
        TableEntry {
            entry: 0,
            _marker: PhantomData,
        }
    }
}

//todo: replace DirEntry impl block with mask
//There are three groups of macro:
//1) none/present/bad (bad means present + accessed? but accessed is not used)
//2) permissions (read/write/execute)
//3) young/dirty (accessed and dirty)
//Additional function: mapping page entry to page struct; mapping page struct to page entry; storing page entry (all this function accomplish PageMarker)
impl<'a> DirEntry<'a> {
    const ADDRESS_MASK: usize = 0xFF_FF_FC_00;
    const BYTE_SIZE: usize = mem::size_of::<usize>();

    pub fn new(
        ph_offset: PhysicalAddress,
        flags: DirEntryFlag,
    ) -> DirEntry<'a> {
        let entry: usize = ph_offset | flags.bits();

        DirEntry {
            entry,
            _marker: PhantomData,
        }
    }
    //This is impossible to change offset to PageTable
    //The first reason ― it's a problem how to access memory
    pub fn set_flags(&mut self, flags: DirEntryFlag) {
        self.entry = (self.entry & DirEntry::ADDRESS_MASK) | flags.bits();
    }

    pub const fn flags(&self) -> DirEntryFlag {
        DirEntryFlag(self.entry & !DirEntry::ADDRESS_MASK)
    }

    pub fn has_page_table(&self) -> bool {
        self.page_table().is_some()
    }

    pub fn clear(&mut self) -> Option<PhysicalAddress> {
        let offset = self.entry & DirEntry::ADDRESS_MASK;

        let ph_offset = (offset != 0).then_some(offset);

        self.entry = 0;

        ph_offset
    }

    pub fn set_ph_offset(&mut self, ph_offset: PhysicalAddress) {
        assert!(ph_offset != 0);

        let flags = self.flags();

        self.entry = (ph_offset & DirEntry::ADDRESS_MASK) | flags.bits();
    }

    pub fn ph_offset(&self) -> Option<PhysicalAddress> {
        let offset = self.entry & DirEntry::ADDRESS_MASK;

        (offset != 0).then_some(offset)
    }

    pub fn page_table(&self) -> Option<&[TableEntry<'a>]> {
        let ph_offset = self.ph_offset()?;

        let offset = Page::take(ph_offset).as_virtual()?;

        let page_table = unsafe {
            core::slice::from_raw_parts(
                offset as *const TableEntry,
                TABLE_ENTRIES_COUNT,
            )
        };

        page_table.into()
    }

    pub fn page_table_mut(&mut self) -> Option<&mut [TableEntry<'a>]> {
        let ph_offset = self.ph_offset()?;

        let virt_offset = Page::take(ph_offset).as_virtual()?;


        let page_table = unsafe {
            core::slice::from_raw_parts_mut(
                virt_offset as *mut TableEntry,
                TABLE_ENTRIES_COUNT,
            )
        };

        Some(page_table)
    }
}

impl<'a> TableEntry<'a> {
    const ADDRESS_MASK: usize = 0xFF_FF_FC_00;
    const BYTE_SIZE: usize = mem::size_of::<usize>();
    //TableEntry is fully mutable
    //Page and flags should be change per time for entry consistent
    pub fn new(
        page_offset: PhysicalAddress,
        flags: TableEntryFlag,
    ) -> TableEntry<'a> {
        let entry = (page_offset & TableEntry::ADDRESS_MASK) | flags.bits();

        TableEntry {
            entry,
            _marker: PhantomData,
        }
    }

    pub fn set_flags(&mut self, flags: TableEntryFlag) {
        self.entry = (self.entry & TableEntry::ADDRESS_MASK) | flags.bits();
    }

    pub fn set_page_offset(&mut self, ph_offset: PhysicalAddress) {
        self.entry =
            (ph_offset & TableEntry::ADDRESS_MASK) | self.flags().bits();
    }

    pub fn flags(&self) -> TableEntryFlag {
        TableEntryFlag(self.entry & !TableEntry::ADDRESS_MASK)
    }

    pub fn clear(&mut self) -> Option<PhysicalAddress> {
        let offset = self.entry & TableEntry::ADDRESS_MASK;

        let ph_offset = (offset != 0).then(|| offset);

        self.entry = 0;

        ph_offset
    }

    pub fn ph_offset(&self) -> Option<PhysicalAddress> {
        let offset = self.entry & TableEntry::ADDRESS_MASK;

        (offset != 0).then_some(offset)
    }

    pub fn has_page(&self) -> bool {
        self.as_bytes().is_some()
    }

    pub fn as_bytes(&self) -> Option<&'a [u8]> {
        let ph_offset = self.ph_offset()?;

        let virt_offset = Page::take(ph_offset).as_virtual()?;

        let bytes = unsafe {
            core::slice::from_raw_parts(
                virt_offset as *const u8,
                TABLE_ENTRIES_COUNT,
            )
        };

        Some(bytes)
    }

    pub fn as_bytes_mut(&mut self) -> Option<&'a mut [u8]> {
        let ph_offset = self.ph_offset()?;

        let virt_offset = Page::take(ph_offset).as_virtual()?;

        let bytes = unsafe {
            core::slice::from_raw_parts_mut(
                virt_offset as *mut u8,
                TABLE_ENTRIES_COUNT,
            )
        };

        Some(bytes)
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
