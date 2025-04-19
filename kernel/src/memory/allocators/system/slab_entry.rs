use core::ptr;

use bitvec::{order::Lsb0, view::BitView};
use kernel_macro::ListNode;
use kernel_types::{
    collections::{BorrowingLinkedList, LinkedList, TinyListNode},
    declare_constants, Zeroed,
};
use static_assertions::const_assert;

use crate::memory::{Page, VirtualAddress};

use super::SlabSize;

#[derive(Debug, ListNode)]
pub struct SlabEntry {
    #[list_pivot]
    next: TinyListNode<SlabEntry>, //4
    base_offset: *mut u8, //4
    capacity: usize,      //4
    //the count of memory unit in next pool
    pages: LinkedList<'static, Page>, //8
    object_size: u16,
    heap_mask: u32, //maximal
    reserved: Zeroed<[u8; 6]>,
}

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
    //the size in bytes
    pub fn new(next: TinyListNode<SlabEntry>, object_size: u16) -> Self {
        Self {
            next,
            base_offset: ptr::null_mut(),
            object_size,
            capacity: 0,
            heap_mask: 0,
            pages: LinkedList::empty(),
            reserved: Zeroed::default(),
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

        if object_index >= self.capacity {
            return false;
        }

        *self
            .heap_mask
            .view_bits::<Lsb0>()
            .get(object_index)
            .expect("Valid bit index")
    }

    pub fn take_object(&mut self) -> VirtualAddress {
        assert!(!self.is_empty());

        let bits = self.heap_mask.view_bits_mut::<Lsb0>();

        let object_index = bits
            .iter()
            .enumerate()
            .find(|(_, bit)| !*bit.clone())
            .map(|(object_index, _)| object_index)
            .expect("At least one object is free");

        bits.set(object_index, true);

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

    pub unsafe fn set(&mut self, offset: *mut u8, pages: &'static mut [Page]) {
        let capacity = pages.len() * Page::SIZE / self.object_size as usize;

        assert!(capacity <= MAX_SLAB_CAPACITY);

        let mut pages_list = LinkedList::empty();

        for page in pages.into_iter() {
            pages_list.push_front(page.as_node());
        }

        self.base_offset = offset;
        self.capacity = capacity;
        self.pages = pages_list;
    }

    pub fn available(&self) -> usize {
        (self.heap_mask as usize).count_ones() as usize
    }

    pub const fn is_empty(&self) -> bool {
        self.heap_mask == 0
    }

    pub const fn is_full(&self) -> bool {
        self.heap_mask == u32::MAX
    }
}
