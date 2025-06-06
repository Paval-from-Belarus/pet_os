use core::{ptr::NonNull, sync::atomic::AtomicUsize};

use kernel_types::{bitflags, collections::ListNode, fs::FileOperations};

use crate::memory::Slab;

use super::{MountPoint, PathNode};

bitflags::bitflags! {
    pub struct FileRenameFlag: u8 {
        //if target is exist then no replacement can occurred
        const NO_REPLACE = 0b01;
        //both files should exist; swap files by places
        const EXCHANGE = 0b10;
    }
}

///consider to implement prefix-tree
pub struct FileName([u8]);

bitflags! {
    pub FilePermissions(u8),
    EXECUTABLE = 0x01,
    WRITABLE = 0x02,
    READABLE = 0x04,
}

bitflags::bitflags! {
    #[derive(PartialEq, Eq, Clone, Copy)]
    pub struct FileAccessMode: u8 {
        const READ = 0x01;
        const WRITE = 0x02;
    }
}

bitflags! {
    pub FileSeekMode(u8),
    CURRENT = 0x1,
    START = 0x2,
    END = 0x4
}

bitflags::bitflags! {
    #[derive(PartialEq, Eq, Clone, Copy)]
    pub struct FileOpenMode: u8 {
        const READ = 0x1;
        const WRITE = 0x2;
        const CREATE = 0x4;
        const APPEND = 0x8 | FileOpenMode::WRITE.bits();
        const TRUNC = 0x10;
    }
}

impl FileOpenMode {
    pub fn is_accessible(&self, mode: FileAccessMode) -> bool {
        if mode == FileAccessMode::READ {
            return !self.contains(FileOpenMode::WRITE);
        }

        if mode == FileAccessMode::WRITE {
            return self.contains(FileOpenMode::WRITE);
        }

        false
    }
}

//IndexNode has no state (as class)
//Whereas file is an implementation of this class
#[derive(kernel_macro::ListNode)]
#[repr(C)]
pub struct File {
    file_system: NonNull<MountPoint>,
    path: PathNode,
    //the next offset to be read
    pub offset: usize,
    pub mode: FileOpenMode,
    #[list_pivots]
    node: ListNode<File>,
    //copy of the IndexNode file operations
    operations: NonNull<FileOperations>,
    //the pointer to private data used, eg, by device driver
    data: *mut (),
    use_count: AtomicUsize,
}
