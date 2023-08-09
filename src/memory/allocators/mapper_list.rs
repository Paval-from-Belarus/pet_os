use core::result::Iter;
use crate::memory::{Page, PageRec};

pub enum ZoneType {
    Usable,
    Device,
}

///The main purpose of this struct is to map available memory space to InfoRec
///Generaly is used to collect <code>PageRec</code> ― caller pass entries to this collection
pub struct MemoryMapper {
    //array of PageRec
}

///The sequence of free pages
///Simply, it's a header of pages
pub struct PageSequence {}

///Exactly this structure is used to achieve best performance case
///This additional data structure is constructed with linked list
pub struct PageLongSequence {
    lower_bound: usize,
    upper_bound: usize,
    table_offset: usize,
}

impl PageLongSequence {
    pub fn new(lower_bound: usize, upper_bound: usize, table_offset: usize) -> PageLongSequence {
        PageLongSequence {
            lower_bound,
            upper_bound,
            table_offset,
        }
    }
}

impl PageSequence {
    pub fn size(&self) -> usize {
        0
    }
}

impl Iterator for PageSequence {
    type Item = PageRec;
    //The sequence holds pivot to the next element in list
    fn next(&mut self) -> Option<Self::Item> {
        todo!()
    }
}

impl MemoryMapper {
    pub fn get_zone(zone: ZoneType) {}
}