use crate::object::RawHandle;

#[derive(Debug, Clone, Copy, num_enum::TryFromPrimitive)]
#[repr(u32)]
pub enum ModuleKind {
    Fs,
    Char,
    Block,
}

pub type ModuleId = usize;

#[repr(C)]
pub struct UserModule {
    pub id: ModuleId,
    pub kind: ModuleKind,
    pub queue: RawHandle,
}
