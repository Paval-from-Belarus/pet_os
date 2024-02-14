use core::cell::UnsafeCell;
use core::hash::Hash;
use core::ptr;
use core::ptr::NonNull;
use core::sync::atomic::AtomicUsize;

use fallible_collections::{FallibleVec, TryCollect};
use num_enum::FromPrimitive;

use kernel_macro::ListNode;
use kernel_types::{bitflags, declare_constants};
use kernel_types::collections::{HashKey, LinkedList, ListNode, TinyListNode};
use kernel_types::collections::{HashData, HashTable};
use kernel_types::drivers::{Device};
use kernel_types::string::{MutString, QuickString};

use crate::drivers::{BlockDevice, CharDevice};
use crate::utils::atomics::{SpinLock, UnsafeLazyCell};
use crate::utils::SpinBox;
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
#[repr(C)]
pub struct FileSystemType {
    name: &'static str,
    read_super: Option<fn(&SuperBlock)>,
    #[list_pivot]
    node: TinyListNode<FileSystemType>,
    status: FileSystemStatus,
}

#[derive(ListNode)]
#[repr(C)]
pub struct SuperBlock {
    lock: SpinLock,
    files: LinkedList<'static, File>,
    mounts: LinkedList<'static, MountPoint>,
    #[list_pivot]
    node: TinyListNode<SuperBlock>,
    //the size of elementary block in file system (for hard drive communication)
    //consider to add block_size_bits
    block_size: usize,
    //the limitation of file system about max file size
    max_file_size: usize,
    system_type: &'static FileSystemType,
    operations: NonNull<SuperBlockOperations>,
    device: Device,
    private: *mut (),
}


impl SuperBlock {}

pub enum NodeState {
    Locked,
}

pub struct SuperBlockChild;

pub struct DeviceChild;

///the i-node implementation
#[derive(ListNode)]
#[repr(C)]
pub struct IndexNode {
    #[list_pivots]
    super_child: ListNode<SuperBlockChild>,
    #[list_pivots]
    device_child: ListNode<DeviceChild>,
    parent: NonNull<SuperBlock>,
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
    //for block/chart file devices only
    device_ty: NodeType,
    device: Device,
    // real_device: Option<RealDevice>,
}

union RealDevice {
    block: NonNull<BlockDevice>,
    char: NonNull<CharDevice>,
}
bitflags! {
    pub NodeType(usize),
    FILE = 0x1,
    BLOCK = 0x2,
    CHAR = 0x4
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

#[derive(ListNode)]
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

pub fn file_name_lookup(path: &str, mut mount_point: &mut MountPoint) {
    let path_iter = resolve_wildcards(path)
        .split('/')
        .filter(|path| !path.is_empty())
        .map(QuickString::from);
    let fs = mount_point.fs();
    let mut table = PATH_TABLE.get().table();
    let mut parent_inode_option = Option::<&IndexNode>::None;
    for path in path_iter {
        let found_node = table.find(&path, |node| -> bool {
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
    todo!()
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
    open: fn(&mut IndexNode, &mut File),
    flush: fn(&mut File),
    close: fn(&mut IndexNode, &mut File),
    read: fn(&mut File, *mut u8, usize),
    write: fn(&mut File, *const u8, usize),
    seek: fn(&mut File, mode: FileSeekMode, offset: usize),
    #[doc = "for devices only"]
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
    rename: fn(&mut IndexNode, &mut IndexNode, FileRenameFlag),
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
