use crate::memory::{PageInfoRec, PageMarker, CaptureAllocator, PhysicalAddress, VirtualAddress, Page};
use core::{mem, ptr};
pub struct KernelAllocator {
    memory_list: *mut PageInfoRec,
    marker: PageMarker,
}
impl KernelAllocator {
    pub fn new(allocator: CaptureAllocator, marker: PageMarker) -> KernelAllocator {
        let memory_size = allocator.pivots.iter().map(|pivot| pivot.free_pages() * Page::SIZE).sum::<usize>();
        let rec_cnt = memory_size / mem::size_of::<PageInfoRec>();
        let pages_per_list = Page::upper_bound(rec_cnt * mem::size_of::<PageInfoRec>());
        let mut next_entry_offset = allocator.alloc(None, pages_per_list).unwrap();
        //Pages::markPage
        let mut last_entry = ptr::null_mut();
        for pivot in allocator.pivots.iter() {
            let mut rest_size = pivot.free_pages() * Page::SIZE;
            let mut physical_offset = pivot.memory_offset;
            while rest_size >= Page::SIZE {
                let info_rec: PageInfoRec = PageInfoRec {
                    prev: last_entry,
                    next: ptr::null_mut(),
                    offset: physical_offset,
                    flags: 0,
                };
                unsafe {
                    let next_entry = KernelAllocator::store_entry(next_entry_offset, info_rec);
                    if last_entry != ptr::null_mut() {
                        (&mut *last_entry).next = next_entry;
                    }
                    last_entry = next_entry;
                    next_entry_offset = next_entry_offset.wrapping_add(1);
                }
                rest_size -= mem::size_of::<PageInfoRec>();
                physical_offset += Page::SIZE;
            }
        }
        return KernelAllocator { memory_list: last_entry, marker };
    }
    unsafe fn store_entry(dest: *mut u8, info_rec: PageInfoRec) -> *mut PageInfoRec {
        let entry_offset = dest as *mut PageInfoRec;
        ptr::write_unaligned(entry_offset, info_rec);
        return entry_offset;
    }
    pub fn alloc(&mut self, page_cnt: usize) -> Option<PhysicalAddress> {
        None
    }
}