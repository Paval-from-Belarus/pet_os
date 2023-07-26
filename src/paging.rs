use core::mem::size_of;
use core::ptr;

#[repr(packed)]
pub struct MemRangeRec {
    offset: usize,
    size: usize,
}

pub struct Page {
    next: *mut Page,
    prev: *mut Page,
    flags: u32,
    physical_offset: usize, //it's easy to use in calculation
}

pub struct MMU {
    directory: *mut u8,
}

pub enum AllocOffset {
    Start(usize),
    Any,
}

pub struct CaptureMemRec {
    memory_offset: usize,
    page_cnt: usize,
    next_page: usize,
}
pub trait Allocator {
    fn alloc(&mut self, offset: AllocOffset, page_cnt: usize) -> Option<*mut u8>;
}
pub struct CaptureAllocator<'a> {
    pivots: &'a mut [CaptureMemRec],
}

pub struct KernelAllocator {
    memory_list: *mut Page,
}

pub struct SystemAllocator {}

//todo! carefully check in mutlti threaded environment
impl Page {
    pub fn next_entry(&self) -> Option<&mut Page> {
        let entry;
        if self.next != ptr::null_mut() {
            unsafe {
                entry = Some(&mut *self.next);
            }
        } else {
            entry = None;
        }
        return entry;
    }
    pub fn prev_entry(&self) -> Option<&mut Page> {
        let entry;
        if self.prev != ptr::null_mut() {
            unsafe {
                entry = Some(&mut *self.prev);
            }
        } else {
            entry = None;
        }
        return entry;
    }
}

impl AllocOffset {
    pub fn is_valid(&self, offset: usize) -> bool {
        return match self {
            AllocOffset::Start(min_offset) => offset <= *min_offset,
            AllocOffset::Any => true
        };
    }
}

impl CaptureMemRec {
    pub fn from(range_rec: &MemRangeRec) -> CaptureMemRec {
        return CaptureMemRec {
            memory_offset: range_rec.offset,
            page_cnt: range_rec.size / Page::SIZE,
            next_page: 0,
        };
    }
    pub fn free_pages(&self) -> usize {
        return self.page_cnt - self.next_page;
    }
    pub fn capture_offset(&mut self, page_cnt: usize) -> Option<*mut u8> {
        let rest_pages = self.free_pages();
        let result;
        if rest_pages >= page_cnt {
            self.next_page += page_cnt;
            let offset = self.memory_offset + page_cnt * Page::SIZE;
            result = Some(offset as *mut u8);
        } else {
            result = None;
        }
        return result;
    }
}

impl<'a> CaptureAllocator<'a> {
    pub fn new(captures: &mut [CaptureMemRec]) -> CaptureAllocator {
        CaptureAllocator{pivots:captures}
    }
}
impl<'a> Allocator for CaptureAllocator<'a> {
    fn alloc(&mut self, search_offset: AllocOffset, page_cnt: usize) -> Option<*mut u8> {
        let mut mem_offset = None;
        for pivot in self.pivots.iter_mut() {
            if search_offset.is_valid(pivot.memory_offset) {
                mem_offset = pivot.capture_offset(page_cnt);
            }
            if mem_offset.is_some() {
                break;
            }
        }
        return mem_offset;
    }
}
fn mark_pages(dir: usize, allocator: &mut dyn Allocator){
    let offset = allocator.alloc(AllocOffset::Any, 1).unwrap();
}

impl KernelAllocator {
    pub fn new(allocator: &mut CaptureAllocator) {
        let memory_size = allocator.pivots.iter().map(|pivot| pivot.free_pages() * Page::SIZE).sum::<usize>();
        let rec_cnt = memory_size / size_of::<Page>();
        let pages_per_list = Page::upper_bound(rec_cnt * size_of::<Page>());
        let mut next_entry_offset = allocator.alloc(AllocOffset::Any, pages_per_list).unwrap();
        //Pages::markPage
        let mut last_entry = ptr::null_mut();
        for pivot in allocator.pivots.iter() {
            let mut rest_size = pivot.free_pages() * Page::SIZE;
            let mut physical_offset = pivot.memory_offset;
            while rest_size >= Page::SIZE {
                let info_rec: Page = Page {
                    prev: last_entry,
                    next: ptr::null_mut(),
                    physical_offset,
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
                rest_size -= size_of::<Page>();
                physical_offset += Page::SIZE;
            }
        }
    }
    unsafe fn store_entry(dest: *mut u8, info_rec: Page) -> *mut Page {
        let entry_offset = dest as *mut Page;
        ptr::write_unaligned(entry_offset, info_rec);
        return entry_offset;
    }
}
impl Allocator for KernelAllocator {
    fn alloc(&mut self, offset: AllocOffset, page_cnt: usize) -> Option<*mut u8> {
        todo!()
    }
}

impl Page {
    pub const SIZE: usize = 4096;
    pub const fn upper_bound(byte_size: usize) -> usize {
        return (byte_size + Page::SIZE - 1) / Page::SIZE;
    }
    pub const fn lower_bound(byte_size: usize) -> usize {
        return byte_size / Page::SIZE;
    }
}