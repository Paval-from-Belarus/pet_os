use crate::object::KernelObject;

#[derive(Debug, Clone)]
#[repr(C)]
pub struct File {
    pub offset: usize,
}

impl File {
    pub fn context<T: Send + Sync>(&self) -> *const T {
        todo!()
    }
}

impl KernelObject for File {}

pub struct FileOperations {

}
