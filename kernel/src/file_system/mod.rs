use alloc::vec::Vec;
use core::cell::UnsafeCell;
use core::ptr::NonNull;
use core::sync::atomic::AtomicUsize;

use fallible_collections::{FallibleVec, TryCollect};
use num_enum::FromPrimitive;
use kernel_macro::ListNode;

use kernel_types::drivers::Device;

use crate::{bitflags, declare_constants, list_node, tiny_list_node};
use crate::utils::{HashData, HashTable, LinkedList, ListNode, MutString, QuickString, TinyListNode};
use crate::utils::atomics::SpinLock;
use crate::utils::time::Timestamp;

mod fat;

pub fn parse_path(path: MutString) {}

pub fn registry(file_system: *const FileSystemType) {}
declare_constants!(
    pub usize,
    MAX_FILE_NAME = 255, "The maximal length for file name";
    MAX_FILES_COUNT = 15, "The count of files for process";
);
bitflags! {
    pub FileSystemStatus(usize),
    READ_ONLY = 0b01,
}
///Immutable object holding information about file system
#[derive(ListNode)]
pub struct FileSystemType {
    name: &'static str,
    read_super: Option<fn(&SuperBlock)>,
    #[list_pivot(())]
    node: TinyListNode<FileSystemType>,
    status: FileSystemStatus,
}
tiny_list_node!(pub SuperBlock(node));
pub struct SuperBlock {
    lock: SpinLock,
    files: LinkedList<'static, File>,
    mounts: LinkedList<'static, MountPoint>,
    node: TinyListNode<SuperBlock>,
    //the size of elementary block in file system (for hard drive communication)
    //consider to add block_size_bits
    block_size: usize,
    //the limitation of file system about max file size
    max_file_size: usize,
    system_type: &'static FileSystemType,
    operations: NonNull<SuperBlockOperations>,
    device: NonNull<Device>,
    private: *mut (),
}

pub enum NodeState {
    Locked,
}

///the i-node implementation
pub struct IndexNode {
    //the unique id of the node
    id: usize,
    permissions: FilePermissions,
    // type: u8,//file type?
    size: usize,
    //block_count: usize,
    change_time: Timestamp,
    access_time: Timestamp,
    modify_time: Timestamp,
    node_operations: NonNull<IndexNodeOperations>,
    file_operations: Option<NonNull<FileOperations>>,
}


pub fn file_read(handle: usize) -> Result<(), ()> {
    todo!()
}

pub fn file_write(handle: usize) -> Result<(), ()> {
    todo!()
}

pub fn file_move(source: &str, target: &str) -> Result<(), ()> {
    todo!()
}

pub fn file_open(path: &str) -> Result<usize, ()> {
    todo!()
}

pub fn file_close(handle: usize) -> Result<(), ()> {
    todo!()
}

impl IndexNode {}

list_node!(pub File(node));
pub struct File {
    file_system: NonNull<MountPoint>,
    path: PathNode,
    //the next offset to be read
    offset: usize,
    mode: FileOpenMode,
    node: ListNode<File>,
    //copy of the IndexNode file operations
    operations: NonNull<FileOperations>,
    //the pointer to private data used, eg, by device driver
    data: *mut (),
    use_count: AtomicUsize,
}
list_node! {
    pub PathNode(node)
}
///alternative struct to linux `dentry`
pub struct PathNode {
    node: ListNode<PathNode>,
    file_system: NonNull<MountPoint>,
    //linux also support ptr::null for invalid file names
    inode: NonNull<IndexNode>,
    name: QuickString<'static>,
    parent: NonNull<IndexNode>,
    use_count: AtomicUsize,
}

struct SearchResult {
    path: NonNull<PathNode>,
    name: QuickString<'static>,

}

pub fn file_name_lookup(name: &str) {
    let pieces = name.split('/')
                     .filter(|path| !path.is_empty())
                     .map(QuickString::from)
                     .try_collect::<Vec<QuickString>>().unwrap();
}

impl HashData<QuickString<'static>> for PathNode {
    fn key(&self) -> &QuickString<'static> {
        &self.name
    }
}
declare_constants! {
    pub usize,
    HASHTABLE_CAPACITY = 500
}
pub struct FilePathHashTable {
    table: UnsafeCell<HashTable<'static, QuickString<'static>, PathNode, HASHTABLE_CAPACITY>>,
}

list_node!(pub MountPoint(node));
pub struct MountPoint {
    node: ListNode<MountPoint>,
    parent: NonNull<SuperBlock>,
    device_name: &'static str,
    mount_count: AtomicUsize,
}

#[repr(C)]
pub struct FileOperations {
    open: fn(&mut IndexNode, &mut File),
    flush: fn(&mut File),
    close: fn(&mut IndexNode, &mut File),
    read: fn(&mut File, *mut u8, usize),
    write: fn(&mut File, *const u8, usize),
    seek: fn(&mut File, mode: FileSeekMode, offset: usize),
    ioctl: fn(&mut IndexNode, &mut File, usize),
    //consider additionally implement file_lock and mmap handler
}
bitflags! {
    pub FileRenameFlag(usize),
    //if target is exist then no replacement can occurred
    NO_REPLACE = 0b01,
    //both files should exist; swap files by places
    EXCHANGE = 0b10
}
#[repr(C)]
pub struct IndexNodeOperations {
    create_directory: fn(&mut IndexNode),
    remove_directory: fn(&mut IndexNode),
    rename: fn(&mut IndexNode, &mut IndexNode, flags: FileRenameFlag),
    check_permissions: fn(&mut IndexNode) -> bool,
    truncate: fn(&mut IndexNode, size: usize),
}

#[repr(C)]
pub struct SuperBlockOperations {
    create_node: fn(&mut SuperBlock) -> &mut IndexNode,
    //mark the node as dirty because its data was modified
    //this method also flush changes on the disk
    dirty_node: fn(&mut IndexNode),
    destroy_node: fn(&mut IndexNode),
}

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
            FileAccessMode::READ => { !self.test_with(FileOpenMode::WRITE) }
            FileAccessMode::WRITE => { self.test_with(FileOpenMode::WRITE) }
            _ => panic!("Unknown access mode")
        }
    }
}
bitflags! {
    pub FileSeekMode(u8),
    CURRENT = 0x1,
    START = 0x2,
    END = 0x4
}
#[cfg(test)]
mod tests {
    extern crate std;
    extern crate alloc;

    #[test]
    pub fn test() {}
}
