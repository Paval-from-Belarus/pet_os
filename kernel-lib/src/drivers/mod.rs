use kernel_types::{
    fs::{FileRequest, FsRequest},
    io::block,
    object::Queue,
};

pub enum ModuleQueue {
    Fs(Queue<FsRequest>),
    Char(Queue<FileRequest>),
    Block(Queue<block::Request>),
}
