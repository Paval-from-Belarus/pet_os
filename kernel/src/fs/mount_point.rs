use alloc::sync::Arc;
use kernel_macro::ListNode;
use kernel_types::collections::ListNode;

use crate::common::{atomics::SpinLock, SpinBox};

use super::{FileSystem, SuperBlock};

#[derive(ListNode)]
#[repr(C)]
pub struct MountPoint {
    #[list_pivots]
    node: ListNode<MountPoint>,

    lock: SpinLock,
    super_block: Arc<spin::RwLock<SuperBlock>>,
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
    pub fn new(fs: Arc<FileSystem>) -> Self {
        Self {
            super_block: Arc::new(spin::RwLock::new(SuperBlock::new(fs, 0, 0))),
            lock: SpinLock::new(),
            node: ListNode::empty(),
        }
    }

    pub fn super_block<'a>(
        &'a self,
    ) -> impl core::ops::Deref<Target = SuperBlock> + 'a {
        self.super_block.read()
    }

    pub fn root(&mut self) -> SpinBox<MountPoint> {
        // let root = unsafe { self.root.as_mut() };
        // SpinBox::new(&self.lock, )
        todo!()
    }
}
