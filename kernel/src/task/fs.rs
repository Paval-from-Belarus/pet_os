#![allow(unused)]

use crate::fs::{File, IndexNode, MAX_FILES_COUNT};

#[derive(Default)]
#[repr(C)]
pub struct FilePool {
    opened_files_count: usize,
    //the next index of file
    next_index: Option<usize>,
    files: [Option<File>; MAX_FILES_COUNT],
}

impl FilePool {
    pub fn get(&self, index: usize) -> Option<&'static IndexNode> {
        todo!()
    }
}
