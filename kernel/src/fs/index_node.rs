use alloc::sync::Arc;
use kernel_macro::ListNode;
use kernel_types::{
    collections::{BoxedNode, ListNode},
    container_of,
};

use crate::{
    common::time::Timestamp,
    memory::{self, Slab, SlabBox},
    object::{self, Object, ObjectContainer},
};

use super::{Device, FilePermissions, NodeKind, SuperBlock};

pub struct IndexNodeBox {
    item: SlabBox<IndexNodeItem>,
}

#[derive(ListNode)]
#[repr(C)]
pub struct IndexNodeItem {
    #[list_pivots]
    node: ListNode<IndexNodeItem>,
    object: Object,
    pub lock: Arc<spin::RwLock<IndexNode>>,
}

impl Slab for IndexNodeItem {
    const NAME: &str = "index_node";
}

//the unique id of the node
pub type FileId = usize;

///the i-node implementation
#[repr(C)]
pub struct IndexNode {
    parent: Arc<spin::RwLock<SuperBlock>>,
    id: FileId,
    permissions: FilePermissions,
    // type: u8,//file type?
    size: usize,
    //block_count: usize,
    change_time: Timestamp,
    access_time: Timestamp,
    modify_time: Timestamp,
    // node_operations: NonNull<IndexNodeOperations>,
    // file_operations: Option<NonNull<FileOperations>>,
    //for block/chart file devices only
    kind: NodeKind,
    //where file is storing
    device: Device,
}

impl IndexNode {
    pub fn super_block<'a>(
        &'a self,
    ) -> impl core::ops::Deref<Target = SuperBlock> + 'a {
        self.parent.read()
    }

    pub fn id(&self) -> FileId {
        self.id
    }
}

impl IndexNodeBox {
    pub fn into_node(self) -> &'static mut ListNode<IndexNodeItem> {
        unsafe { &mut *SlabBox::into_raw(self.item) }.as_node()
    }
}

impl BoxedNode for IndexNodeItem {
    type Target = IndexNodeBox;

    fn into_boxed(node: &mut Self::Item) -> Self::Target {
        let item = memory::into_boxed(node.into());

        Self::Target { item }
    }
}

impl ObjectContainer for IndexNodeItem {
    const KIND: object::Kind = object::Kind::File;

    fn container_of(object: *mut Object) -> *mut Self {
        container_of!(object, IndexNodeItem, object)
    }

    fn object(&self) -> &Object {
        &self.object
    }

    fn object_mut(&mut self) -> &mut Object {
        &mut self.object
    }
}
