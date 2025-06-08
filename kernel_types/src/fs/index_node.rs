use crate::object::RawHandle;

use super::NodeId;

#[repr(C)]
pub struct IndexNodeInfo {
    pub queue_size: usize,

    pub id: NodeId,
    pub super_block: RawHandle,
    pub size: usize,
    pub kind: NodeKind,
    pub permissions: FilePermissions,
}

pub enum NodeKind {
    File,
    Block,
    Char,
}

bitflags::bitflags! {
    #[derive(Debug, Clone, Copy)]
    #[repr(C)]
    pub struct FilePermissions: u8 {
        const EXECUTABLE = 0x01;
        const WRITABLE = 0x02;
        const READABLE = 0x04;
    }
}
