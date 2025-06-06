use alloc::{boxed::Box, sync::Arc};
use kernel_macro::ListNode;
use kernel_types::{
    collections::{BoxedNode, LinkedList, ListNode},
    drivers::{DeviceId, DriverId},
    fs::FileSystem,
};

use crate::{
    memory::{self, slab_alloc, SlabBox},
    object::{self, ObjectContainer},
    user::queue::Queue,
};

use super::{File, FsWork, MountPoint, FsOperation};

#[derive(ListNode)]
pub struct FileSystemItem {
    #[list_pivots]
    node: ListNode<FileSystemItem>,
    fs: Arc<FileSystem>,
    pub id: usize,
    queue: object::Handle<Queue<FsWork>>,
}

impl FileSystemItem {
    pub fn new(fs: FileSystem) -> Self {
        Self {
            queue: Queue::<FsWork>::new_unbounded().unwrap(),
            node: ListNode::empty(),
            fs: Arc::new(fs),
            id: 0,
        }
    }

    pub fn fs(&self) -> Arc<FileSystem> {
        Arc::clone(&self.fs)
    }

    pub fn queue(&self) -> object::Handle<Queue<FsWork>> {
        self.queue.clone()
    }
}

#[derive(ListNode)]
#[repr(C)]
pub struct SuperBlock {
    #[list_pivots]
    node: ListNode<SuperBlock>,
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

    pub queue: object::Handle<Queue<FsWork>>,
}

impl crate::memory::Slab for SuperBlock {
    const NAME: &str = "super_ops";
}

impl SuperBlock {
    pub fn new_boxed(
        file_system: Arc<FileSystem>,
        queue: object::Handle<Queue<FsWork>>,
        device_id: u32,
        driver_id: u16,
    ) -> SlabBox<SuperBlock> {
        slab_alloc(SuperBlock {
            queue,
            node: ListNode::empty(),
            device_id: DeviceId(device_id),
            driver_id: DriverId::new(driver_id),
            file_system,

            files: LinkedList::empty(),
            mounts: LinkedList::empty(),
            block_size: 512,
        })
        .unwrap()
    }

    pub fn work(&self, work: FsOperation) -> object::Handle<FsWork> {
        let queue = &self.queue;

        let work = FsWork::new_boxed(work, queue);

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
