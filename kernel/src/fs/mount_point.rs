use alloc::boxed::Box;
use kernel_macro::ListNode;
use kernel_types::collections::{BoxedNode, ListNode};

use crate::{
    common::atomics::SpinLock,
    memory::{AllocError, Slab, SlabBox},
};

use super::{FileSystemItem, SuperBlock};

pub struct MountPointBox {
    mount_point: SlabBox<MountPoint>,
}

#[derive(ListNode)]
#[repr(C)]
pub struct MountPoint {
    #[list_pivots]
    node: ListNode<MountPoint>,

    lock: SpinLock,
    super_block: spin::RwLock<SlabBox<SuperBlock>>,
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
        sb: SlabBox<SuperBlock>,
    ) -> Result<MountPointBox, AllocError> {
        let mount_point = crate::memory::slab_alloc(Self {
            super_block: spin::RwLock::new(sb),
            lock: SpinLock::new(),
            node: ListNode::empty(),
        })?;

        Ok(MountPointBox { mount_point })
    }

    pub fn super_block<'a>(
        &'a self,
    ) -> impl core::ops::Deref<Target = SlabBox<SuperBlock>> + 'a {
        self.super_block.read()
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
