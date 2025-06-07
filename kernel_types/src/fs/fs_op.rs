use alloc::string::String;

use super::FileId;

pub enum FsOperation {
    Open {
        name: String,
    },
    Close {
        file: FileId,
    },
    Read {
        file: FileId,
        buffer: *mut u8,
        count: usize,
    },
    Write {
        file: FileId,
        buffer: *const u8,
        count: usize,
    },
}
