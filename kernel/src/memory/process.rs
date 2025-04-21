use core::{
    ops::Range,
    sync::atomic::{AtomicUsize, Ordering},
};

use kernel_types::collections::LinkedList;

use super::{
    paging::PageMarker, MemoryRegion, MemoryRegionFlag, Page, VirtualAddress,
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
    pub regions: LinkedList<'static, MemoryRegion>,

    pub pages: LinkedList<'static, Page>,
    // last_touched_region: Option<&'static MemoryRegion>,
}

impl super::Slab for ProcessState {
    const NAME: &str = "process";
}

impl ProcessState {
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
