use core::sync::atomic::{AtomicUsize, Ordering};

use kernel_macro::ListNode;
use kernel_types::collections::ListNode;

use super::{mem_map_offset, PhysicalAddress, VirtualAddress};

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

bitflags::bitflags! {
    #[derive(Debug, Clone, Copy)]
    #[repr(transparent)]
    pub struct PageFlag: usize {
        const ACTIVE = 0x01;
        const DIRTY = 0x02;
        const ERROR = 0x04;
        const LOCKED = 0x08;
        const UNUSED = 0x10;
    }
}

static_assertions::assert_eq_size!(Page, [u8; 16]);

impl Default for Page {
    fn default() -> Self {
        Self::new()
    }
}

impl Page {
    pub const SHIFT: usize = 12;
    /// The size of page in bytes
    pub const SIZE: usize = 1 << Page::SHIFT;

    pub const fn new() -> Self {
        Self {
            flags: PageFlag::UNUSED,
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
        byte_size.div_ceil(Page::SIZE)
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

        offset / core::mem::size_of::<Page>()
    }
}
