use alloc::{boxed::Box, sync::Arc};
use kernel_macro::ListNode;
use kernel_types::{
    collections::{BoxedNode, LinkedList, ListNode},
    drivers::{DeviceId, DriverId},
    fs::{FileLookupRequest, FileRequest, FileSystem, SuperBlockInfo},
};

use crate::{
    fs,
    memory::{self, slab_alloc, AllocError, SlabBox},
    object::{self, Object, ObjectContainer},
    user::queue::Queue,
};

use super::{File, FileLookupWork, FileWork, FsRequest, FsWork, MountPoint};

#[derive(ListNode)]
pub struct FileSystemItem {
    #[list_pivots]
    node: ListNode<FileSystemItem>,
    fs: Arc<FileSystem>,
    pub id: usize,
    pub queue: object::Handle<Queue<FsWork>>,
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

    pub fn send_request(
        &self,
        request: FsRequest,
    ) -> fs::Result<object::Handle<FsWork>> {
        let work = FsWork::new_boxed(request, &self.queue)?;

        let handle = work.handle();

        self.queue.push(work);

        Ok(handle)
    }
}

#[derive(ListNode)]
#[repr(C)]
pub struct SuperBlock {
    #[list_pivots]
    node: ListNode<SuperBlock>,

    pub files: LinkedList<'static, File>,
    pub block_size: usize,

    pub queue: object::Handle<Queue<FileLookupWork>>,
}

impl crate::memory::Slab for SuperBlock {
    const NAME: &str = "super_ops";
}

impl SuperBlock {
    pub fn new_boxed(
        info: SuperBlockInfo,
    ) -> Result<SlabBox<SuperBlock>, AllocError> {
        let queue = Queue::new_bounded(info.queue_size)?;

        slab_alloc(SuperBlock {
            queue,
            block_size: info.block_size,
            node: ListNode::empty(),

            files: LinkedList::empty(),
        })
    }

    pub fn work(
        &self,
        work: FileLookupRequest,
    ) -> fs::Result<object::Handle<FileLookupWork>> {
        let work = FileLookupWork::new_boxed(work, &self.queue)?;

        let handle = work.handle();

        self.queue.push(work);

        Ok(handle)
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
