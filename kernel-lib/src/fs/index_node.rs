use kernel_types::object::{KernelObject, RawHandle};

#[allow(unused)]
pub struct IndexNode {
    handle: RawHandle,
}

impl IndexNode {
    pub fn id(&self) -> usize {
        todo!()
    }

    pub fn context<T: Send + Sync>(&self) -> *const T {
        todo!()
    }
}

impl From<RawHandle> for IndexNode {
    fn from(value: RawHandle) -> Self {
        Self { handle: value }
    }
}

impl KernelObject for IndexNode {}
