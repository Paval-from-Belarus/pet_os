use alloc::{boxed::Box, sync::Arc};
use kernel_macro::ListNode;
use kernel_types::{
    collections::{BoxedNode, LinkedList, ListNode},
    drivers::{DeviceId, DriverId},
    fs::{
        FileLookupRequest, FileRequest, FileSystem, FsId, IndexNodeInfo,
        SuperBlockInfo,
    },
};

use crate::{
    fs, impl_container,
    memory::{self, slab_alloc, AllocError, Slab, SlabBox},
    object::{self, alloc_root_object, Handle, Object, ObjectContainer},
    user::queue::Queue,
};

use super::{
    File, FileLookupWork, FileWork, FsRequest, FsWork, IndexNode, MountPoint,
};

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

#[repr(C)]
pub struct SuperBlock {
    pub files: spin::Mutex<LinkedList<'static, Object>>,
    pub block_size: usize,

    pub queue: object::Handle<Queue<FileLookupWork>>,
    object: Object,
}

impl SuperBlock {
    pub fn new(info: SuperBlockInfo) -> Result<Handle<SuperBlock>, AllocError> {
        let queue = Queue::new_bounded(info.queue_size)?;

        alloc_root_object(Self {
            queue,
            block_size: info.block_size,
            files: spin::Mutex::new(LinkedList::empty()),
            object: Self::new_root_object(),
        })
    }

    pub fn send_request(
        &self,
        req: FileLookupRequest,
    ) -> fs::Result<Handle<FileLookupWork>> {
        let sb_handle = self.handle();

        let work = FileLookupWork::new_boxed(req, &self.queue, sb_handle)?;

        let handle = work.handle();

        self.queue.push(work);

        Ok(handle)
    }

    pub fn resolve(
        &self,
        inode: IndexNodeInfo,
    ) -> fs::Result<Handle<IndexNode>> {
        let inode = IndexNode::new(inode, &self.handle())?;

        let handle = inode.handle();

        let inode = unsafe { &mut *SlabBox::into_raw(inode) };

        self.files
            .try_lock()
            .unwrap()
            .push_front(inode.object_mut());

        Ok(handle)
    }
}

impl_container! {
    SuperBlock,
    obj_kind: SuperBlock,
    slab: "super_block"
}
