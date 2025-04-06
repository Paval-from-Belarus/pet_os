use core::alloc::{Allocator, GlobalAlloc};
use core::mem::MaybeUninit;
use core::ops::Range;
use core::ptr::NonNull;
use core::sync::atomic::{AtomicUsize, Ordering};
use core::{mem, ptr};

use alloc::boxed::Box;
use static_assertions::assert_eq_size;

pub use allocators::PhysicalAllocator;
pub use arch::*;
use kernel_macro::ListNode;
use kernel_types::collections::{
    LinkedList, ListNode, TinyLinkedList, TinyListNode,
};
use kernel_types::{bitflags, declare_constants};
pub use paging::PagingProperties;

use crate::common::atomics::{SpinLockLazyCell, UnsafeLazyCell};
use crate::memory::allocators::{Alignment, SlabPiece, SystemAllocator};
use crate::memory::paging::{
    BootAllocator, GDTTable, PageMarker, PageMarkerError,
};
use crate::task;
use crate::task::{Task, TaskState};

mod allocators;
mod arch;
mod paging;

pub use paging::table::{DirEntry, DirEntryFlag, TableEntry, TableEntryFlag};
pub use paging::{
    CaptureMemRec, DIRECTORY_ENTRIES_COUNT, DIRECTORY_PAGES_COUNT,
    TABLE_ENTRIES_COUNT,
};

pub use self::paging::PageDirectory;

pub enum ZoneType {
    Usable,
    Device,
}

#[derive(Debug, thiserror_no_std::Error)]
pub enum OsAllocationError {
    #[error("NoMemory")]
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
    static KERNEL_PHYSICAL_START: usize;
    //compile-time info about effective size of kernel
    static KERNEL_SIZE: usize;
    //offset after which memory is free to use
    static KERNEL_VIRTUAL_OFFSET: usize;
    static KERNEL_STACK_SIZE: usize;
}

// #[repr(transparent)]
// pub struct PhysicalAddress(usize);
//
// #[repr(transparent)]
// pub struct VirtualAddress(usize);

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
#[no_mangle]
pub fn init_kernel_space(
    allocator: BootAllocator,
    directory: &'static mut PageDirectory<'static>,
    heap_offset: VirtualAddress,
) {
    let marker =
        PageMarker::new(directory, alloc_physical_pages, first_dealloc_handler);

    KERNEL_MARKER.set(marker);
    let allocator = PhysicalAllocator::from_boot(allocator);
    PHYSICAL_ALLOCATOR.set(allocator);

    log::info!("Physical allocator is ready");

    // let boot_mapping_pages = kernel_virtual_offset() / Page::SIZE;
    // let unmap_flags = UnmapParamsFlag::from(UnmapParamsFlag::TABLES | UnmapParamsFlag::PAGES);
    //the higher addresses are fully mapped by the kernel
    // KERNEL_MARKER.get().unmap_range(VirtualAddress::NULL, boot_mapping_pages, unmap_flags);
    KERNEL_MARKER
        .get()
        .set_dealloc_handler(dealloc_physical_page);

    let slab_allocator = SystemAllocator::new(&PHYSICAL_ALLOCATOR, heap_offset)
        .expect("Failed to initialize slab allocator");

    SLAB_ALLOCATOR.set(slab_allocator);
}

pub fn enable_task_switching(table: &mut GDTTable) {
    let mut state = TaskState::null();
    state.set_io_map(0xFFFF);
    state.set_stack_selector(SegmentSelector::DATA);

    unsafe { TASK_STATE = state };

    let task = TaskStateDescriptor::active(
        &raw const TASK_STATE as VirtualAddress,
        mem::size_of::<TaskState>() - 1,
    );

    log::debug!("Task state: {task:?}");

    table.load_task(task);
}

///this method is conventional way to free page acquired by asm stub
fn first_dealloc_handler(offset: PhysicalAddress) {
    let page = unsafe { Page::take_unchecked(offset) };

    page.acquire();

    PHYSICAL_ALLOCATOR.get().dealloc_page(page);
}

fn alloc_physical_pages(_page_count: usize) -> Option<PhysicalAddress> {
    todo!()
    // PHYSICAL_ALLOCATOR.get().alloc_pages(page_count)
}

fn dealloc_physical_page(offset: PhysicalAddress) {
    let allocator = PHYSICAL_ALLOCATOR.get();
    let page = unsafe { Page::take_unchecked(offset) };
    allocator.dealloc_page(page);
}

bitflags!(
    //something info about range???
    pub MemoryMappingFlag(usize),
    // ACCESSED = 0b100_000,
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
    unsafe { &KERNEL_PHYSICAL_START as *const usize as VirtualAddress }
}

pub fn stack_size() -> usize {
    unsafe { &KERNEL_STACK_SIZE as *const usize as VirtualAddress }
}

///performs mapping of physical memory of IO device to virtual space
pub fn io_remap(_offset: PhysicalAddress, _size: usize) -> VirtualAddress {
    //create new MemoryRegion and add to corresponding ProcessHandle
    todo!()
}

pub type AllocHandler = fn(usize) -> Option<PhysicalAddress>;
pub type DeallocHandler = fn(PhysicalAddress);
pub type ThreadRoutine = extern "C" fn();

///Alternative to linux mm_struct
pub struct ProcessState {
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
    marker: PageMarker<'static>,
    regions: TinyLinkedList<'static, MemoryRegion>,
    last_touched_region: Option<&'static MemoryRegion>,
}

impl ProcessState {
    pub fn find_region(
        &mut self,
        address: VirtualAddress,
    ) -> Option<&'static MemoryRegion> {
        if let Some(last_region) = self.last_touched_region {
            if last_region.range.contains(&address) {
                return Some(last_region);
            }
        }

        self.regions
            .iter()
            .find(|region| region.range.contains(&address))
            .map(|region| region as &MemoryRegion)
    }
    pub fn find_unmapped_region(
        &mut self,
        _offset: VirtualAddress,
        _length: usize,
        _flags: MemoryRegionFlag,
    ) -> Option<VirtualAddress> {
        None
    }
    pub fn add_region(&mut self, _region: NonNull<MemoryRegion>) {}
    pub fn find_prev_region(
        &mut self,
        address: VirtualAddress,
    ) -> Option<&'static MemoryRegion> {
        let mut prev_region = None;
        for region in self.regions.iter() {
            if region.range.contains(&address) {
                break;
            }
            //update prev region each time while region is not found
            if region.range.end < address {
                prev_region = Some(region);
            }
        }
        prev_region.map(|node| node as &MemoryRegion)
    }
    pub fn find_intersect_region(
        &mut self,
        range: Range<VirtualAddress>,
    ) -> Option<&'static MemoryRegion> {
        let option_region = self.find_region(range.start);
        if let Some(region) = option_region
            && region.range.end < range.end
        {
            return Some(region);
        }
        None
    }
}

#[derive(ListNode)]
#[repr(C)]
pub struct MemoryRegion {
    #[list_pivot]
    node: TinyListNode<MemoryRegion>,
    parent: NonNull<ProcessState>,
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
    marker: PageMarker<'static>,
}

#[derive(ListNode)]
#[repr(C)]
///the one represent meor
pub struct MemoryMappingRegion {
    #[list_pivots]
    node: ListNode<MemoryMappingRegion>,
    flags: MemoryMappingFlag,
    //used to copy
    virtual_offset: VirtualAddress,
    physical_offset: PhysicalAddress,
    page_count: usize,
}

#[derive(Debug, ListNode)]
#[repr(C)]
pub struct Page {
    #[list_pivots]
    node: ListNode<Page>,
    pub flags: PageFlag,
    //it's easy to use in calculation, in future should be replace by macro
    //when zero page should be free
    ref_count: AtomicUsize,
}

//wrapper for page to control uses
pub struct PageOwner {}

assert_eq_size!(Page, [u8; 16]);
pub enum AllocationStrategy {
    #[doc = "Allocation for Kernel space when page cannot be swapped"]
    NoSwap,
    #[doc = "Allocation for Kernel space data structures;"]
    Kernel,
    User,
    #[doc = "Allocation in DMA regions"]
    Device,
}

pub struct Kernel;

unsafe impl Allocator for Kernel {
    fn allocate(
        &self,
        layout: core::alloc::Layout,
    ) -> Result<NonNull<[u8]>, core::alloc::AllocError> {
        let size = layout.size();

        let piece = if layout.size() <= u16::MAX as usize {
            SlabPiece::with_capacity(layout.size() as u16)
        } else {
            unreachable!("Slab piece too huge");
        };

        let offset = SLAB_ALLOCATOR
            .alloc(piece, Alignment::Page)
            .unwrap_or_else(|cause| {
                panic!("Failed to alloc slab with size={size}: {cause}")
            });

        log::info!("Allocated for {offset:?}");

        let bytes =
            unsafe { core::slice::from_raw_parts_mut(offset, layout.size()) };

        Ok(NonNull::from(bytes))
    }

    unsafe fn deallocate(
        &self,
        ptr: NonNull<u8>,
        _layout: core::alloc::Layout,
    ) {
        let offset = ptr.as_ptr() as VirtualAddress;
        SLAB_ALLOCATOR.dealloc(offset);
    }
}

unsafe impl GlobalAlloc for Kernel {
    unsafe fn alloc(&self, layout: core::alloc::Layout) -> *mut u8 {
        let mut ptr = Kernel
            .allocate(layout)
            .expect("Failed to allocate: {layout:?}");

        ptr.as_mut().as_mut_ptr()
    }

    unsafe fn dealloc(&self, ptr: *mut u8, layout: core::alloc::Layout) {
        let ptr = NonNull::new(ptr).expect("Only not null ptr");

        Kernel.deallocate(ptr, layout);
    }
}

pub trait Slab {
    const NAME: &str;
    const ALIGNMENT: Alignment = Alignment::CacheLine;
}

pub type SlabBox<T> = Box<T, Kernel>;

pub fn slab_alloc<T>(value: T) -> Option<SlabBox<T>> {
    Box::try_new_in(value, Kernel).ok()
}

/// the kernel method to allocate structure in kernel slab pool
#[must_use]
pub fn slab_alloc_old<T: Slab>(
    _strategy: AllocationStrategy,
) -> Option<&'static mut MaybeUninit<T>> {
    let size = mem::size_of::<T>();

    let piece = if size <= u16::MAX as usize {
        SlabPiece::with_capacity(size as u16)
    } else {
        unreachable!("Slab piece too huge");
    };

    let offset =
        SLAB_ALLOCATOR
            .alloc(piece, Alignment::Page)
            .unwrap_or_else(|cause| {
                panic!("Failed to alloc slab with size={size}: {cause}")
            });

    Some(unsafe { &mut *(offset as *mut MaybeUninit<T>) })
}

pub fn slab_dealloc<T>(pointer: &mut T) {
    let offset = pointer as *mut T as VirtualAddress;
    SLAB_ALLOCATOR.dealloc(offset);
}

///Allocate virtual memory regardless of physical layout
///The each virtual page, probably, will be separate
///The current implementation is simple slab allocation (it will fail with too huge memory size)
#[must_use]
pub fn virtual_alloc(size: usize) -> VirtualAddress {
    SLAB_ALLOCATOR
        .get()
        .virtual_alloc(size)
        .expect("Failed to allocate virtual memory") as VirtualAddress
}

pub fn virtual_dealloc(_offset: VirtualAddress) {
    todo!()
}

pub fn physical_alloc(_bytes: usize) -> Result<*mut u8, OsAllocationError> {
    todo!()
}

pub fn physical_dealloc(_offset: *mut u8) {
    todo!()
}

//the method should be invoked only by one thread
//concurrency is forbidden
pub unsafe fn switch_to_task(task: &mut Task) {
    let kernel_stack = task.kernel_stack + task::TASK_STACK_SIZE; // - mem::size_of::<TaskContext>();

    unsafe { TASK_STATE.set_kernel_stack(kernel_stack) };

    let marker = if task.state.is_some() {
        unreachable!("Process functionality is not implemented")
    } else {
        KERNEL_MARKER.get()
    };

    marker.load();
}

pub unsafe fn switch_to_kernel() {
    let marker = KERNEL_MARKER.get();
    marker.load();
}

pub fn alloc_proc() -> Result<ProcessState, OsAllocationError> {
    let _entries =
        physical_alloc(TABLE_ENTRIES_COUNT * mem::size_of::<DirEntry>())?;
    // let table = RefTable::with_default_values(entries.as_mut(), TABLE_ENTRIES_COUNT);
    // let marker = KERNEL_MARKER.get();
    // let kernel_region = get_kernel_mapping_region();
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
    pages: [Page; MEMORY_MAP_SIZE],
}

impl MemoryMap {
    pub fn iter(&self) -> impl Iterator<Item = &Page> {
        self.pages.iter()
    }

    pub fn iter_mut(&mut self) -> impl Iterator<Item = &mut Page> {
        self.pages.iter_mut()
    }
}

fn mem_map_offset() -> *mut Page {
    &raw mut MEMORY_MAP as *mut Page
}

impl ToPhysicalAddress for Page {
    //return which physical address is used for such
    fn as_physical(&self) -> PhysicalAddress {
        let page_offset = ptr::from_ref(self);
        let page_index =
            unsafe { page_offset.offset_from_unsigned(mem_map_offset()) };
        page_index << Page::SHIFT
    }
}

///commit kernel memory
pub fn kernel_commit(
    region: MemoryMappingRegion,
) -> Result<(), PageMarkerError> {
    let mut marker = KERNEL_MARKER.get();
    marker.map_kernel_range(&region)
}

pub fn user_commit(
    _region: MemoryMappingRegion,
) -> Result<(), PageMarkerError> {
    todo!()
}

impl Page {
    declare_constants! {
        pub usize,
        SHIFT = 12, "the offset of page";
        SIZE = 1 << Page::SHIFT, "the size in bytes of page";
    }

    pub const fn new() -> Self {
        Self {
            flags: unsafe { PageFlag::wrap(PageFlag::UNUSED) },
            ref_count: AtomicUsize::new(0),
            node: unsafe { ListNode::empty() },
        }
    }

    pub fn take(offset: PhysicalAddress) -> &'static Page {
        let page = unsafe { Self::take_unchecked(offset) };

        page.acquire();

        page
    }

    pub unsafe fn take_unchecked(offset: PhysicalAddress) -> &'static mut Page {
        let page_index: usize = offset >> Page::SHIFT;
        let page_offset = unsafe { mem_map_offset().add(page_index) };
        unsafe { &mut *page_offset }
    }

    ///increment reference counter in page
    pub fn acquire(&self) {
        let _old_value = self.ref_count.fetch_add(1, Ordering::SeqCst);
    }

    pub fn release(&self) {
        let old_value = self.ref_count.fetch_sub(1, Ordering::SeqCst);
        if old_value == 0 {
            panic!("The free page releases again");
        }
    }

    /// the count of references to this page
    pub fn use_count(&self) -> usize {
        self.ref_count.load(Ordering::Acquire)
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

    pub unsafe fn as_slice(&mut self, count: usize) -> &'static [Page] {
        core::slice::from_raw_parts(self, count)
    }

    pub unsafe fn as_slice_mut(&mut self, count: usize) -> &'static mut [Page] {
        core::slice::from_raw_parts_mut(self, count)
    }

    /// Page index in global MEMORY_MAP
    pub unsafe fn index(&self) -> usize {
        let offset = (self as *const Page as VirtualAddress)
            - (mem_map_offset() as VirtualAddress);

        offset / mem::size_of::<Page>()
    }
}

impl Default for Page {
    fn default() -> Self {
        Self::new()
    }
}

#[cfg(test)]
impl MemoryMap {
    pub const fn empty() -> Self {
        const NODE: Page = Page::new();
        let pages = [NODE; MEMORY_MAP_SIZE];
        Self { pages }
    }
}

// pub fn get_kernel_mapping_region() -> &'static MemoryMappingRegion {
//     // let node = unsafe { ListNode::wrap_data(KERNEL_MAPPING) };
//     // unsafe { node.as_head() }
//     &KERNEL_MAPPING
// }
//
// static KERNEL_MAPPING: MemoryMappingRegion = MemoryMappingRegion {
//     flags: MemoryMappingFlag::wrap(MemoryMappingFlag::PRESENT | MemoryMappingFlag::WRITABLE),
//     virtual_offset: 0, //unsafe { KERNEL_VIRTUAL_OFFSET },
//     physical_offset: 0, //unsafe { KERNEL_PHYSICAL_OFFSET },
//     page_count: 0, //unsafe { VirtualAddress::MAX - KERNEL_VIRTUAL_OFFSET },
// };

#[cfg(not(test))]
extern "C" {
    static mut MEMORY_MAP: MemoryMap;
}

static mut TASK_STATE: TaskState = TaskState::null();

static PHYSICAL_ALLOCATOR: UnsafeLazyCell<PhysicalAllocator> =
    UnsafeLazyCell::empty();

static SLAB_ALLOCATOR: UnsafeLazyCell<SystemAllocator> =
    UnsafeLazyCell::empty();

#[global_allocator]
static KERNEL_ALLOCATOR: Kernel = Kernel;

static KERNEL_MARKER: SpinLockLazyCell<PageMarker<'static>> =
    SpinLockLazyCell::empty();

#[cfg(test)]
static mut MEMORY_MAP: MemoryMap = MemoryMap::empty();

#[cfg(test)]
mod tests {
    use core::mem;

    use kernel_types::collections::ListNode;

    use crate::memory::{
        MemoryMap, Page, ToPhysicalAddress, VirtualAddress, MEMORY_MAP,
    };

    #[test]
    fn check_page_conversation() {
        let mem_map_virtual_offset: VirtualAddress =
            unsafe { &mut MEMORY_MAP as *mut MemoryMap as VirtualAddress };
        let page_index = 42;
        let page_virtual_offset = mem_map_virtual_offset
            + page_index * mem::size_of::<ListNode<Page>>();
        let page = unsafe { Page::take(page_index << Page::SHIFT) }; //year, it's UB, but not write operation
                                                                     //
        assert_eq!(page as *const Page as VirtualAddress, page_virtual_offset);
        assert_eq!(page_index << Page::SHIFT, unsafe { page }.as_physical());
    }
}
