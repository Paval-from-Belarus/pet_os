use alloc::sync::Arc;
use kernel_macro::ListNode;
use kernel_types::{
    bitflags,
    collections::{
        BorrowingLinkedList, BoxedNode, LinkedList, TinyLinkedList,
        TinyListNode,
    },
    declare_constants,
    drivers::{DeviceId, DriverId},
};

use crate::{
    drivers::BlockDevice,
    memory::{slab_alloc, Kernel, SlabBox},
};

use super::{File, IndexNode, MountPoint};

declare_constants! {
    pub usize,
    MAX_FILE_SYSTEM_NAME = 32;
}

bitflags! {
    pub FileSystemKind(usize),
    READ_ONLY = 0b01,
}

#[repr(C)]
pub struct SuperBlockOperations {
    pub create_node: fn(&mut SuperBlock) -> &mut IndexNode,
    //mark the node as dirty because its data was modified
    //this method also flush changes on the disk
    pub dirty_node: fn(&mut IndexNode),
    pub destroy_node: fn(&mut IndexNode),
}

/// user-space structure to register file system
pub struct FileSystem {
    pub name: heapless::String<MAX_FILE_SYSTEM_NAME>,
    pub kind: FileSystemKind,
    pub read_super: fn(device: &mut BlockDevice) -> SuperBlock,
    pub operations: SuperBlockOperations,
    //the limitation of file system about max file size
    pub max_file_size: usize,
    pub private: Option<*mut ()>,
}

pub struct SuperBlockBox {
    pub super_block: SlabBox<SuperBlock>,
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
    pub mounts: LinkedList<'static, MountPoint>,
    //the size of elementary block in file system (for hard drive communication)
    //consider to add block_size_bits
    pub block_size: usize,
    pub file_system: Arc<FileSystem>,
}

impl SuperBlock {
    pub fn new_boxed(
        file_system: Arc<FileSystem>,
        device_id: DeviceId,
        driver_id: DriverId,
    ) -> SuperBlockBox {
        let super_block = slab_alloc(SuperBlock {
            node: TinyListNode::empty(),
            device_id,
            driver_id,
            file_system,

            files: LinkedList::empty(),
            mounts: LinkedList::empty(),
            block_size: 512,
        })
        .unwrap();

        SuperBlockBox { super_block }
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
        let super_block = unsafe { SlabBox::from_raw_in(node, Kernel) };

        Self::Target { super_block }
    }
}

fn do_stuff<'a>(
    fs: Arc<FileSystem>,
    nodes: &mut TinyLinkedList<'a, SuperBlock>,
) -> SuperBlockBox {
    let super_block =
        SuperBlock::new_boxed(fs, DeviceId(0), DriverId::RESERVED);

    nodes.push_back(super_block.into_node());

    let node = nodes.iter_mut().unlink_watched().unwrap();

    node.into_boxed()
}
