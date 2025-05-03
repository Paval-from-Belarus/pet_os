use alloc::{boxed::Box, sync::Arc};
use kernel_macro::ListNode;
use kernel_types::{
    collections::{BoxedNode, LinkedList, ListNode, TinyListNode},
    declare_constants,
    drivers::{DeviceId, DriverId},
};

use crate::{
    memory::{self, slab_alloc, SlabBox},
    object::{self, ObjectContainer},
    user::queue::Queue,
};

use super::{File, FileSystemKind, FsWork, IndexNode, MountPoint, Work};

declare_constants! {
    pub usize,
    MAX_FILE_SYSTEM_NAME = 32;
}

#[repr(C)]
pub struct SuperBlockOperations {
    pub create_node: fn(&mut SuperBlock) -> &mut IndexNode,
    //mark the node as dirty because its data was modified
    //this method also flush changes on the disk
    pub dirty_node: fn(&mut IndexNode),
    pub destroy_node: fn(&mut IndexNode),
}

#[derive(ListNode)]
pub struct FileSystemItem {
    #[list_pivots]
    node: ListNode<FileSystemItem>,
    fs: Arc<FileSystem>,
    pub id: usize,
    queue: Arc<object::Handle<Queue<FsWork>>>,
}

impl FileSystemItem {
    pub fn new(fs: FileSystem) -> Self {
        Self {
            queue: Arc::new(Queue::<FsWork>::new().unwrap()),
            node: ListNode::empty(),
            fs: Arc::new(fs),
            id: 0,
        }
    }

    pub fn fs(&self) -> Arc<FileSystem> {
        Arc::clone(&self.fs)
    }

    pub fn queue(&self) -> Arc<object::Handle<Queue<FsWork>>> {
        Arc::clone(&self.queue)
    }
}

/// user-space structure to register file system
pub struct FileSystem {
    pub name: heapless::String<MAX_FILE_SYSTEM_NAME>,
    pub kind: FileSystemKind,
    pub operations: SuperBlockOperations,
    //the limitation of file system about max file size
    pub max_file_size: Option<usize>,
    pub private: *mut (),
}

#[derive(ListNode)]
#[repr(C)]
pub struct SuperBlock {
    #[list_pivot]
    node: TinyListNode<SuperBlock>,
    //to find context to switch
    pub driver_id: DriverId,
    pub device_id: DeviceId,

    pub files: LinkedList<'static, File>,
    //mount points where fs for super block is placed
    pub mounts: LinkedList<'static, MountPoint>,
    //the size of elementary block in file system (for hard drive communication)
    //consider to add block_size_bits
    pub block_size: usize,
    pub file_system: Arc<FileSystem>,

    pub queue: Arc<object::Handle<Queue<FsWork>>>,
}

impl crate::memory::Slab for SuperBlock {
    const NAME: &str = "super_ops";
}

impl SuperBlock {
    pub fn new_boxed(
        file_system: Arc<FileSystem>,
        queue: Arc<object::Handle<Queue<FsWork>>>,
        device_id: u32,
        driver_id: u16,
    ) -> SlabBox<SuperBlock> {
        slab_alloc(SuperBlock {
            queue,
            node: TinyListNode::empty(),
            device_id: DeviceId(device_id),
            driver_id: DriverId::new(driver_id),
            file_system,

            files: LinkedList::empty(),
            mounts: LinkedList::empty(),
            block_size: 512,
        })
        .unwrap()
    }

    pub fn work(&self, work: Work) -> object::Handle<FsWork> {
        let queue = &self.queue;

        let work = FsWork::new_boxed(work, &queue);

        let handle = work.handle();

        let leaked = unsafe { &mut *Box::into_raw(work) };

        queue.push(leaked);

        handle
    }
}

impl BoxedNode for SuperBlock {
    type Target = SlabBox<SuperBlock>;

    fn into_boxed(
        node: &mut <SuperBlock as kernel_types::collections::TinyListNodeData>::Item,
    ) -> Self::Target {
        memory::into_boxed(node.into())
    }
}
