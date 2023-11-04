mod allocators;
pub mod atomics;
mod paging;


use core::mem;
use core::mem::MaybeUninit;
use core::ptr::NonNull;
use core::ops::Range;
pub use allocators::PageAllocator;
pub use paging::{PagingProperties};


use crate::{bitflags, declare_constants};
use crate::memory::paging::{CaptureAllocator, DirEntry, PageMarker, RefTable};
pub use atomics::AtomicCell;
use crate::utils::{LinkedList, ListNode, SimpleList};

pub enum ZoneType {
    Usable,
    Device,
}

pub trait ToPhysicalAddress {
    const NULL: usize = 0;
    fn as_physical(&self) -> PhysicalAddress;
}

pub trait ToVirtualAddress {
    fn as_virtual(&self) -> VirtualAddress;
}

pub type PhysicalAddress = usize;
pub type VirtualAddress = usize;

#[derive(Clone, Copy)]
pub struct SegmentSelector(u16);

impl SegmentSelector {
    pub const CODE: SegmentSelector = SegmentSelector(0x08);
    pub const DATA: SegmentSelector = SegmentSelector(0x10);
    pub const STACK: SegmentSelector = SegmentSelector(0x10);
    pub const NULL: SegmentSelector = SegmentSelector(0);
}


impl From<SegmentSelector> for u16 {
    fn from(value: SegmentSelector) -> Self {
        value.0
    }
}
bitflags!(
    //something info about range???
    pub MemoryMappingFlag(usize),
    ACCESSED = 0b100_000,
    CACHE_DISABLED = 0b10_000,
    WRITE_THROUGH = 0b1000,
    NO_PRIVILEGE = 0b100,
    WRITABLE = 0b10,
    PRESENT = 0b1,
    EMPTY = 0b0
);
bitflags!(
    pub PageFlag(usize),
    ACTIVE = 0x01,
    DIRTY = 0x02,
    ERROR = 0x04,
    LOCKED = 0x08,
    UNUSED = 0x10
);
bitflags!(
    pub MemoryRegionFlag(usize),
    READ = 0x01,
    WRITE = 0x02,
    EXEC = 0x04,
    //todo flags
    SHARING = 0x08,
    SEQ_READ = 0x10,
    RAND_READ = 0x20,
);
pub fn stack_size() -> usize {
    unsafe { paging::KERNEL_STACK_SIZE }
}

pub type AllocHandler = fn(usize) -> Option<PhysicalAddress>;
pub type DeallocHandler = fn(PhysicalAddress);

/// What is a PageLayout table? PageLayout table is solid array (table) of PageRec in memory
pub struct ProcessMemoryHandle {
    ///offset of data segment
    ///It's redundant to store any information about last page ― it's can be easily calculated from heap_offset as:<br>
    ///<code> heap_offset % Page::SIZE </code> <br>
    ///index of last touched page in PageLayout Table
    //I believe that heap_offset should be aligned to Page::SIZE. Practically, space will be access
    //offset of stack memory -> used for erasing stack memory
    stack_offset: VirtualAddress,
    code_range: Range<VirtualAddress>,
    data_range: Range<VirtualAddress>,
    heap_range: Range<VirtualAddress>,
    last_page_index: usize,
    //Write | NoPrivilege
    marker: PageMarker<AllocHandler, DeallocHandler>,
    regions: SimpleList<MemoryRegion>,
    last_touched_region: Option<NonNull<MemoryRegion>>,
    directory: NonNull<RefTable<DirEntry>>,
}

impl ProcessMemoryHandle {
    pub fn find_region(&mut self, address: VirtualAddress) -> Option<NonNull<MemoryRegion>> {
        if let Some(last_region) = self.last_touched_region {
            unsafe {
                if last_region.as_ref().range.contains(&address) {
                    return Some(last_region);
                }
            }
        }
        for region in self.regions.iter() {
            if region.range.contains(&address) {
                return Some(NonNull::from(region));
            }
        }
        return None;
    }
    pub fn find_prev_region(&mut self, address: VirtualAddress) -> Option<NonNull<MemoryRegion>> {
        None
    }
    pub fn find_intersect_region(&mut self, range: Range<VirtualAddress>) -> Option<NonNull<MemoryRegion>> {
        let option_region = self.find_region(range.start);
        unsafe {
            if let Some(region) = option_region && region.as_ref().range.end < range.end {
                return Some(region);
            }
        }
        None
    }
}

pub struct MemoryRegion {
    parent: NonNull<ProcessMemoryHandle>,
    range: Range<VirtualAddress>,
    permissions: MemoryRegionFlag,

    //mapped_file: MemoryMappedFile,
    //file_offset: usize
}

impl MemoryRegion {
    pub const fn new() -> Self {
        todo!()
    }
    ///invoked when MemoryRegion is removed from address space
    pub fn close() {}
    pub fn no_page(&mut self) -> NonNull<Page> {
        todo!()
    }
    pub fn populate(&mut self) -> usize {
        0
    }
}

pub struct AddressSpace {
    clean_pages: LinkedList<Page>,
    dirty_pages: LinkedList<Page>,
    locked_pages: LinkedList<Page>,
    total_pages_count: usize,
}

#[derive(Copy, Clone)]
pub struct MemoryMappingRegion {
    flags: MemoryMappingFlag,
    //used to copy
    virtual_offset: VirtualAddress,
    physical_offset: PhysicalAddress,
    page_count: usize,
    next: *mut MemoryMappingRegion,
}

#[repr(C)]
pub struct Page {
    flags: PageFlag,
    //it's easy to use in calculation, in future should be replace by macro
    //when zero page should be free
    ref_count: usize,
}

///Return crucial structures for kernel
///Without them, it's impossible
pub fn init_kernel_space(
    _allocator: CaptureAllocator,
    _dir_table: RefTable<DirEntry>,
) -> (PageAllocator, ProcessMemoryHandle) {
    //walk throw free physical memory to create initial mem_map
    //free identity map from global table and add to mem_map too

    // let marker = PageMarker::wrap(dir_table,
    //                               |page_count| allocator.alloc(0, page_count),
    //                               |free_page| unreachable!());

    // let (allocator, heap_offset) =
    //     PageAllocator::new(allocator, &mut marker, paging::get_heap_initial_offset());
    // let layout = MemoryLayoutRec {
    //     heap_offset,
    //     stack_offset: 0, //what about stack
    //     last_page_index: 0,
    //     heap_pages: PageList::empty(),
    //     stack_pages: PageList::empty(),
    //     flags: KERNEL_LAYOUT_FLAGS,
    //     marker,
    // };
    // return (allocator, layout);
    todo!()
}

const KERNEL_LAYOUT_FLAGS: MemoryMappingFlag =
    MemoryMappingFlag(MemoryMappingFlag::WRITABLE | MemoryMappingFlag::WRITE_THROUGH);
declare_constants!(
    pub usize,
    MAX_PHYSICAL_MEMORY_SIZE = 32 * 1024 * 1024;//bytes
    MEMORY_MAP_SIZE = MAX_PHYSICAL_MEMORY_SIZE / Page::SIZE, "the count of pages in memory map array";
);
#[repr(transparent)]
pub struct MemoryMap {
    pages: [ListNode<Page>; MEMORY_MAP_SIZE],
}

extern "C" {
    static mut MEMORY_MAP: MemoryMap;
}

impl ToPhysicalAddress for Page {
    fn as_physical(&self) -> PhysicalAddress {
        paging::get_kernel_page_offset();
        let mem_map_offset = unsafe {&MEMORY_MAP};
        // self as *const Page
        todo!()
    }
}

impl Page {
    declare_constants!(
        pub usize,
        OFFSET = 12, "the offset of page";
        SIZE = 1 << Page::OFFSET, "the size in bytes of page";
    );
    pub const fn empty() -> Self {
        Self {
            flags: PageFlag::wrap(PageFlag::UNUSED),
            ref_count: 0,
        }
    }
    //utility methods
    pub const fn upper_bound(byte_size: usize) -> usize {
        return (byte_size + Page::SIZE - 1) / Page::SIZE;
    }
    pub const fn lower_bound(byte_size: usize) -> usize {
        return byte_size / Page::SIZE;
    }
}