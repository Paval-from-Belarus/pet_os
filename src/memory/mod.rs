mod allocators;
pub mod atomics;
mod paging;


use core::ptr::{NonNull, null_mut};
use core::ops::Range;
pub use allocators::PageAllocator;
pub use paging::PagingProperties;


use crate::{bitflags, declare_constants, log, memory};
use crate::memory::paging::{CaptureAllocator, PageMarker, UnmapParamsFlag};
pub use atomics::AtomicCell;
use core::{mem, ptr};

use static_assertions::assert_eq_size;
use paging::table::{DirEntry, RefTable};
use crate::memory::atomics::{SpinLock, SpinLockLazyCell};
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

extern "C" {
    //Physical address where kernel is stored
    static KERNEL_PHYSICAL_OFFSET: usize;
    //compile-time info about effective size of kernel
    static KERNEL_SIZE: usize;
    //offset after which memory is free to use
    static KERNEL_VIRTUAL_OFFSET: usize;
    static KERNEL_STACK_SIZE: usize;
}

pub type PhysicalAddress = usize;
pub type VirtualAddress = usize;

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

static mut PHYSICAL_ALLOCATOR: SpinLockLazyCell<PageAllocator> = SpinLockLazyCell::empty();

///Return crucial structures for kernel
///Without them, it's impossible
pub fn init_kernel_space(
    mut allocator: CaptureAllocator,
    directory: RefTable<DirEntry>,
    heap_offset: VirtualAddress,
) {
    let free_pages = collect_free_pages(&mut allocator);
    let allocator = PageAllocator::new(free_pages);
    unsafe { PHYSICAL_ALLOCATOR.set(allocator) };
    let mut marker = PageMarker::wrap(directory, alloc_physical_pages, dealloc_page);
    let higher_addresses_start = kernel_physical_offset();
    let boot_mapping_pages = kernel_virtual_offset() / Page::SIZE;
    let unmap_flags = UnmapParamsFlag::from(UnmapParamsFlag::TABLES | UnmapParamsFlag::PAGES);
    //the higher addesses are fully mapped by the kernel
    marker.unmap_range(higher_addresses_start, boot_mapping_pages, unmap_flags);
}

fn alloc_physical_pages(page_count: usize) -> Option<PhysicalAddress> {
    let mut allocator = unsafe { PHYSICAL_ALLOCATOR.get() };
    allocator.alloc_pages(page_count)
}

fn dealloc_page(offset: PhysicalAddress) {
    let mut allocator = unsafe { PHYSICAL_ALLOCATOR.get() };
    allocator.dealloc_page(offset);
}

fn collect_free_pages(allocator: &mut CaptureAllocator) -> LinkedList<Page> {
    let mut free_pages = LinkedList::<Page>::empty();
    for pivot in allocator.as_pivots() {
        let mut mem_offset = pivot.mem_offset();
        for _ in 0..pivot.free_pages_count() {
            unsafe {
                let node = ListNode::<Page>::wrap_page(mem_offset);
                free_pages.push_back(node);
            }
            mem_offset += Page::SIZE;
        }
    }
    free_pages
}

///Collect identity mapping pages and remove from RefTable
///By this way, RefTable will holds only entries on kernel space
fn collect_identity_mapping_pages(table: &mut RefTable<DirEntry>) -> LinkedList<Page> {
    let entries = table.as_mut_slice();
    todo!()
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

pub fn kernel_binary_size() -> usize {
    unsafe { KERNEL_SIZE }
}

pub fn kernel_page_size() -> usize {
    Page::upper_bound(kernel_binary_size())
}

pub fn kernel_virtual_offset() -> usize {
    unsafe { KERNEL_VIRTUAL_OFFSET }
}

pub fn kernel_physical_offset() -> usize {
    unsafe { KERNEL_PHYSICAL_OFFSET }
}

pub fn stack_size() -> usize {
    unsafe { KERNEL_STACK_SIZE }
}

pub fn get_kernel_mapping_region() -> &'static mut MemoryMappingRegion {
    let page_list_size = 42; //replace with valid value
    let _kernel_size = kernel_binary_size() + page_list_size;
    let _kernel_region = MemoryMappingRegion {
        flags: MemoryMappingFlag::from(MemoryMappingFlag::PRESENT),
        virtual_offset: 0,
        physical_offset: 0,
        page_count: 0,
        next: ptr::null_mut(),
    };
    unsafe { &mut *(ptr::null_mut() as *mut MemoryMappingRegion) }
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
assert_eq_size!(ListNode<Page>, [u8; 16]);



const KERNEL_LAYOUT_FLAGS: MemoryMappingFlag =
    MemoryMappingFlag(MemoryMappingFlag::WRITABLE | MemoryMappingFlag::WRITE_THROUGH);
//duplicates in kernel.ld script
declare_constants!(
    pub usize,
    MAX_PHYSICAL_MEMORY_SIZE = 32 * 1024 * 1024;//bytes
    MEMORY_MAP_SIZE = MAX_PHYSICAL_MEMORY_SIZE / Page::SIZE, "the count of pages in memory map array";
);
#[repr(transparent)]
pub struct MemoryMap {
    pages: [ListNode<Page>; MEMORY_MAP_SIZE],
}


#[cfg(not(test))]
extern "C" {
    static mut MEMORY_MAP: MemoryMap;
}

fn mem_map_offset() -> *mut ListNode<Page> {
    unsafe { ptr::from_mut(&mut MEMORY_MAP) as *mut u8 as *mut ListNode<Page> }
}

impl ToPhysicalAddress for ListNode<Page> {
    //return which physical address is used for such
    fn as_physical(&self) -> PhysicalAddress {
        let page_offset = ptr::from_ref(self);
        let page_index = unsafe { page_offset.sub_ptr(mem_map_offset()) };
        page_index << Page::SHIFT
    }
}

impl ListNode<Page> {
    pub unsafe fn wrap_page(offset: PhysicalAddress) -> NonNull<ListNode<Page>> {
        let page_index: usize = offset >> Page::SHIFT;
        let page_offset = unsafe { mem_map_offset().add(page_index) };
        unsafe { NonNull::new_unchecked(page_offset) }
    }
}

impl Page {
    declare_constants!(
        pub usize,
        SHIFT = 12, "the offset of page";
        SIZE = 1 << Page::SHIFT, "the size in bytes of page";
    );
    pub fn flags(&self) -> PageFlag {
        self.flags
    }
    pub fn set_flags(&mut self, flags: PageFlag) {
        self.flags = flags;
    }

    pub const fn empty() -> Self {
        Self {
            flags: PageFlag::wrap(PageFlag::UNUSED),
            ref_count: 0,
        }
    }
    pub fn acquire(&mut self) {
        self.ref_count += 1;
    }
    pub fn release(&mut self) {
        self.ref_count -= 1;
    }
    pub const fn is_used(&self) -> bool {
        self.ref_count > 0
    }
    //utility methods
    pub const fn upper_bound(byte_size: usize) -> usize {
        (byte_size + Page::SIZE - 1) / Page::SIZE
    }
    pub const fn lower_bound(byte_size: usize) -> usize {
        byte_size / Page::SIZE
    }
}

#[cfg(test)]
impl MemoryMap {
    pub const fn empty() -> Self {
        const NODE: ListNode<Page> = unsafe { ListNode::wrap_data(Page::empty()) };
        let pages: [ListNode<Page>; MEMORY_MAP_SIZE] = [NODE; MEMORY_MAP_SIZE];
        Self { pages }
    }
}

#[cfg(test)]
static mut MEMORY_MAP: MemoryMap = MemoryMap::empty();

#[cfg(test)]
mod tests {
    use core::mem;
    use core::mem::MaybeUninit;
    use crate::memory::{MEMORY_MAP, MemoryMap, Page, PhysicalAddress, ToPhysicalAddress, VirtualAddress};
    use crate::utils::ListNode;

    #[test]
    fn check_page_conversation() {
        let mem_map_virtual_offset: VirtualAddress = unsafe { &mut MEMORY_MAP as *mut MemoryMap as VirtualAddress };
        let page_index = 42;
        let page_virtual_offset = mem_map_virtual_offset + page_index * mem::size_of::<ListNode<Page>>();
        let page = unsafe { ListNode::<Page>::wrap_page(page_index << Page::SHIFT) }; //year, it's UB, but not write operation
        assert_eq!(page.as_ptr() as VirtualAddress, page_virtual_offset);
        assert_eq!(page_index << Page::SHIFT, unsafe { page.as_ref() }.as_physical());
    }
}