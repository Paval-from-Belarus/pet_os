use core::ptr::NonNull;

use crate::{bitflags, declare_constants, list_node, tiny_list_node};
use crate::utils::{LinkedList, ListNode, PString, TinyListNode};
use crate::utils::atomics::SpinLock;
use crate::utils::time::Timestamp;

mod fat;
pub fn parse_path(path: PString) {

}
pub fn registry(file_system: *const FileSystemType) {}
declare_constants!(
    pub usize,
    MAX_FILE_NAME = 255, "The maximal length for file name";
);
tiny_list_node!(pub FileSystemType(node));
pub struct FileSystemType {
    name: PString,
    read_super: Option<fn(&SuperBlock)>,
    node: TinyListNode<FileSystemType>,
}
tiny_list_node!(pub SuperBlock(node));
pub struct SuperBlock {
    lock: SpinLock,
    files: LinkedList<'static, File>,
    mounts: LinkedList<'static, MountPoint>,
    node: TinyListNode<SuperBlock>,
    operations: NonNull<DriverOperations>,
}
pub enum NodeState {
    Locked,
}
///the i-node implementation
pub struct IndexNode {
    name: PString,
    permissions: FilePermissions,
    // type: u8,//file type?
    size: usize,
    change_time: Timestamp,
    access_time: Timestamp,
    modify_time: Timestamp,
    node_operations: NonNull<NodeOperations>,
    file_operations: NonNull<FileOperations>,
}

impl IndexNode {}
list_node!(pub File(node));
pub struct File {
    //the next offset to be read
    offset: usize,
    node: ListNode<File>,
    //copy of the IndexNode file operations
    operations: NonNull<FileOperations>,
    //the pointer to private data used, eg, by device driver
    data: *mut (),
}

list_node!(pub MountPoint(node));
pub struct MountPoint {
    node: ListNode<MountPoint>,
}

pub struct FileOperations {
    open: fn(&mut IndexNode, &mut File),
    close: fn(&mut IndexNode, &mut File),
    read: fn(&mut File, *mut u8, usize),
    write: fn(&mut File, *const u8, usize),
    flush: fn(&mut File),
    //consider additionally implement file_lock and mmap handler
}

pub struct NodeOperations {}

pub struct DriverOperations {}

///consider to implement prefix-tree
pub struct FileName([u8]);
bitflags!(
    pub FilePermissions(u8),
    EXECUTABLE = 0x01,
    WRITABLE = 0x02,
    READABLE = 0x04,
);