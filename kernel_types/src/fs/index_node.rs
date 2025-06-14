use crate::object::RawHandle;

use super::NodeId;

#[repr(C)]
pub struct IndexNodeInfo {
    //this handle should be allocated for kernel
    //it directly converted to KernelHandle (!! not UserHandle)
    pub queue: RawHandle,

    pub id: NodeId,
    pub size: usize,
    pub kind: NodeKind,
    pub permissions: FilePermissions,

    pub ctx: *const (),
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
        const EXEC = 0x01;
        const WRITE = 0x02;
        const READ = 0x04;

        const READ_WRITE = Self::READ.bits() | Self::WRITE.bits();
    }
}
