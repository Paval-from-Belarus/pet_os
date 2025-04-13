use core::cell::UnsafeCell;

use core::ptr;
use core::ptr::NonNull;
use core::sync::atomic::AtomicUsize;

pub use file::*;
pub use index_node::*;
pub use super_block::*;

use kernel_macro::ListNode;
use kernel_types::collections::ListNode;
use kernel_types::collections::{HashData, HashTable};
use kernel_types::drivers::Device;
use kernel_types::string::{MutString, QuickString};
use kernel_types::{bitflags, declare_constants};

use crate::common::atomics::{SpinLock, UnsafeLazyCell};
use crate::common::SpinBox;
use crate::drivers::{self, BlockDeviceBox, CharDeviceBox};

mod fat;
mod file;
mod index_node;
mod super_block;

pub fn parse_path(_path: MutString) {}

declare_constants!(
    pub usize,
    MAX_FILE_NAME_LEN = 255, "The maximal length for file name";
    MAX_FILES_COUNT = 15, "The count of files for process";
);

bitflags::bitflags! {
    pub struct FileSystemKind: usize {
        const READ_ONLY = 0b01;
    }
}

pub enum NodeState {
    Locked,
}

pub enum DeviceKind {
    BlockDevice(BlockDeviceBox),
    CharDevice(CharDeviceBox),
}

bitflags! {
    pub NodeKind(usize),
    FILE = 0x1,
    BLOCK = 0x2,
    CHAR = 0x4
}

pub fn file_read(_handle: usize) -> Result<(), ()> {
    todo!()
}

pub fn file_write(_handle: usize) -> Result<(), ()> {
    todo!()
}

pub fn file_move(_source: &str, _target: &str) -> Result<(), ()> {
    todo!()
}

pub fn file_open(_path: &str) -> Result<usize, ()> {
    todo!()
}

pub fn file_close(_handle: usize) -> Result<(), ()> {
    todo!()
}

#[derive(ListNode)]
#[repr(C)]
///alternative struct to linux `dentry`
pub struct PathNode {
    #[list_pivots]
    node: ListNode<PathNode>,
    file_system: NonNull<MountPoint>,
    //linux also support ptr::null for invalid file names
    inode: NonNull<IndexNode>,
    name: QuickString<'static>,
    #[doc = "The parent of corresponding inode"]
    parent: NonNull<IndexNode>,
    use_count: AtomicUsize,
}

impl PathNode {
    pub fn is_parent(&self, other_parent: &IndexNode) -> bool {
        ptr::eq(self.parent.as_ptr(), other_parent)
    }
    pub fn is_root(&self) -> bool {
        ptr::eq(self.parent.as_ptr(), self.inode.as_ptr())
    }
}

impl PartialEq<IndexNode> for PathNode {
    fn eq(&self, other: &IndexNode) -> bool {
        ptr::eq(self.inode.as_ptr(), other)
    }
}

struct SearchResult {
    path: NonNull<PathNode>,
    name: QuickString<'static>,
}

pub fn file_name_lookup(path: &str, mount_point: &mut MountPoint) {
    let path_iter = resolve_wildcards(path)
        .split('/')
        .filter(|path| !path.is_empty())
        .map(QuickString::from);
    let _fs = mount_point.fs();
    let mut table = PATH_TABLE.get().table();
    let parent_inode_option = Option::<&IndexNode>::None;
    for path in path_iter {
        let _found_node = table.find(&path, |node| -> bool {
            parent_inode_option
                .map(|parent| node.is_parent(parent))
                //the node should be in root it no parent
                .unwrap_or_else(|| node.is_root())
        });
        // }).unwrap_or_else(|| fs.)
    }
}

fn resolve_wildcards(path: &str) -> &str {
    //todo: really check wildcards
    path
}

impl HashData for PathNode {
    type Item<'a> = QuickString<'a>;

    fn key<'a>(&self) -> &QuickString<'a> {
        &self.name
    }
}

declare_constants! {
    pub usize,
    HASHTABLE_CAPACITY = 500
}
pub type PathNodeHashTable = HashTable<'static, PathNode, HASHTABLE_CAPACITY>;

pub struct FilePathHashTable {
    table: UnsafeCell<PathNodeHashTable>,
    lock: SpinLock,
}

unsafe impl Sync for FilePathHashTable {}

impl FilePathHashTable {
    pub fn table(&self) -> SpinBox<PathNodeHashTable> {
        let table = unsafe { &mut *self.table.get() };
        SpinBox::new(&self.lock, table)
    }
}

static PATH_TABLE: UnsafeLazyCell<FilePathHashTable> = UnsafeLazyCell::empty();

pub fn init() {
    let _ = drivers::fs();
}

#[derive(ListNode)]
#[repr(C)]
pub struct MountPoint {
    #[list_pivots]
    node: ListNode<MountPoint>,
    lock: SpinLock,
    mounted_fs: NonNull<SuperBlock>,
    mounted_root: NonNull<PathNode>,
    parent_child: NonNull<PathNode>,
    parent_mount: Option<NonNull<MountPoint>>,
    //the vfs' root doesn't have parent
    //child_mounts: LinkedList<'static, MountPoint>,
    //each mount_point is storing in HashTable
    //hash_node: TinyListNode<HashedMountPoint>,
    mount_count: AtomicUsize,
    device_name: &'static str,
}

impl MountPoint {
    pub fn fs(&mut self) -> SpinBox<SuperBlock> {
        // let fs = unsafe { self.parent_fs.as_mut() };
        // SpinBox::new(&self.lock, fs)
        todo!()
    }
    pub fn root(&mut self) -> SpinBox<MountPoint> {
        // let root = unsafe { self.root.as_mut() };
        // SpinBox::new(&self.lock, )
        todo!()
    }
}

#[repr(C)]
pub struct FileOperations {
    pub open: fn(&mut IndexNode, &mut File),
    pub flush: fn(&mut File),
    pub close: fn(&mut IndexNode, &mut File),
    pub read: fn(&mut File, *mut u8, usize),
    pub write: fn(&mut File, *const u8, usize),
    pub seek: fn(&mut File, mode: FileSeekMode, offset: usize),
    #[doc = "for devices only"]
    pub ioctl: fn(&mut IndexNode, &mut File, usize),
    //consider additionally implement file_lock and mmap handler
}

bitflags! {
    pub FileRenameFlag(usize),
    //if target is exist then no replacement can occurred
    NO_REPLACE = 0b01,
    //both files should exist; swap files by places
    EXCHANGE = 0b10
}

#[cfg(test)]
mod tests {
    extern crate alloc;
    extern crate std;

    #[test]
    pub fn test() {}
}
