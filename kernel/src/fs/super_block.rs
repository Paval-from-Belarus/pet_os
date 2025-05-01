use alloc::sync::Arc;
use kernel_macro::ListNode;
use kernel_types::{
    collections::{BoxedNode, LinkedList, ListNode, TinyListNode},
    declare_constants,
    drivers::{DeviceId, DriverId},
};

use crate::{
    memory::{self, SlabBox},
    object,
};

use super::{File, FileSystemKind, IndexNode, MountPoint, Work};

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
}

impl FileSystemItem {
    pub fn new(fs: FileSystem) -> Self {
        Self {
            node: ListNode::empty(),
            fs: Arc::new(fs),
            id: 0,
        }
    }

    pub fn fs(&self) -> Arc<FileSystem> {
        Arc::clone(&self.fs)
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

pub struct SuperBlockBox {
    pub super_block: SlabBox<SuperBlock>,
}

//The implementation of the file system

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
}

impl crate::memory::Slab for SuperBlock {
    const NAME: &str = "super_ops";
}

impl SuperBlock {
    pub fn new(
        file_system: Arc<FileSystem>,
        device_id: u32,
        driver_id: u16,
    ) -> SuperBlock {
        SuperBlock {
            node: TinyListNode::empty(),
            device_id: DeviceId(device_id),
            driver_id: DriverId::new(driver_id),
            file_system,

            files: LinkedList::empty(),
            mounts: LinkedList::empty(),
            block_size: 512,
        }
    }

    pub fn work(&self, _work: Work) -> object::Handle {
        object::Handle(0)
    }
}

impl SuperBlockBox {
    pub fn into_node(self) -> &'static mut TinyListNode<SuperBlock> {
        unsafe { &mut *SlabBox::into_raw(self.super_block) }.as_node()
    }
}

impl BoxedNode for SuperBlock {
    type Target = SuperBlockBox;

    fn into_boxed(
        node: &mut <SuperBlock as kernel_types::collections::TinyListNodeData>::Item,
    ) -> Self::Target {
        let super_block = memory::into_boxed(node.into());

        Self::Target { super_block }
    }
}
