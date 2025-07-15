use crate::object::RawHandle;

#[derive(Debug, Clone, Copy, num_enum::TryFromPrimitive)]
#[repr(u32)]
pub enum ModuleKind {
    Fs,
    Char,
    Block,
}

impl ModuleKind {
    pub fn is_file(&self) -> bool {
        !matches!(self, Self::Fs)
    }
}

pub type ModuleId = usize;

#[repr(C)]
pub struct UserModule {
    pub id: ModuleId,
    pub kind: ModuleKind,
    pub queue: RawHandle,
}
