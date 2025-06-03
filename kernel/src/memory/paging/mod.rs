use core::arch::asm;
use core::mem::MaybeUninit;
use core::ptr::NonNull;

use static_assertions::assert_eq_size;

use kernel_types::{declare_constants, Zeroed};

use crate::memory::paging::table::DirEntry;
use crate::memory::{
    MemoryDescriptor, Page, SegmentSelector, TaskStateDescriptor,
    VirtualAddress,
};

mod directory;
mod marker;
pub(crate) mod table;

pub use directory::*;
pub use marker::*;

use super::{kernel_virtual_offset, PhysicalAddress};

declare_constants!(
    pub usize,
    DIRECTORY_ENTRIES_COUNT = 1024;
    TABLE_ENTRIES_COUNT = 1024;

    DIRECTORY_PAGES_COUNT = 1;
    TABLE_PAGES_COUNT = 1;
);

pub type PageDirectoryEntries<'a> = [DirEntry<'a>; DIRECTORY_ENTRIES_COUNT];

pub enum CommonError {
    OutOfBounds,
}

#[derive(Debug, thiserror_no_std::Error)]
pub enum PageMarkerError {
    #[error("Empty Page Directory Entry for  {0:X?}")]
    EmptyDirEntry(*mut u8),
    #[error("Empty Page Table Entry")]
    EmptyTableEntry,
    #[error("Invalid Table Address")]
    InvalidTableAddress,
    #[error("No Memory")]
    OutOfMemory,
    #[error("Captured Memory Range")]
    CapturedMemoryRange,
}

/// show which modules should be disabled/enabled at boot time
#[repr(C)]
pub struct PagingProperties {
    directory: *mut DirEntry<'static>,
    handle: *mut GDTHandle,
    heap_offset: VirtualAddress,
    captures: *mut CaptureMemRec,
    captures_cnt: usize,
}

#[derive(Clone)]
#[repr(C)]
pub struct GDTTable {
    null: Zeroed<MemoryDescriptor>,
    kernel_code: MemoryDescriptor,
    kernel_data: MemoryDescriptor,
    user_code: MemoryDescriptor,
    user_data: MemoryDescriptor,
    task: TaskStateDescriptor,
}

assert_eq_size!(GDTTable, [usize; 2 * 6]);

impl GDTTable {
    pub const fn null() -> Self {
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
    table: VirtualAddress,
}

impl GDTHandle {
    pub const fn null() -> Self {
        unsafe { MaybeUninit::zeroed().assume_init() }
    }

    pub fn new(table: *const GDTTable) -> Self {
        Self {
            table: table as VirtualAddress,
            table_size: core::mem::size_of::<GDTTable>() as u16,
        }
    }

    pub fn load(&self) {
        unsafe {
            asm! {
                "lgdt [{0}]",
                in(reg) self
            }
        }
    }
}

///The common information about physical memory region
///Supported only ZONE_NORMAL memory (see linux kernel docs)
#[repr(C)]
pub struct CaptureMemRec {
    kind: u32,
    ///The next free page
    next_page: usize,
    ///The common count of pages in region
    page_count: usize,
    ///The start physical offset of region
    memory_offset: usize,
}

#[derive(
    Debug,
    Clone,
    Copy,
    PartialEq,
    Eq,
    num_enum::FromPrimitive,
    num_enum::IntoPrimitive,
)]
#[repr(u32)]
pub enum MemoryKind {
    Available = 1,
    /// Usable memory holding ACPI information
    Acpi = 3,
    /// Reserved memory which needs to be preserved on hibernation
    Hibernation = 4,
    /// Occupied by defective RAM modules
    DefectiveRam = 5,
    #[num_enum(default)]
    Reserved,
}

pub struct BootAllocator<'a> {
    pivots: NonNull<CaptureMemRec>,
    len: &'a mut usize,
}

impl PagingProperties {
    pub fn page_directory(&self) -> PageDirectory<'static, 'static> {
        let entries = unsafe { core::mem::transmute(self.directory) };

        let ph_offset =
            (self.directory as VirtualAddress) - kernel_virtual_offset();

        PageDirectory {
            entries,
            physical_offset: ph_offset,
        }
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
            let table_offset = (*self.handle).table + kernel_virtual_offset();
            let raw_table = table_offset as *mut GDTTable;
            NonNull::new_unchecked(raw_table)
        }
    }
}

impl CaptureMemRec {
    // I don't know why, but using MemoryKind instead raw kind
    // cause invalid kind in struct
    pub fn new(memory_offset: PhysicalAddress, size: usize, kind: u32) -> Self {
        let page_count = Page::lower_bound(size);

        Self {
            kind,
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

    pub fn kind(&self) -> MemoryKind {
        self.kind.into()
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
macro_rules! page_index {
    ($argument:expr) => {
        ($argument >> 12) & 0x3FF
    };
}

#[cfg(test)]
mod tests {
    use crate::memory::paging::MemoryKind;

    extern crate alloc;
    extern crate std;

    #[test]
    fn memory_kind_test() {
        let zero = MemoryKind::from(0u32);
        assert_eq!(zero, MemoryKind::Reserved);

        let one = MemoryKind::from(1u32);
        assert_eq!(one, MemoryKind::Available);

        let two = MemoryKind::from(3u32);
        assert_eq!(two, MemoryKind::Acpi);
        // let offset: PhysicalAddress = 0;
        // assert_eq!(offset.as_virtual(), 0xC0_000_000);
    }
}
