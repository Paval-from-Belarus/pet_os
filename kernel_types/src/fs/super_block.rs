use crate::{
    io::block::BlockDevice,
    object::{Handle, KernelObject},
    string::QuickString,
};

use super::{IndexNode, IndexNodeInfo, Result};

pub struct SuperBlock {}
pub struct PathNode<'a> {
    name: QuickString<'a>,
}

pub struct SuperBlockInfo {
    pub context: *const (),
    pub ops: SuperBlockOperations,
}

pub type FnLookup = fn(
    Handle<SuperBlock>,
    Handle<IndexNode>,
    QuickString<'_>,
) -> Result<IndexNodeInfo>;

pub type FnFlush = fn(Handle<SuperBlock>, Handle<IndexNode>) -> Result<()>;

#[repr(C)]
pub struct SuperBlockOperations {
    pub lookup_node: FnLookup,
    pub create_file: FnLookup,

    pub create_directory: FnLookup,

    //mark the node as dirty because its data was modified
    //this method also flush changes on the disk
    pub flush_node: FnFlush,
    pub destroy_node: FnFlush,
}

impl KernelObject for SuperBlock {}
impl KernelObject for PathNode<'_> {}

impl SuperBlock {
    pub fn context<T: Send + Sync>(&self) -> *const T {
        todo!()
    }

    pub fn disk(&self) -> Handle<BlockDevice> {
        todo!()
    }
}

impl PathNode<'_> {
    pub fn name(&self) -> QuickString<'_> {
        self.name.clone()
    }
}
