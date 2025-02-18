use core::ptr;

use kernel_macro::ListNode;
use kernel_types::{
    collections::{BorrowingLinkedList, LinkedList, TinyListNode},
    declare_constants, Zeroed,
};
use static_assertions::const_assert;

use crate::memory::{Page, VirtualAddress};

use super::SlabPiece;

//todo: connecto slab heads on top level
// use slab entries as child for slab head
pub struct SlabHead;

#[derive(Debug, ListNode)]
pub struct SlabEntry {
    #[list_pivot]
    next: TinyListNode<SlabEntry>,
    base_offset: *mut u8,
    count: usize,
    capacity: usize,
    //the count of memory unit in next pool
    pages: LinkedList<'static, Page>,
    //todo: add name parameter for page
    reserved: Zeroed<[usize; 2]>,
}

const_assert!(
    Page::SIZE % core::mem::size_of::<TinyListNode<SlabEntry>>() == 0
);

impl SlabPiece {
    pub const fn with_capacity(size: u16) -> Self {
        assert!(size < u16::MAX);
        Self(size)
    }
}

impl From<SlabPiece> for usize {
    fn from(value: SlabPiece) -> Self {
        value.0 as usize
    }
}

const_assert!(SlabEntry::DEFAULT_SLAB_SIZE_IN_PAGES % 2 == 0);

impl SlabEntry {
    declare_constants! {
        pub usize,
        DEFAULT_SLAB_SIZE_IN_PAGES = 4, "The count of pages for slab entry";
        MAX_SLAB_SIZE_IN_PAGES = 16, "The maximal count of pages for slab entry";
    }

    //the size in bytes
    pub fn new(next: TinyListNode<SlabEntry>) -> Self {
        Self {
            next,
            base_offset: ptr::null_mut(),
            count: 0,
            capacity: 0,
            pages: LinkedList::empty(),
            reserved: Zeroed::default(),
        }
    }

    pub fn holds(&self, offset: VirtualAddress) -> bool {
        let distance = (offset as isize) - (self.base_offset as isize);
        distance >= 0 && (distance as usize) < Page::SIZE * self.count
    }

    pub fn take(&mut self, pages_count: usize) -> *mut u8 {
        assert!(self.available() >= pages_count);

        let take_offset =
            unsafe { self.base_offset.add(self.count * Page::SIZE) };
        self.count += pages_count;

        take_offset
    }

    pub fn release(&mut self, _offset: VirtualAddress) {
        //not implemented
    }

    pub fn set(
        &mut self,
        offset: *mut u8,
        pages: LinkedList<'static, Page>,
        pages_count: usize,
    ) {
        self.base_offset = offset;
        self.capacity = pages_count;
        self.count = 0;
        self.pages = pages;
    }

    pub fn get_pages(&mut self) -> &mut LinkedList<'static, Page> {
        &mut self.pages
    }

    pub fn set_pages(&mut self, pages: LinkedList<'static, Page>) {
        self.pages = pages;
    }

    ///@return the total pages in slab available to alloc
    pub fn available(&self) -> usize {
        self.capacity - self.count
    }

    pub fn total_available(&self) -> usize {
        Self::MAX_SLAB_SIZE_IN_PAGES - self.count
    }

    pub const fn is_empty(&self) -> bool {
        self.capacity == 0
    }

    pub const fn is_bloated(&self) -> bool {
        self.count > self.capacity / 2
    }

    pub const fn is_full(&self) -> bool {
        self.count == self.capacity
    }
}
