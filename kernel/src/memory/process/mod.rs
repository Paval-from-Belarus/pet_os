mod segment;

use core::{
    ops::Range,
    sync::atomic::{AtomicUsize, Ordering},
};

use kernel_types::{
    collect_list,
    collections::{BorrowingLinkedList, LinkedList},
};
use segment::Segments;

use crate::memory::{
    self, MemoryMappingFlag, MemoryMappingRegion, SegmentSelector,
    ToPhysicalAddress,
};

use super::{
    paging::PageMarker, AllocError, MemoryRegion, MemoryRegionFlag, Page,
    VirtualAddress,
};

pub type ProcessId = usize;

pub const MAX_PROCESS_ID: usize = u16::MAX as usize;

static NEXT_ID: AtomicUsize = AtomicUsize::new(0);

pub fn new_proccess_id() -> Option<ProcessId> {
    let next_id = NEXT_ID.fetch_add(1, Ordering::SeqCst);

    if next_id > MAX_PROCESS_ID {
        NEXT_ID.store(MAX_PROCESS_ID, Ordering::SeqCst);
        return None;
    }

    next_id.into()
}

pub type ProcessStateLock = spin::Mutex<ProcessState>;

///Alternative to linux mm_struct
pub struct ProcessState {
    pub id: ProcessId,
    ///offset of data segment
    ///It's redundant to store any information about last page ― it's can be easily calculated from heap_offset as:<br>
    ///<code> heap_offset % Page::SIZE </code> <br>
    ///index of last touched page in PageLayout Table
    //I believe that heap_offset should be aligned to Page::SIZE. Practically, space will be access
    //offset of stack memory -> used for erasing stack memory
    // last_page_index: usize,
    //Write | NoPrivilege
    pub marker: PageMarker<'static>,

    pub code: Range<VirtualAddress>,
    pub data: Range<VirtualAddress>,
    pub heap: Range<VirtualAddress>,
    pub stack: Range<VirtualAddress>,

    pub regions: LinkedList<'static, MemoryRegion>,

    pub pages: LinkedList<'static, Page>,
    // last_touched_region: Option<&'static MemoryRegion>,
}

impl super::Slab for ProcessState {
    const NAME: &str = "process";
}

impl ProcessState {
    pub fn new_boxed(segments: Segments) -> Result<Self, AllocError> {
        assert!((segments.data_start - segments.code_start) % Page::SIZE == 0);

        let Some(id) = new_proccess_id() else {
            return Err(AllocError::NoMemory);
        };

        let mut marker = memory::new_page_marker().unwrap();

        let code_pages = memory::physical_alloc(segments.code_size()).unwrap();

        let mut code_offset = segments.code_range().start;
        for page in code_pages.iter() {
            marker
                .map_user_range(&MemoryMappingRegion {
                    flags: MemoryMappingFlag::USER_CODE,
                    virtual_offset: code_offset,
                    physical_offset: page.as_physical(),
                    page_count: code_pages.len(),
                    ..Default::default()
                })
                .expect("Failed to commit user code");

            code_offset += Page::SIZE;
        }

        let data_pages = memory::physical_alloc(segments.data_size()).unwrap();

        let mut data_offset = segments.data_range().start;
        for page in data_pages.iter() {
            marker
                .map_user_range(&MemoryMappingRegion {
                    flags: MemoryMappingFlag::USER_DATA,
                    virtual_offset: data_offset,
                    physical_offset: page.as_physical(),
                    page_count: data_pages.len(),
                    ..Default::default()
                })
                .expect("Failed to commit user data");

            data_offset += Page::SIZE;
        }

        let heap_pages = memory::physical_alloc(segments.heap_size()).unwrap();

        let mut heap_offset = segments.heap_range().start;
        for page in heap_pages.iter() {
            marker
                .map_user_range(&MemoryMappingRegion {
                    flags: MemoryMappingFlag::USER_DATA,
                    virtual_offset: heap_offset,
                    physical_offset: page.as_physical(),
                    page_count: data_pages.len(),
                    ..Default::default()
                })
                .expect("Failed to commit user data");

            heap_offset += Page::SIZE;
        }

        let stack_pages =
            memory::physical_alloc(segments.stack_size()).unwrap();

        let mut stack_offset = segments.stack_range().start;
        for page in stack_pages.iter() {
            marker
                .map_user_range(&MemoryMappingRegion {
                    flags: MemoryMappingFlag::USER_DATA,
                    virtual_offset: stack_offset,
                    physical_offset: page.as_physical(),
                    page_count: data_pages.len(),
                    ..Default::default()
                })
                .expect("Failed to commit user data");

            stack_offset += Page::SIZE;
        }

        copy_physically(segments.code, &code_pages).unwrap();
        copy_physically(segments.data, &data_pages).unwrap();

        let pages =
            collect_list![code_pages, data_pages, heap_pages, stack_pages];

        Ok(Self {
            id,
            code: segments.code_range(),
            stack: segments.stack_range(),
            data: segments.data_range(),
            heap: segments.heap_range(),
            marker,
            pages,
            regions: LinkedList::empty(),
        })
    }

    pub fn run(&self, entry_point: VirtualAddress) {
        unsafe {
            core::arch::asm! {
                "shl edx, 16",
                "mov dx, cx",
                "mov ecx, eax",
                in("eax") self.stack.end,
                in("cx") *SegmentSelector::USER_DATA,
                in("dx") *SegmentSelector::USER_CODE,
                options(nomem, nostack, preserves_flags)
            }

            core::arch::asm! {
                "jmp start_process",
                in("eax") entry_point,
                options(nomem, nostack, preserves_flags)
            }
        }
    }

    pub fn find_region(
        &mut self,
        address: VirtualAddress,
    ) -> Option<&MemoryRegion> {
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

    pub fn add_region(
        &mut self,
        _region: &'static mut MemoryRegion,
    ) -> Result<(), ()> {
        Ok(())
    }

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
    ) -> Option<&MemoryRegion> {
        let option_region = self.find_region(range.start);
        if let Some(region) = option_region
            && region.range.end < range.end
        {
            return Some(region);
        }
        None
    }
}

pub struct AddressSpace {
    clean_pages: LinkedList<'static, Page>,
    dirty_pages: LinkedList<'static, Page>,
    locked_pages: LinkedList<'static, Page>,
    total_pages_count: usize,
    marker: PageMarker<'static>,
}

fn copy_physically(
    data: &[u8],
    pages: &LinkedList<'_, Page>,
) -> Result<(), AllocError> {
    assert_eq!(Page::upper_bound(data.len()), pages.len() * Page::SIZE);

    let mut data_offset = 0;

    for page in pages.iter() {
        assert!(data_offset < data.len());

        let code_ptr = unsafe { memory::kernel_map(page.as_slice(1)).unwrap() };

        let copied_size = usize::min(Page::SIZE, data.len() - data_offset);

        let source = &data[data_offset..(data_offset + copied_size)];

        let target =
            unsafe { core::slice::from_raw_parts_mut(code_ptr, source.len()) };

        target.copy_from_slice(source);

        unsafe { memory::kernel_unmap(page.as_slice(1), code_ptr) }

        data_offset += copied_size;
    }

    Ok(())
}
