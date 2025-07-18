use alloc::{boxed::Box, string::ToString};
use elf::hash;
use kernel_macro::ListNode;
use kernel_types::{
    collections::{BoxedNode, ListNode},
    fs::{FileLookupRequest, SuperBlockInfo},
};

use crate::{
    common::atomics::SpinLock,
    memory::{AllocError, Slab, SlabBox},
    object::{Handle, Object, ObjectContainer},
    user::queue::Queue,
};

use super::{File, FileLookupWork, FileSystemItem, Result, SuperBlock};

pub struct MountPointBox {
    mount_point: SlabBox<MountPoint>,
}

impl core::ops::Deref for MountPointBox {
    type Target = MountPoint;

    fn deref(&self) -> &Self::Target {
        &self.mount_point
    }
}

#[derive(ListNode)]
#[repr(C)]
pub struct MountPoint {
    #[list_pivots]
    node: ListNode<MountPoint>,

    path_node: alloc::string::String,
    sb: Handle<SuperBlock>,
    // parent_mount: Option<NonNull<MountPoint>>,
    // //the vfs' root doesn't have parent
    // //child_mounts: LinkedList<'static, MountPoint>,
    // //each mount_point is storing in HashTable
    // //hash_node: TinyListNode<HashedMountPoint>,
    // mount_count: AtomicUsize,
    // device_name: &'static str,
}

unsafe impl Send for MountPoint {}
unsafe impl Sync for MountPoint {}

impl MountPoint {
    pub fn new_boxed(
        sb_info: SuperBlockInfo,
        mount_point: &str,
    ) -> Result<MountPointBox> {
        let super_block = SuperBlock::new(sb_info)?;

        let mount_point = crate::memory::slab_alloc(Self {
            sb: super_block,
            path_node: mount_point.to_string(),
            node: ListNode::empty(),
        })?;

        Ok(MountPointBox { mount_point })
    }

    pub fn path_node(&self) -> &str {
        &self.path_node
    }

    pub fn queue(&self) -> Handle<Queue<FileLookupWork>> {
        self.sb.queue.clone()
    }

    pub fn mkdir(&self, name: &str) -> Result<Handle<FileLookupWork>> {
        let req = FileLookupRequest::CreateDirectory {
            sb: self.sb.handle().into_raw(),
            name: name.to_string(),
        };

        self.sb.send_request(req)
    }

    pub fn open(&self, name: &str) -> Result<Handle<FileLookupWork>> {
        let req = FileLookupRequest::LookupNode {
            sb: self.sb.handle().into_raw(),
            name: name.to_string(),
        };

        self.sb.send_request(req)
    }

    pub fn dir_entries(
        &self,
        dir_path: &str,
    ) -> Result<Handle<FileLookupWork>> {
        let req = FileLookupRequest::DirectoryEnries {
            sb: self.sb.handle().into_raw(),
            name: dir_path.to_string(),
        };

        self.sb.send_request(req)
    }
}

impl MountPointBox {
    pub fn into_node(self) -> &'static mut ListNode<MountPoint> {
        unsafe { &mut *SlabBox::into_raw(self.mount_point) }.as_node()
    }
}

impl Slab for MountPoint {
    const NAME: &str = "mount_point";
}

impl BoxedNode for MountPoint {
    type Target = MountPointBox;

    fn into_boxed(node: &mut Self::Item) -> Self::Target {
        let mount_point = crate::memory::into_boxed(node.into());

        Self::Target { mount_point }
    }
}
