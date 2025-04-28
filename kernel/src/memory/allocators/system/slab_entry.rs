use core::{mem::MaybeUninit, ptr};

use bitvec::{order::Lsb0, view::BitView};
use kernel_macro::ListNode;
use kernel_types::{
    collections::{BorrowingLinkedList, LinkedList, ListNode},
    declare_constants,
};
use static_assertions::const_assert;

use crate::memory::{Page, VirtualAddress};

use super::SlabSize;

#[derive(Debug, ListNode)]
#[repr(C)]
pub struct SlabEntry {
    #[list_pivots]
    next: ListNode<SlabEntry>, //8
    base_offset: *mut u8, //4
    //todo: use reserved bytes instead
    //the count of memory unit in next pool
    //todo: replace to PhysicalOffset to access list
    //the count of pages can be computed from object_size and amx_size
    pages: LinkedList<'static, Page>, //8
    capacity: u16,                    //2
    object_size: u16,                 //2
    heap_mask: u32,                   //4 maximal 32 objects
    #[cfg(target_pointer_width = "32")]
    reserved: MaybeUninit<[u8; 4]>,
}

//32bit arch. Total size = 8 + 4 + 8 + 4 + 4 + 4 (reserved) = 32
//64 arch. Total size = 16 + 8 + 16 + 8 + 16 (reserved) = 64

const_assert!(Page::SIZE % core::mem::size_of::<SlabEntry>() == 0);

impl SlabSize {
    pub const fn with_capacity(size: u16) -> Self {
        assert!(size < u16::MAX);
        Self(size)
    }
}

impl From<SlabSize> for usize {
    fn from(value: SlabSize) -> Self {
        value.0 as usize
    }
}

declare_constants! {
    pub usize,
    MAX_SLAB_CAPACITY = 32, "The maximal available count of objects to be address in single entry"
}

impl SlabEntry {
    pub fn new_uninit() -> Self {
        Self {
            next: ListNode::empty(),
            base_offset: ptr::null_mut(),
            object_size: 0,
            capacity: 0,
            heap_mask: 0,
            pages: LinkedList::empty(),

            reserved: MaybeUninit::uninit(),
        }
    }

    /// Safety
    /// offset should be greater then base offset
    unsafe fn object_index(&self, offset: VirtualAddress) -> usize {
        let distance = offset - self.base_offset as usize;

        assert!(distance % self.object_size as usize == 0);

        distance / self.object_size as usize
    }

    pub fn holds(&self, offset: VirtualAddress) -> bool {
        if offset < self.base_offset as usize {
            return false;
        }

        let object_index = unsafe { self.object_index(offset) };

        if object_index >= self.capacity as usize {
            return false;
        }

        *self
            .heap_mask
            .view_bits::<Lsb0>()
            .get(object_index)
            .expect("Valid bit index")
    }

    pub fn take_object(&mut self) -> VirtualAddress {
        assert!(self.capacity != 0);

        let bits = self.heap_mask.view_bits_mut::<Lsb0>();

        let object_index = bits
            .iter()
            .enumerate()
            .find(|(_, bit)| !*bit.clone())
            .map(|(object_index, _)| object_index)
            .expect("At least one object is free");

        bits.set(object_index, true);

        log::debug!("Object size = {}", self.object_size);

        let take_offset = unsafe {
            self.base_offset
                .add(object_index * self.object_size as usize)
        };

        take_offset as VirtualAddress
    }

    pub fn release(&mut self, offset: VirtualAddress) {
        assert!(self.holds(offset));

        let index = unsafe { self.object_index(offset) };

        let bits = self.heap_mask.view_bits_mut::<Lsb0>();

        bits.set(index, false);
    }

    pub unsafe fn set(
        &mut self,
        object_size: u16,
        offset: *mut u8,
        pages: &'static mut [Page],
    ) {
        self.base_offset = offset;
        self.object_size = object_size;

        //todo: wasting memory for small objects
        let capacity = (pages.len() * Page::SIZE / self.object_size as usize)
            .min(MAX_SLAB_CAPACITY);

        assert!(capacity <= MAX_SLAB_CAPACITY);

        let mut pages_list = LinkedList::empty();

        for page in pages.iter_mut() {
            pages_list.push_front(page.as_node());
        }

        self.capacity = capacity as u16;
        self.pages = pages_list;
    }

    pub fn available(&self) -> usize {
        (self.heap_mask as usize).count_zeros() as usize
    }

    pub fn is_empty(&self) -> bool {
        self.heap_mask == 0
    }

    pub const fn is_full(&self) -> bool {
        self.heap_mask == u32::MAX
    }
}
