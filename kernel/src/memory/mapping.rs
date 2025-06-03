use kernel_types::io::MemoryRemap;

use super::{
    DirEntryFlag, MemoryRegionFlag, Page, PhysicalAddress, TableEntryFlag,
    VirtualAddress,
};

bitflags::bitflags! {
    //something info about range???
    #[derive(Debug, Clone, Copy)]
    pub struct MemoryMappingFlag: usize {
        const KERNEL_LAYOUT = Self::WRITABLE.bits() | Self::PRESENT.bits();
        const USER_LAYOUT = Self::NO_PRIVILEGE.bits() | Self::PRESENT.bits();
        const USER_CODE = Self::NO_PRIVILEGE.bits() | Self::PRESENT.bits();

        const USER_DATA = Self::WRITABLE.bits() | Self::PRESENT.bits() | Self::NO_PRIVILEGE.bits();

        const CACHE_DISABLED = 0b10_000;
        const WRITE_THROUGH = 0b1000;
        const NO_PRIVILEGE = 0b100;
        const WRITABLE = 0b10;
        const PRESENT = 0b1;
        const EMPTY = 0b0;
    }
}

impl From<MemoryRegionFlag> for MemoryMappingFlag {
    fn from(value: MemoryRegionFlag) -> Self {
        let mut flags = MemoryMappingFlag::USER_LAYOUT;

        if value.contains(MemoryRegionFlag::WRITE) {
            flags |= Self::WRITABLE;
        }

        flags
    }
}

//always present
impl MemoryMappingFlag {
    pub fn as_table_flag(&self) -> TableEntryFlag {
        unsafe { TableEntryFlag::wrap(self.bits() | TableEntryFlag::PRESENT) }
    }

    pub fn as_directory_flag(&self) -> DirEntryFlag {
        unsafe { DirEntryFlag::wrap(self.bits() | DirEntryFlag::PRESENT) }
    }
}

#[repr(C)]
///the one represent meor
pub struct MemoryMappingRegion {
    pub flags: MemoryMappingFlag,
    //used to copy
    pub virtual_offset: VirtualAddress,
    pub physical_offset: PhysicalAddress,
    pub page_count: usize,
}

impl Default for MemoryMappingRegion {
    fn default() -> Self {
        Self {
            flags: MemoryMappingFlag::empty(),
            page_count: 0,
            virtual_offset: 0,
            physical_offset: 0,
        }
    }
}

impl<'a> From<&'a MemoryRemap> for MemoryMappingRegion {
    fn from(value: &'a MemoryRemap) -> Self {
        Self {
            page_count: Page::upper_bound(value.len),
            physical_offset: value.physical_start,
            virtual_offset: value.virtual_start,
            flags: MemoryMappingFlag::USER_DATA,
        }
    }
}
