#![allow(unused)]
use core::ops::Range;

use elf::segment;
use kernel_types::collections::{BorrowingLinkedList, LinkedList};

use crate::memory::{
    self, physical_alloc, AllocError, DirEntry, MemoryMappingFlag,
    MemoryMappingRegion, MemoryRegion, MemoryRegionFlag, Page, PageDirectory,
    PageMarker, ProcessState, ToPhysicalAddress, VirtualAddress,
    DIRECTORY_ENTRIES_COUNT, DIRECTORY_PAGES_COUNT,
};

pub struct Segments {
    pub code_start: VirtualAddress,
    pub data_start: VirtualAddress,

    //heap has no size
    //only initial pivot
    pub heap_start: VirtualAddress,

    pub initial_heap_size: usize,

    pub stack_top: VirtualAddress,

    pub entry_point: VirtualAddress,
}

impl Segments {
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
        self.heap_start..(self.heap_start + self.initial_heap_size)
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
        self.initial_heap_size
    }

    pub fn entry_point(&self) -> VirtualAddress {
        self.entry_point
    }
}

pub fn load(segments: Segments) -> Result<ProcessState, AllocError> {
    //all segments are page aligned
    assert!((segments.data_start - segments.code_start) % Page::SIZE == 0);

    let Some(id) = memory::new_proccess_id() else {
        return Err(AllocError::NoMemory);
    };

    let mut marker = memory::new_page_marker().unwrap();

    let code_pages = memory::physical_alloc(segments.code_size()).unwrap();

    let mut code_offset = segments.code_range().start;
    for page in code_pages.iter() {
        marker
            .map_user_range(&MemoryMappingRegion {
                flags: MemoryMappingFlag::USER_CODE,
                virtual_offset: code_offset,
                physical_offset: page.as_physical(),
                page_count: code_pages.len(),
                ..Default::default()
            })
            .expect("Failed to commit user code");

        code_offset += Page::SIZE;
    }

    let data_pages = memory::physical_alloc(segments.data_size()).unwrap();

    let mut data_offset = segments.data_range().start;
    for page in data_pages.iter() {
        marker
            .map_user_range(&MemoryMappingRegion {
                flags: MemoryMappingFlag::USER_DATA,
                virtual_offset: data_offset,
                physical_offset: page.as_physical(),
                page_count: data_pages.len(),
                ..Default::default()
            })
            .expect("Failed to commit user data");

        data_offset += Page::SIZE;
    }

    let heap_pages = memory::physical_alloc(segments.heap_size()).unwrap();

    let mut heap_offset = segments.heap_range().start;
    for page in heap_pages.iter() {
        marker
            .map_user_range(&MemoryMappingRegion {
                flags: MemoryMappingFlag::USER_DATA,
                virtual_offset: data_offset,
                physical_offset: page.as_physical(),
                page_count: data_pages.len(),
                ..Default::default()
            })
            .expect("Failed to commit user data");

        heap_offset += Page::SIZE;
    }

    let stack_pages = memory::physical_alloc(segments.stack_size()).unwrap();

    let mut stack_offset = segments.stack_range().start;
    for page in stack_pages.iter() {
        marker
            .map_user_range(&MemoryMappingRegion {
                flags: MemoryMappingFlag::USER_DATA,
                virtual_offset: data_offset,
                physical_offset: page.as_physical(),
                page_count: data_pages.len(),
                ..Default::default()
            })
            .expect("Failed to commit user data");

        stack_offset += Page::SIZE;
    }

    //todo: add kernel mapping

    todo!()
    //questions:
    //1. all structures are available in kernel space?
    //чтобы переключить

    //steps:
    //1. initialize page directory
    //2. map kernel space to upper bounds
    //3. initialize user space with segments
}
