use alloc::sync::Arc;
use kernel_macro::ListNode;
use kernel_types::{
    collections::{BoxedNode, ListNode},
    container_of,
    fs::{FileRequest, IndexNodeInfo, NodeId, NodeKind},
};

use crate::{
    common::time::Timestamp,
    impl_container,
    memory::{self, AllocError, Slab, SlabBox},
    object::{self, Handle, Object, ObjectContainer},
    user::queue::Queue,
};

use crate::fs;

use super::{Device, FilePermissions, FileWork, SuperBlock};

///the i-node implementation
#[repr(C)]
pub struct IndexNode {
    pub id: NodeId,
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
    queue: Handle<Queue<FileWork>>,

    object: Object,
}

impl IndexNode {
    pub fn new(
        inode: IndexNodeInfo,
        parent: &Handle<SuperBlock>,
    ) -> Result<SlabBox<IndexNode>, AllocError> {
        let IndexNodeInfo {
            queue_size,
            id,
            size,
            kind,
            permissions,
        } = inode;

        let queue = Queue::new_bounded(inode.queue_size)?;
        let object = Self::new_object(parent);

        crate::memory::slab_alloc(Self {
            id,
            size,
            kind,
            device: Device::new(0, 0),
            permissions,

            access_time: Default::default(),
            change_time: Default::default(),
            modify_time: Default::default(),

            queue,
            object,
        })
    }

    pub fn send_request(
        &self,
        req: FileRequest,
    ) -> fs::Result<Handle<FileWork>> {
        let work = unsafe { FileWork::new_boxed(req, &self.queue)? };

        let handle = self.queue.push(work);

        Ok(handle)
    }
}

impl_container! {
    IndexNode,
    obj_kind: File,
    slab: "inode"
}
