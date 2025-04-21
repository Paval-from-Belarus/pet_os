use core::ops::Range;

use crate::memory::{Page, VirtualAddress};

pub struct Segments<'a> {
    pub code_start: VirtualAddress,
    pub data_start: VirtualAddress,
    pub heap_start: VirtualAddress,

    pub heap_size: usize,

    pub stack_top: VirtualAddress,

    pub code: &'a [u8],
    pub data: &'a [u8],
}

impl Segments<'_> {
    pub fn code_size(&self) -> usize {
        assert!(self.data_start > self.code_start);

        self.data_start - self.code_start
    }

    pub fn code_range(&self) -> Range<VirtualAddress> {
        self.code_start..self.data_start
    }

    pub fn data_range(&self) -> Range<VirtualAddress> {
        self.data_start..self.heap_start
    }

    pub fn heap_range(&self) -> Range<VirtualAddress> {
        self.heap_start..(self.heap_start + self.heap_size)
    }

    pub fn stack_range(&self) -> Range<VirtualAddress> {
        (self.stack_top - Page::SIZE)..(self.stack_top)
    }
    pub fn stack_size(&self) -> usize {
        self.stack_range().len()
    }

    pub fn data_size(&self) -> usize {
        assert!(self.heap_start > self.data_start);

        self.heap_start - self.data_start
    }

    pub fn heap_size(&self) -> usize {
        self.heap_size
    }
}
