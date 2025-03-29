use core::{ptr::NonNull, sync::atomic::AtomicUsize};

use kernel_types::{bitflags, collections::ListNode};

use super::{FileOperations, MountPoint, PathNode};

///consider to implement prefix-tree
pub struct FileName([u8]);

bitflags! {
    pub FilePermissions(u8),
    EXECUTABLE = 0x01,
    WRITABLE = 0x02,
    READABLE = 0x04,
}
bitflags! {
    pub FileAccessMode(u8),
    READ = 0x01,
    WRITE = 0x02
}

bitflags! {
    pub FileSeekMode(u8),
    CURRENT = 0x1,
    START = 0x2,
    END = 0x4
}

bitflags! {
    pub FileOpenMode(u8),
    READ = 0x1,
    WRITE = 0x2,
    CREATE = 0x4,
    APPEND = 0x8 | FileOpenMode::WRITE,
    TRUNC = 0x10
}

impl FileOpenMode {
    pub fn is_accessible(&self, mode: FileAccessMode) -> bool {
        match mode.bits() {
            FileAccessMode::READ => !self.test_with(FileOpenMode::WRITE),
            FileAccessMode::WRITE => self.test_with(FileOpenMode::WRITE),
            _ => panic!("Unknown access mode"),
        }
    }
}

#[derive(kernel_macro::ListNode)]
#[repr(C)]
pub struct File {
    file_system: NonNull<MountPoint>,
    path: PathNode,
    //the next offset to be read
    offset: usize,
    mode: FileOpenMode,
    #[list_pivots]
    node: ListNode<File>,
    //copy of the IndexNode file operations
    operations: NonNull<FileOperations>,
    //the pointer to private data used, eg, by device driver
    data: *mut (),
    use_count: AtomicUsize,
}
