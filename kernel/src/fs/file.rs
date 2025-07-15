use core::{ptr::NonNull, sync::atomic::AtomicUsize};

use kernel_types::{bitflags, collections::ListNode};

use crate::{
    memory::Slab,
    object::{self, Object, ObjectContainer},
};

use super::{MountPoint, PathNode};

pub use kernel_types::fs::FilePermissions;

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
    data: *mut (),
    use_count: AtomicUsize,
    object: Object,
}

impl Slab for File {
    const NAME: &str = "file";
}
