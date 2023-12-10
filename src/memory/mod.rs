mod allocators;
mod paging;
mod arch;


use core::ptr::{NonNull};
use core::ops::{Deref, Range, RangeBounds};
pub use allocators::PhysicalAllocator;
pub use paging::PagingProperties;
pub use arch::*;

use crate::{bitflags, declare_constants, process};
use crate::memory::paging::{CaptureAllocator, GDTTable, PageMarker, PageMarkerError, TABLE_ENTRIES_COUNT, UnmapParamsFlag};
use core::{mem, ptr};
use core::arch::asm;
use core::mem::MaybeUninit;
use core::slice::SliceIndex;
use core::sync::atomic::{AtomicUsize, Ordering};
use static_assertions::assert_eq_size;
use paging::table::{DirEntry, RefTable};
use crate::memory::allocators::{Alignment, SlabAllocator, SlabPiece};
use crate::process::{TaskState, ThreadTask};
use crate::utils::atomics::{SpinLockLazyCell, UnsafeLazyCell};
use crate::utils::{LinkedList, ListNode, SimpleList};

pub enum ZoneType {
    Usable,
    Device,
}

#[derive(Debug)]
pub enum OsAllocationError {
    NoMemory, //no memory to accomplish request
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
        self - kernel_virtual_offset()
    }
}

impl ToVirtualAddress for PhysicalAddress {
    fn as_virtual(&self) -> VirtualAddress {
        self + kernel_virtual_offset()
    }
}

///Return crucial structures for kernel
///Without them, it's impossible
pub fn init_kernel_space(
    mut allocator: CaptureAllocator,
    directory: RefTable<DirEntry>,
    heap_offset: VirtualAddress,
) {
    let marker = PageMarker::wrap(directory, alloc_physical_pages, dealloc_physical_pages);
    KERNEL_MARKER.set(marker);
    let free_pages = collect_free_pages(&mut allocator);
    let allocator = PhysicalAllocator::new(free_pages);
    PHYSICAL_ALLOCATOR.set(allocator);

    let boot_mapping_pages = kernel_virtual_offset() / Page::SIZE;
    let unmap_flags = UnmapParamsFlag::from(UnmapParamsFlag::TABLES | UnmapParamsFlag::PAGES);
    //the higher addresses are fully mapped by the kernel
    KERNEL_MARKER.get().unmap_range(VirtualAddress::NULL, boot_mapping_pages, unmap_flags);

    let slab_allocator = SlabAllocator::new(&PHYSICAL_ALLOCATOR, heap_offset)
        .expect("Failed to initialize slab allocator");
    SLAB_ALLOCATOR.set(slab_allocator);
}

pub fn enable_task_switching(table: &mut GDTTable) {
    let task = unsafe {
        TASK_STATE.set_io_map(0xFFFF);//setting io_map beyond the TaskState structure -> let's forbid all io instruction in user mode
        TASK_STATE.set_stack_selector(SegmentSelector::DATA);
        TaskStateDescriptor::default(&TASK_STATE as *const TaskState as VirtualAddress, mem::size_of::<TaskState>() - 1)
    };
    table.set_task(task);
}

fn alloc_physical_pages(page_count: usize) -> Option<PhysicalAddress> {
    todo!()
    // PHYSICAL_ALLOCATOR.get().alloc_pages(page_count)
}

fn dealloc_physical_pages(offset: PhysicalAddress) {
    let allocator = PHYSICAL_ALLOCATOR.get();
    let mut page = unsafe { ListNode::<Page>::wrap_page(offset) };
    unsafe {
        allocator.dealloc_page(page.as_mut());
    }
}

#[inline(never)]
fn collect_free_pages(allocator: &mut CaptureAllocator) -> LinkedList<'static, Page> {
    let mut free_pages = LinkedList::<Page>::empty();
    for pivot in allocator.as_pivots() {
        let mut mem_offset = pivot.next_offset();
        for _ in 0..pivot.free_pages_count() {
            unsafe {
                let mut node = ListNode::<Page>::wrap_page(mem_offset);
                let node_index = (node.as_ptr() as VirtualAddress - mem_map_offset() as VirtualAddress) / mem::size_of::<ListNode<Page>>();
                if node_index >= MEMORY_MAP_SIZE {
                    break;
                }
                free_pages.push_back(node.as_mut());
            }
            mem_offset += Page::SIZE;
        }
    }
    free_pages
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
    unsafe { &KERNEL_SIZE as *const usize as VirtualAddress }
}

pub fn kernel_page_size() -> usize {
    Page::upper_bound(kernel_binary_size())
}

pub fn kernel_virtual_offset() -> usize {
    unsafe { &KERNEL_VIRTUAL_OFFSET as *const usize as VirtualAddress }
}

pub fn kernel_physical_offset() -> usize {
    unsafe { &KERNEL_PHYSICAL_OFFSET as *const usize as VirtualAddress }
}

pub fn stack_size() -> usize {
    unsafe { &KERNEL_STACK_SIZE as *const usize as VirtualAddress }
}


///performs mapping of physical memory of IO device to virtual space
pub fn io_remap(offset: PhysicalAddress, size: usize) -> VirtualAddress {
    //create new MemoryRegion and add to corresponding ProcessHandle
    todo!()
}


pub type AllocHandler = fn(usize) -> Option<PhysicalAddress>;
pub type DeallocHandler = fn(PhysicalAddress);
pub type ThreadRoutine = fn(context: *mut ());

///Alternative to linux mm_struct
pub struct ProcessInfo {
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
    marker: PageMarker,
    regions: SimpleList<'static, MemoryRegion>,
    last_touched_region: Option<&'static MemoryRegion>,
}

impl ProcessInfo {
    pub fn find_region(&mut self, address: VirtualAddress) -> Option<&'static MemoryRegion> {
        if let Some(last_region) = self.last_touched_region {
            unsafe {
                if last_region.range.contains(&address) {
                    return Some(last_region);
                }
            }
        }
        for region in self.regions.iter() {
            if region.range.contains(&address) {
                return Some(region.data());
            }
        }
        None
    }
    pub fn find_unmapped_region(&mut self, offset: VirtualAddress, length: usize, flags: MemoryRegionFlag) -> Option<VirtualAddress> {
        None
    }
    pub fn add_region(&mut self, region: NonNull<MemoryRegion>) {}
    pub fn find_prev_region(&mut self, address: VirtualAddress) -> Option<&'static MemoryRegion> {
        let mut prev_region = None;
        for region in self.regions.iter() {
            if region.range.contains(&address) {
                break;
            }
            //update prev region each time while region is not found
            if region.range.end < address {
                prev_region = Some(region.data());
            }
        }
        prev_region
    }
    pub fn find_intersect_region(&mut self, range: Range<VirtualAddress>) -> Option<&'static MemoryRegion> {
        let option_region = self.find_region(range.start);
        unsafe {
            if let Some(region) = option_region && region.range.end < range.end {
                return Some(region);
            }
        }
        None
    }
}

pub struct MemoryRegion {
    parent: NonNull<ProcessInfo>,
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
    //it's simple callback to find page during page_fault_exception
    pub fn no_page(&mut self) -> NonNull<Page> {
        todo!()
    }
    pub fn populate(&mut self) -> usize {
        0
    }
    pub fn expand(&mut self) {
        todo!()
    }
}

pub struct AddressSpace {
    clean_pages: LinkedList<'static, Page>,
    dirty_pages: LinkedList<'static, Page>,
    locked_pages: LinkedList<'static, Page>,
    total_pages_count: usize,
    marker: PageMarker,
}

///the one represent meor
#[derive(Copy, Clone)]
pub struct MemoryMappingRegion {
    flags: MemoryMappingFlag,
    //used to copy
    virtual_offset: VirtualAddress,
    physical_offset: PhysicalAddress,
    page_count: usize,
}

#[repr(C)]
pub struct Page {
    flags: PageFlag,
    //it's easy to use in calculation, in future should be replace by macro
    //when zero page should be free
    ref_count: AtomicUsize,
}
assert_eq_size!(ListNode<Page>, [u8; 16]);

///the kernel method to allocate structure in kernel slab pool
pub fn slab_alloc<T>() -> &'static mut MaybeUninit<T> {
    let size = mem::size_of::<T>();
    let offset = virtual_alloc(size);
    unsafe { &mut *(offset as *mut MaybeUninit<T>) }
}

pub fn slab_dealloc<T>(pointer: &mut T) {
    let offset = pointer as *mut T as VirtualAddress;
    SLAB_ALLOCATOR.dealloc(offset);
}

///Allocate virtual memory regardless of physical layout
///The each virtual page, probably, will be separate
///The current implementation is simple slab allocation (it will fail with too huge memory size)
pub fn virtual_alloc(size: usize) -> VirtualAddress {
    let piece = if size <= u16::MAX as usize {
        SlabPiece::with_capacity(size as u16)
    } else {
        unreachable!("Slab piece too huge");
    };
    let offset = SLAB_ALLOCATOR.alloc(piece, Alignment::Page)
        .unwrap_or_else(|_| panic!("Failed to alloc slab with size={size}"));
    offset
}

pub fn virtual_dealloc(offset: VirtualAddress) {
    todo!()
}

pub fn physical_alloc(bytes: usize) -> Result<*mut u8, OsAllocationError> {
    todo!()
}

pub fn physical_dealloc(offset: *mut u8) {
    todo!()
}


//the method should be invoked only by one thread
//concurrency is forbidden
pub unsafe fn switch_to_task(task: &'static mut ThreadTask) {
    TASK_STATE.set_kernel_stack(task.kernel_stack + process::TASK_STACK_SIZE);
    let mut marker = if task.parent.is_some() {
        unreachable!("Process functionality is not implemeted")
    } else {
        KERNEL_MARKER.get()
    };
    let table = marker.table();
    table.load();
}

pub unsafe fn switch_to_kernel() {}

pub fn alloc_proc() -> Result<ProcessInfo, OsAllocationError> {
    let mut entries = physical_alloc(TABLE_ENTRIES_COUNT * mem::size_of::<DirEntry>())?;
    let table = unsafe {
        // let table = RefTable::with_default_values(entries.as_mut(), TABLE_ENTRIES_COUNT);
        // let marker = KERNEL_MARKER.get();
        // let kernel_region = get_kernel_mapping_region();
    };
    todo!()
}

const KERNEL_LAYOUT_FLAGS: MemoryMappingFlag =
    MemoryMappingFlag(MemoryMappingFlag::WRITABLE | MemoryMappingFlag::PRESENT);
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


fn mem_map_offset() -> *mut ListNode<Page> {
    unsafe { &mut MEMORY_MAP as *mut MemoryMap as *mut ListNode<Page> }
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
    #[deprecated]
    pub unsafe fn wrap_page(offset: PhysicalAddress) -> NonNull<ListNode<Page>> {
        let page_index: usize = offset >> Page::SHIFT;
        let page_offset = unsafe { mem_map_offset().add(page_index) };
        unsafe { NonNull::new_unchecked(page_offset) }
    }
}

///commit kernel memory
pub fn kernel_commit(region: MemoryMappingRegion) -> Result<(), PageMarkerError> {
    // self.marker.map_kernel_range(&region).expect("Failed to commit kernel heap memory");
    todo!()
}

pub fn user_commit(region: MemoryMappingRegion) -> Result<(), PageMarkerError> {
    todo!()
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
            ref_count: AtomicUsize::new(0),
        }
    }
    ///increment reference counter in page
    pub fn take(&self) {
        let _old_value = self.ref_count.fetch_add(1, Ordering::SeqCst);
    }
    pub fn free(&self) {
        let old_value = self.ref_count.fetch_sub(1, Ordering::SeqCst);
        if old_value == 0 {
            panic!("The free page releases again");
        }
    }
    pub fn is_used(&self) -> bool {
        self.ref_count.load(Ordering::SeqCst) > 0
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

pub fn get_kernel_mapping_region() -> &'static MemoryMappingRegion {
    // let node = unsafe { ListNode::wrap_data(KERNEL_MAPPING) };
    // unsafe { node.as_head() }
    &KERNEL_MAPPING
}

static KERNEL_MAPPING: MemoryMappingRegion = MemoryMappingRegion {
    flags: MemoryMappingFlag::wrap(MemoryMappingFlag::PRESENT | MemoryMappingFlag::WRITABLE),
    virtual_offset: 0, //unsafe { KERNEL_VIRTUAL_OFFSET },
    physical_offset: 0, //unsafe { KERNEL_PHYSICAL_OFFSET },
    page_count: 0, //unsafe { VirtualAddress::MAX - KERNEL_VIRTUAL_OFFSET },
};

#[cfg(not(test))]
extern "C" {
    static mut MEMORY_MAP: MemoryMap;
}

static mut TASK_STATE: TaskState = TaskState::null();
static PHYSICAL_ALLOCATOR: UnsafeLazyCell<PhysicalAllocator> = UnsafeLazyCell::empty();
static SLAB_ALLOCATOR: UnsafeLazyCell<SlabAllocator> = UnsafeLazyCell::empty();
static KERNEL_MARKER: SpinLockLazyCell<PageMarker> = SpinLockLazyCell::empty();

#[cfg(test)]
static mut MEMORY_MAP: MemoryMap = MemoryMap::empty();

#[cfg(test)]
mod tests {
    use core::mem;
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