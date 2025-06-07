use kernel_types::{
    fs::{FileOperation, FsOperation},
    io::block,
    object::{Handle, Queue},
};

pub enum ModuleQueue {
    Fs(Handle<Queue<FsOperation>>),
    Char(Handle<Queue<FileOperation>>),
    Block(Handle<Queue<block::Request>>),
}
