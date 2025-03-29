use crate::fs::File;

use super::MAX_FILES_COUNT;

#[allow(unused)]
pub struct FilePool {
    opened_files_count: usize,
    //the next index of file
    next_index: Option<usize>,
    files: [Option<File>; MAX_FILES_COUNT],
}
