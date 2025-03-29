use core::ptr::NonNull;

use alloc::sync::Arc;
use kernel_macro::ListNode;
use kernel_types::collections::{BoxedNode, ListNode};

use crate::{common::time::Timestamp, memory::SlabBox};

use super::{
    Device, FileOperations, FilePermissions, FileRenameFlag, NodeType,
    SuperBlock,
};

#[repr(C)]
pub struct IndexNodeOperations {
    create_directory: fn(&mut IndexNode),
    remove_directory: fn(&mut IndexNode),
    rename: fn(&mut IndexNode, &mut IndexNode, FileRenameFlag),
    check_permissions: fn(&mut IndexNode) -> bool,
    truncate: fn(&mut IndexNode, size: usize),
}

pub struct IndexNodeBox {
    item: SlabBox<IndexNodeItem>,
}

#[derive(ListNode)]
#[repr(C)]
pub struct IndexNodeItem {
    #[list_pivots]
    node: ListNode<IndexNodeItem>,
    pub lock: Arc<spin::RwLock<IndexNode>>,
}

///the i-node implementation
#[repr(C)]
pub struct IndexNode {
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

impl IndexNodeBox {
    pub fn into_node(self) -> &'static mut ListNode<IndexNodeItem> {
        unsafe { &mut *SlabBox::into_raw(self.item) }.as_node()
    }
}

impl BoxedNode for IndexNodeItem {
    type Target = IndexNodeBox;

    fn into_boxed(node: &mut Self::Item) -> Self::Target {
        let item = unsafe { SlabBox::from_raw_in(node, crate::memory::Kernel) };

        Self::Target { item }
    }
}

impl IndexNode {}
