use core::{ops::Range, ptr::NonNull};

use kernel_types::collections::LinkedList;

use super::{
    paging::PageMarker, MemoryRegion, MemoryRegionFlag, Page, VirtualAddress,
};

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
    regions: LinkedList<'static, MemoryRegion>,
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

pub struct AddressSpace {
    clean_pages: LinkedList<'static, Page>,
    dirty_pages: LinkedList<'static, Page>,
    locked_pages: LinkedList<'static, Page>,
    total_pages_count: usize,
    marker: PageMarker<'static>,
}
