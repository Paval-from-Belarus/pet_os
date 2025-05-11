use core::alloc::{Allocator, GlobalAlloc};
use core::ptr::NonNull;
use core::{mem, ptr};

use alloc::boxed::Box;
use allocators::SlabAlloc;

pub use allocators::{Alignment, AllocContext, PhysicalAllocator};
pub use arch::*;
use kernel_macro::ListNode;
use kernel_types::collections::{LinkedList, ListNode};
use kernel_types::declare_constants;
pub use paging::PagingProperties;

use crate::common::atomics::{SpinLockLazyCell, UnsafeLazyCell};
use crate::memory::allocators::SystemAllocator;
use crate::memory::paging::{BootAllocator, GDTTable};

use crate::task::{Task, TaskState};

mod allocators;
mod arch;
mod page;
mod paging;
mod process;
mod region;

pub use page::*;
pub use process::*;
pub use region::*;

pub use paging::table::{DirEntry, DirEntryFlag, TableEntry, TableEntryFlag};
pub use paging::{
    CaptureMemRec, PageMarker, PageMarkerError, DIRECTORY_ENTRIES_COUNT,
    DIRECTORY_PAGES_COUNT, TABLE_ENTRIES_COUNT,
};

pub use allocators::Slab;

pub use self::paging::PageDirectory;

pub enum ZoneType {
    Usable,
    Device,
}

#[derive(Debug, thiserror_no_std::Error)]
pub enum AllocError {
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

    SYSTEM_ALLOCATOR.set(slab_allocator);
}

pub fn enable_task_switching(table: &mut GDTTable) {
    let mut state = TaskState::null();
    state.set_io_map(0xFFFF);
    state.set_stack_selector(SegmentSelector::KERNEL_DATA);

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
    // PHYSICAL_ALLOCATOR
    //     .get()
    //     .alloc_continuous_pages(page_count)
    //     .inspect_err(|cause| {
    //         log::error!("Failed to alloc physical pages: {cause}");
    //     })
    //     .ok()
    todo!()
}

fn dealloc_physical_page(offset: PhysicalAddress) {
    let allocator = PHYSICAL_ALLOCATOR.get();
    let page = unsafe { Page::take_unchecked(offset) };
    allocator.dealloc_page(page);
}

bitflags::bitflags! {
    //something info about range???
    #[derive(Debug, Clone, Copy)]
    pub struct MemoryMappingFlag: usize {
        const KERNEL_LAYOUT = Self::WRITABLE.bits() | Self::PRESENT.bits();
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

//always present
impl MemoryMappingFlag {
    pub fn as_table_flag(&self) -> TableEntryFlag {
        unsafe { TableEntryFlag::wrap(self.bits() | TableEntryFlag::PRESENT) }
    }

    pub fn as_directory_flag(&self) -> DirEntryFlag {
        unsafe { DirEntryFlag::wrap(self.bits() | DirEntryFlag::PRESENT) }
    }
}

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

pub fn kernel_regions() -> LinkedList<'static, MemoryRegion> {
    todo!()
}

///performs mapping of physical memory to virtual space (in kernel space only)
pub fn kernel_map(pages: &[Page]) -> Result<*mut u8, AllocError> {
    SYSTEM_ALLOCATOR.get().map_pages(pages)
}

//unmap previously mapped physical pages
pub fn kernel_unmap(_pages: &[Page], ptr: *mut u8) {
    SYSTEM_ALLOCATOR.get().unmap_pages(ptr, Page::SIZE);
}

pub type AllocHandler = fn(usize) -> Option<PhysicalAddress>;

pub type DeallocHandler = fn(PhysicalAddress);

pub type TaskRoutine = extern "C" fn();

#[derive(ListNode)]
#[repr(C)]
///the one represent meor
pub struct MemoryMappingRegion {
    #[list_pivots]
    pub node: ListNode<MemoryMappingRegion>,
    pub flags: MemoryMappingFlag,
    //used to copy
    pub virtual_offset: VirtualAddress,
    pub physical_offset: PhysicalAddress,
    pub page_count: usize,
}

impl Default for MemoryMappingRegion {
    fn default() -> Self {
        Self {
            node: ListNode::empty(),
            flags: MemoryMappingFlag::empty(),
            page_count: 0,
            virtual_offset: 0,
            physical_offset: 0,
        }
    }
}

pub enum AllocationStrategy {
    #[doc = "Allocation for Kernel space when page cannot be swapped"]
    NoSwap,
    #[doc = "Allocation for Kernel space data structures;"]
    Kernel,
    User,
    #[doc = "Allocation in DMA regions"]
    Device,
}

pub struct SlabInPlaceAllocator {
    size: usize,
    slab_name: &'static str,
    ptr: *mut u8,
}

unsafe impl Allocator for SlabInPlaceAllocator {
    fn allocate(
        &self,
        layout: core::alloc::Layout,
    ) -> Result<NonNull<[u8]>, core::alloc::AllocError> {
        if layout.size() != self.size {
            return Err(core::alloc::AllocError);
        }

        let bytes =
            unsafe { core::slice::from_raw_parts_mut(self.ptr, self.size) };

        Ok(NonNull::from(bytes))
    }

    unsafe fn deallocate(
        &self,
        _ptr: NonNull<u8>,
        _layout: core::alloc::Layout,
    ) {
        SYSTEM_ALLOCATOR.dealloc_slab(self.slab_name, self.ptr);
    }
}

pub type SlabBox<T> = Box<T, SlabInPlaceAllocator>;

pub fn slab_alloc<T: Slab>(value: T) -> Result<SlabBox<T>, AllocError> {
    let size = mem::size_of::<T>();

    assert!(size < u16::MAX as usize);

    let layout = SYSTEM_ALLOCATOR.get().alloc_slab(SlabAlloc {
        name: T::NAME,
        size: size as u16,
        alignment: T::ALIGNMENT,
    })?;

    let allocator = SlabInPlaceAllocator {
        size,
        ptr: layout,
        slab_name: T::NAME,
    };

    Box::try_new_in(value, allocator).map_err(|_| AllocError::NoMemory)
}

pub fn into_boxed<T: Slab>(data: NonNull<T>) -> SlabBox<T> {
    let ptr = data.as_ptr().cast::<u8>();

    let allocator = SlabInPlaceAllocator {
        ptr,
        slab_name: T::NAME,
        size: mem::size_of::<T>(),
    };

    unsafe { SlabBox::from_raw_in(data.as_ptr(), allocator) }
}

///Allocate virtual memory regardless of physical layout
///The each virtual page, probably, will be separate
///The current implementation is simple slab allocation (it will fail with too huge memory size)
#[must_use]
pub fn virtual_alloc(size: usize, _flags: MemoryRegionFlag) -> VirtualAddress {
    SYSTEM_ALLOCATOR
        .get()
        .virtual_alloc(size)
        .expect("Failed to allocate virtual memory") as VirtualAddress
}

pub fn virtual_dealloc(offset: VirtualAddress, size: usize) {
    SYSTEM_ALLOCATOR.get().virtual_dealloc(offset, size);
}

pub fn new_page_marker() -> Result<PageMarker<'static>, AllocError> {
    static_assertions::const_assert_eq!(
        Page::SIZE,
        mem::size_of::<PageDirectory>()
    );

    let raw_directory = SYSTEM_ALLOCATOR
        .get()
        .virtual_alloc(Page::SIZE)?
        .cast::<PageDirectory<'static>>();

    let directory = unsafe { &mut *raw_directory };

    //essential data structures will be copied
    //but we must ensure integrity kernel space
    //in all processes
    directory.copy_from_slice(KERNEL_MARKER.get().directory());

    Ok(PageMarker::new(
        directory,
        alloc_physical_pages,
        dealloc_physical_page,
    ))
}

/// allocate physical memory
/// not continuous
pub fn physical_alloc(
    bytes: usize,
) -> Result<LinkedList<'static, Page>, AllocError> {
    let pages_count = Page::upper_bound(bytes);

    let list = PHYSICAL_ALLOCATOR.get().alloc_zeroed_pages(pages_count)?;

    Ok(list)
}

pub fn physical_dealloc(_offset: *mut u8) {
    todo!()
}

//the method should be invoked only by one thread
//concurrency is forbidden
/// Set ss:esp in TSS
/// This stack will be used during
/// user-space to kernel-space switching
#[no_mangle]
pub unsafe fn switch_to_task(task: &mut Task) {
    let stack = task.context().esp as VirtualAddress;

    let task_state = &raw mut TASK_STATE;
    unsafe { (*task_state).set_kernel_stack(stack) };

    if let Some(state_lock) = task.state.as_ref() {
        let state = state_lock.try_lock().unwrap();
        state.marker.load();
    } else {
        KERNEL_MARKER.get().load();
    };
}

pub unsafe fn switch_to_kernel() {
    let marker = KERNEL_MARKER.get();
    marker.load();
}

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

#[cfg(not(test))]
extern "C" {
    static mut MEMORY_MAP: MemoryMap;
}

static mut TASK_STATE: TaskState = TaskState::null();

static PHYSICAL_ALLOCATOR: UnsafeLazyCell<PhysicalAllocator> =
    UnsafeLazyCell::empty();

static SYSTEM_ALLOCATOR: UnsafeLazyCell<SystemAllocator> =
    UnsafeLazyCell::empty();

pub struct VirtualAllocator;
#[global_allocator]
static KERNEL_ALLOCATOR: VirtualAllocator = VirtualAllocator;

unsafe impl GlobalAlloc for VirtualAllocator {
    unsafe fn alloc(&self, layout: core::alloc::Layout) -> *mut u8 {
        if let Some(slab) = allocators::classify_slab_by_size(layout.size()) {
            let ptr = SYSTEM_ALLOCATOR
                .get()
                .alloc_slab(slab)
                .inspect_err(|cause| {
                    log::error!(
                        "Failed to alloc virtual memory as slab: {cause}"
                    );
                })
                .unwrap_or(ptr::null_mut());

            return ptr;
        }

        //huge allocation performed via virtual_alloc
        virtual_alloc(
            layout.size(),
            MemoryRegionFlag::READ | MemoryRegionFlag::WRITE,
        ) as *mut u8
    }

    unsafe fn dealloc(&self, ptr: *mut u8, layout: core::alloc::Layout) {
        if let Some(slab) = allocators::classify_slab_by_size(layout.size()) {
            SYSTEM_ALLOCATOR.get().dealloc_slab(slab.name, ptr);

            return;
        }

        virtual_dealloc(ptr as VirtualAddress, layout.size());
    }
}

static KERNEL_MARKER: SpinLockLazyCell<PageMarker<'static>> =
    SpinLockLazyCell::empty();

#[cfg(test)]
static mut MEMORY_MAP: MemoryMap = MemoryMap {
    pages: [const { Page::new() }; MEMORY_MAP_SIZE],
};

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
        assert_eq!(page_index << Page::SHIFT, page.as_physical());
    }
}
