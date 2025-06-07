use crate::object::Handle;

pub struct Queue;

pub enum ModuleKind {
    Fs,
    Char,
    Block,
}

pub struct Module {
    pub queue: Handle<Queue>,
}
