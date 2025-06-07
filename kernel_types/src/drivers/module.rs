use crate::object::{Handle, KernelObject, Queue, RawHandle};

pub enum ModuleQueue {
    // Fs(Handle<Queue<FsWork>>),
    Char,
    Block,
}

#[repr(C)]
pub struct Module {
    pub queue: ModuleQueue,
}
