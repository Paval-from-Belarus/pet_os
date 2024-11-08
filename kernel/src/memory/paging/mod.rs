use core::arch::asm;
use core::cell::UnsafeCell;
use core::mem::MaybeUninit;
use core::ptr::NonNull;

use static_assertions::assert_eq_size;

use kernel_types::{bitflags, declare_constants, Zeroed};

use crate::memory::paging::table::{DirEntry, DirEntryFlag, TableEntryFlag};
use crate::memory::{
    MemoryDescriptor, MemoryMappingFlag, Page, PhysicalAddress,
    SegmentSelector, TaskStateDescriptor, ToVirtualAddress, VirtualAddress,
};

mod marker;
pub(crate) mod table;

pub use marker::*;

declare_constants!(
    pub usize,
    DIRECTORY_ENTRIES_COUNT = 1024;
    TABLE_ENTRIES_COUNT = 1024;
    DIRECTORY_PAGES_COUNT = 1;
    TABLE_PAGES_COUNT = 1;
);

pub type PageDirectory<'a> = [DirEntry<'a>; DIRECTORY_ENTRIES_COUNT];

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
    directory: *mut DirEntry<'static>,
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
    pub fn page_directory(&self) -> &'static mut PageDirectory<'static> {
        unsafe { core::mem::transmute(self.directory) }
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

//always present
impl MemoryMappingFlag {
    pub fn as_table_flag(&self) -> TableEntryFlag {
        unsafe { TableEntryFlag::wrap(self.0 | TableEntryFlag::PRESENT) }
    }

    pub fn as_directory_flag(&self) -> DirEntryFlag {
        unsafe { DirEntryFlag::wrap(self.0 | DirEntryFlag::PRESENT) }
    }
}

bitflags!(
  pub UnmapParamsFlag(usize),
    PAGES = 0b1,
    TABLES = 0b10

);

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
