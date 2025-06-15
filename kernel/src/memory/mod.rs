use core::alloc::{Allocator, GlobalAlloc};
use core::ptr::NonNull;
use core::{mem, ptr};

use alloc::boxed::Box;
use allocators::SlabAlloc;

pub use allocators::{Alignment, MemoryAllocationFlag, PhysicalAllocator};
pub use arch::*;
use kernel_types::collections::LinkedList;
use kernel_types::declare_constants;
pub use paging::PagingProperties;
use paging::{GDTHandle, PageDirectoryEntries};

use crate::common::atomics::{SpinLockLazyCell, UnsafeLazyCell};
use crate::current_task;
use crate::memory::allocators::SystemAllocator;
use crate::memory::paging::GDTTable;

use crate::task::{Task, TaskState};

mod allocators;
mod arch;
mod context;
mod mapping;
mod page;
mod paging;
mod process;
mod region;

pub use context::{is_irq_context, start_irq, ContextLock};
pub use mapping::*;
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
    #[error("Requested page is not available")]
    PageInUse,
    #[error("NoMemory")]
    NoMemory, //no memory to accomplish request
    #[error("Failed to mark page: {0}")]
    PageMappingFailed(#[from] PageMarkerError),
    #[error("Invalid alignment. Requested: {0:?}")]
    InvalidAlignment(Alignment),
    #[error("Several overlaping regions")]
    OverlappingRegions,
    #[error("Rust allocator failed: {0}")]
    AllocationFailed(#[from] alloc::alloc::AllocError),
    #[error("Rust collection allocator failed: {0}")]
    VecAllocFailed(#[from] alloc::collections::TryReserveError),
    #[error("Failed to take lock")]
    InvalidContext(#[from] context::LockError),
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

pub type PhysicalAddress = usize;
pub type VirtualAddress = usize;

///Return crucial structures for kernel
///Without them, it's impossible
#[allow(static_mut_refs)]
#[no_mangle]
pub fn init_kernel_space(boot_config: &mut PagingProperties) {
    unsafe {
        GDT = boot_config.gdt().as_ref().clone();
        GDT_HANDLE = GDTHandle::new(&raw const GDT);
        GDT_HANDLE.load();

        //page directory is comming without any reference
        fn init_page(ph_offset: PhysicalAddress) {
            let page = unsafe { &mut *Page::take_unchecked(ph_offset) };
            *page = Page::new();

            page.acquire();
            let table_offset = ph_offset + kernel_virtual_offset();
            let _ = page.set_virtual(table_offset);
        }

        let directory = boot_config.page_directory();
        let entries = directory.share_entries();

        for table_entry in entries.iter() {
            let Some(page_table_offset) = table_entry.ph_offset() else {
                continue;
            };

            init_page(page_table_offset);

            let page_table = table_entry.page_table().unwrap();

            page_table
                .iter()
                .filter_map(|page_entry| page_entry.ph_offset())
                .for_each(|ph_offset| {
                    init_page(ph_offset);
                });

            init_page(table_entry.ph_offset().unwrap());
        }

        init_page(directory.physical_offset);
    }

    let marker = PageMarker::new(boot_config.page_directory());

    KERNEL_MARKER.set(marker);
    let allocator = PhysicalAllocator::from_boot(boot_config.boot_allocator());
    PHYSICAL_ALLOCATOR.set(allocator);

    log::info!("Physical allocator is ready");

    let slab_allocator =
        SystemAllocator::new(&PHYSICAL_ALLOCATOR, boot_config.heap_offset())
            .expect("Failed to initialize slab allocator");

    SYSTEM_ALLOCATOR.set(slab_allocator);

    KERNEL_MARKER
        .get()
        .unmap_range(0..kernel_virtual_offset(), true);

    KERNEL_MARKER.get().load();

    unsafe { PHYSICAL_ALLOCATOR.get().init() };
    unsafe { SYSTEM_ALLOCATOR.get().init() };
}

#[allow(static_mut_refs)]
pub fn enable_task_switching() {
    let mut state = TaskState::null();
    state.set_io_map(0xFFFF);
    state.set_stack_selector(SegmentSelector::KERNEL_DATA);
    state.set_code_selector(SegmentSelector::KERNEL_CODE);

    unsafe { TASK_STATE = state };

    let task = TaskStateDescriptor::active(
        &raw const TASK_STATE as VirtualAddress,
        mem::size_of::<TaskState>() - 1,
    );

    log::debug!("Task state: {task:?}");

    unsafe { GDT.load_task(task) };

    unsafe { context::init() };
}

fn alloc_physical_pages(page_count: usize) -> Option<PhysicalAddress> {
    log::debug!("physical alloc for pages");

    let pages = virtual_alloc(
        Page::SIZE * page_count,
        MemoryAllocationFlag::CONTINOUS
            | MemoryAllocationFlag::ZEROED
            | MemoryAllocationFlag::READ_WRITE,
    )
    .ok()?;

    let offset = KERNEL_MARKER.get().lookup_physical(pages).unwrap();

    offset.into()
}

fn dealloc_physical_page(page: PhysicalAddress) {
    SYSTEM_ALLOCATOR.virtual_dealloc(page, Page::SIZE);
}

fn lookup_kernel_physical_page(
    offset: VirtualAddress,
) -> Option<PhysicalAddress> {
    KERNEL_MARKER.get().lookup_physical(offset)
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

//ensure that slab will have at least
//deseriaable count of entries anytime
pub fn slab_reserve<T: Slab>() -> Result<(), AllocError> {
    let size = mem::size_of::<T>();

    assert!(size < u16::MAX as usize);

    let layout = SYSTEM_ALLOCATOR.get().alloc_slab(SlabAlloc {
        name: T::NAME,
        size: size as u16,
        alignment: T::ALIGNMENT,
    })?;

    SYSTEM_ALLOCATOR.get().dealloc_slab(T::NAME, layout);

    Ok(())
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
pub fn virtual_alloc(
    size: usize,
    flags: MemoryAllocationFlag,
) -> Result<VirtualAddress, AllocError> {
    SYSTEM_ALLOCATOR
        .get()
        .virtual_alloc(size, flags)
        .map(|ptr| ptr as VirtualAddress)
}

pub fn virtual_dealloc(offset: VirtualAddress, size: usize) {
    SYSTEM_ALLOCATOR.get().virtual_dealloc(offset, size);
}

pub fn new_page_marker() -> Result<PageMarker, AllocError> {
    static_assertions::const_assert_eq!(
        Page::SIZE,
        mem::size_of::<PageDirectoryEntries>()
    );

    let raw_entries = SYSTEM_ALLOCATOR
        .get()
        .virtual_alloc(
            Page::SIZE,
            MemoryAllocationFlag::CONTINOUS
                | MemoryAllocationFlag::ZEROED
                | MemoryAllocationFlag::READ_WRITE,
        )?
        .cast::<PageDirectoryEntries<'static>>();

    let entries = unsafe { &mut *raw_entries };

    //essential data structures will be copied
    //but we must ensure integrity kernel space
    //in all processes
    unsafe {
        entries
            .copy_from_slice(KERNEL_MARKER.get().directory().share_entries());
    }

    let physical_offset = KERNEL_MARKER
        .get()
        .lookup_physical(raw_entries as VirtualAddress)
        .expect("vmalloc without page");

    let directory = PageDirectory {
        entries,
        physical_offset,
    };

    Ok(PageMarker::new(directory))
}

pub struct PhysicalAllocation {
    pages: LinkedList<'static, Page>,
}

impl core::ops::Deref for PhysicalAllocation {
    type Target = LinkedList<'static, Page>;

    fn deref(&self) -> &Self::Target {
        &self.pages
    }
}

impl core::ops::DerefMut for PhysicalAllocation {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.pages
    }
}

impl Drop for PhysicalAllocation {
    fn drop(&mut self) {
        if self.pages.is_empty() {
            return;
        }

        let mut dealloc_pages = LinkedList::empty();
        dealloc_pages.splice(&mut self.pages);

        physical_dealloc(dealloc_pages);
    }
}

impl From<LinkedList<'static, Page>> for PhysicalAllocation {
    fn from(pages: LinkedList<'static, Page>) -> Self {
        Self { pages }
    }
}

pub fn remap(
    process: &Process,
    map_region: MemoryMappingRegion,
) -> Result<(), AllocError> {
    assert_eq!(map_region.virtual_offset % Page::SIZE, 0);

    let mut pages = PHYSICAL_ALLOCATOR
        .get()
        .reserve_pages(map_region.physical_offset, map_region.page_count)?;

    let mut state = process.state.lock();

    state.marker.map_user_range(&map_region)?;

    let Some(mem_region) = state.find_region_mut(map_region.virtual_offset)
    else {
        let mem_region = MemoryRegion::new_allocated(
            map_region,
            MemoryRegionFlag::READ_WRITE,
            &mut pages,
        )?;

        state.add_region(mem_region.into_node());

        return Ok(());
    };

    let mem_region_above =
        mem_region.split_on(map_region.virtual_offset, pages)?;

    if let Some(mem_region) = mem_region_above {
        state.add_region(mem_region.into_node());
    }

    Ok(())
}

/// allocate physical memory
/// not continuous
pub fn physical_alloc(bytes: usize) -> Result<PhysicalAllocation, AllocError> {
    let pages_count = Page::upper_bound(bytes);

    let list = PHYSICAL_ALLOCATOR.get().alloc_zeroed_pages(pages_count)?;

    Ok(list.into())
}

pub fn physical_dealloc(mut pages: LinkedList<'static, Page>) {
    let mut iter = pages.iter_mut();

    loop {
        if iter.next().is_none() {
            break;
        }

        let page = iter.unlink_watched().unwrap();

        PHYSICAL_ALLOCATOR.get().dealloc_page(page);
    }
}

//the method should be invoked only by one thread
//concurrency is forbidden
/// Set ss:esp in TSS
/// This stack will be used during
/// user-space to kernel-space switching
/// for kernel-space switching no tss is used
#[no_mangle]
pub unsafe fn switch_to_task(task: &mut Task) {
    let stack = task.stack_start();

    let task_state = &raw mut TASK_STATE;
    unsafe { (*task_state).set_kernel_stack(stack) };

    if let Some(process) = task.process.as_ref() {
        let state = process.state.lock();

        state.marker.load();
    } else {
        KERNEL_MARKER.get().load();
    };
}

#[derive(Debug, Clone, Copy)]
pub enum AddressSpace {
    Kernel,
    User,
}

impl AddressSpace {
    pub fn is_kernel(&self) -> bool {
        matches!(self, Self::Kernel)
    }

    pub fn is_user(&self) -> bool {
        !self.is_kernel()
    }
}

pub fn address_space() -> AddressSpace {
    current_task!()
        .process
        .clone()
        .map(|proc| {
            let kernel_dir = KERNEL_MARKER.get().directory() as *const _;
            let user_dir = proc.state.lock().marker.directory() as *const _;

            if ptr::eq(kernel_dir, user_dir) {
                AddressSpace::Kernel
            } else {
                AddressSpace::User
            }
        })
        .unwrap_or(AddressSpace::Kernel)
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

// impl ToPhysicalAddress for Page {
//     //return which physical address is used for such
//     fn as_physical(&self) -> PhysicalAddress {
//         let page_offset = ptr::from_ref(self);
//
//         let page_index =
//             unsafe { page_offset.offset_from_unsigned(mem_map_offset()) };
//
//         page_index << Page::SHIFT
//     }
// }

///commit kernel memory
pub fn kernel_commit(
    region: MemoryMappingRegion,
) -> Result<(), PageMarkerError> {
    let mut marker = KERNEL_MARKER.get();
    marker.map_kernel_range(&region)
}

extern "C" {
    static mut MEMORY_MAP: MemoryMap;
}

static mut TASK_STATE: TaskState = TaskState::null();
static mut GDT: GDTTable = GDTTable::null();
static mut GDT_HANDLE: GDTHandle = GDTHandle::null();

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
            MemoryAllocationFlag::CONTINOUS | MemoryAllocationFlag::READ_WRITE,
        )
        .map(|offset| offset as *mut u8)
        .unwrap_or(ptr::null_mut())
    }

    unsafe fn dealloc(&self, ptr: *mut u8, layout: core::alloc::Layout) {
        if let Some(slab) = allocators::classify_slab_by_size(layout.size()) {
            SYSTEM_ALLOCATOR.get().dealloc_slab(slab.name, ptr);

            return;
        }

        virtual_dealloc(ptr as VirtualAddress, layout.size());
    }
}

static KERNEL_MARKER: SpinLockLazyCell<PageMarker> = SpinLockLazyCell::empty();
