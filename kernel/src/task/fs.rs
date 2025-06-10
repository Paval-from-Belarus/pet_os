#![allow(unused)]

use crate::{
    fs::{File, IndexNode, MAX_FILES_COUNT},
    object::Handle,
};

#[derive(Default)]
#[repr(C)]
pub struct FilePool {
    opened_files_count: usize,
    //the next index of file
    next_index: usize,
    files: [Option<Handle<IndexNode>>; MAX_FILES_COUNT],
}

impl FilePool {
    pub fn get(&self, index: usize) -> Option<Handle<IndexNode>> {
        self.files[index].clone()
    }

    pub fn set(&mut self, index: usize, handle: Handle<IndexNode>) {
        self.files[index] = handle.into()
    }

    pub fn alloc_index(&mut self) -> Option<usize> {
        (self.next_index < self.files.len()).then(|| {
            let index = self.next_index;

            self.next_index += 1;

            index
        })
    }
}
