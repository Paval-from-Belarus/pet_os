use core::sync::atomic::{AtomicUsize, Ordering};

use kernel_macro::ListNode;
use kernel_types::collections::ListNode;

use super::{mem_map_offset, PhysicalAddress, VirtualAddress};

#[derive(Debug, ListNode)]
#[repr(C)]
pub struct Page {
    #[list_pivots]
    node: ListNode<Page>, //8
    //it's easy to use in calculation, in future should be replace by macro
    //when zero page should be free
    ref_count: AtomicUsize,
    pub flags: PageFlag,

    virtual_offset: usize,
}

bitflags::bitflags! {
    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
    #[repr(transparent)]
    pub struct PageFlag: u16 {
        /// The page is in use
        const ACTIVE = 0x01;
        /// The page has written bytes
        const DIRTY = 0x02;
        /// Hardware memory bug
        const ERROR = 0x04;
        /// Cannot be swapped
        const LOCKED = 0x08;
        const UNUSED = 0x10;
        const DMA = 0x20;
        const VIRTUAL_MAPPED = 0x40;
    }
}

static_assertions::assert_eq_size!(Page, [u8; 20]);

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
            node: ListNode::empty(),
            virtual_offset: 0,
        }
    }

    pub fn take(offset: PhysicalAddress) -> &'static Page {
        let page = unsafe { &*Self::take_unchecked(offset) };

        page.acquire();

        page
    }

    pub fn take_mut(offset: PhysicalAddress) -> Option<&'static mut Page> {
        let page_ptr = Self::take_unchecked(offset);

        let is_used = unsafe { &*page_ptr }.is_used();

        if is_used {
            return None;
        }

        let page = unsafe { &mut *page_ptr };

        page.acquire();

        page.into()
    }

    pub fn take_unchecked(offset: PhysicalAddress) -> *mut Page {
        let page_index: usize = offset >> Page::SHIFT;
        unsafe { mem_map_offset().add(page_index) }
    }

    ///increment reference counter in page
    pub fn acquire(&self) {
        let _old_value = self.ref_count.fetch_add(1, Ordering::SeqCst);
    }

    pub fn release(&self) {
        let old_value = self.ref_count.fetch_sub(1, Ordering::SeqCst);
        if old_value == 0 {
            log::warn!("The free page releases again");
            self.ref_count.store(0, Ordering::SeqCst);
        }
    }

    //return previous virtual offset
    #[must_use]
    pub fn set_virtual(
        &mut self,
        offset: VirtualAddress,
    ) -> Option<VirtualAddress> {
        let old_offset = self
            .flags
            .contains(PageFlag::VIRTUAL_MAPPED)
            .then_some(self.virtual_offset);

        self.virtual_offset = offset;
        self.flags |= PageFlag::VIRTUAL_MAPPED;

        old_offset
    }

    pub unsafe fn set_virtual_unchecked(&mut self, offset: VirtualAddress) {
        assert!(!self.flags.contains(PageFlag::VIRTUAL_MAPPED));

        self.flags |= PageFlag::VIRTUAL_MAPPED;
        self.virtual_offset = offset;
    }

    pub fn reset_virtual(&mut self) -> Option<VirtualAddress> {
        if !self.flags.contains(PageFlag::VIRTUAL_MAPPED) {
            return None;
        }

        self.flags.remove(PageFlag::VIRTUAL_MAPPED);
        let offset = self.virtual_offset;
        self.virtual_offset = 0;
        offset.into()
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

    pub unsafe fn as_slice(&self, count: usize) -> &'static [Page] {
        core::slice::from_raw_parts(self, count)
    }

    pub unsafe fn as_slice_mut(&mut self, count: usize) -> &'static mut [Page] {
        core::slice::from_raw_parts_mut(self, count)
    }

    pub fn as_physical(&self) -> PhysicalAddress {
        self.index() << Page::SHIFT
    }

    pub fn as_virtual(&self) -> Option<VirtualAddress> {
        self.flags
            .contains(PageFlag::VIRTUAL_MAPPED)
            .then_some(self.virtual_offset)
    }

    /// Page index in global MEMORY_MAP
    pub fn index(&self) -> usize {
        let page_offset = core::ptr::from_ref(self);

        unsafe { page_offset.offset_from_unsigned(mem_map_offset()) }
        // let offset = (self as *const Page as VirtualAddress)
        //     - (mem_map_offset() as VirtualAddress);
        //
        // offset / core::mem::size_of::<Page>()
    }
}
