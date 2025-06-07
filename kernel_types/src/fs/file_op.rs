use crate::{
    io::{KernelBuf, KernelBufMut},
    object::Handle,
};

use super::File;

pub enum FileOperation {
    Command {
        file: Handle<File>,
        command: usize,
    },
    Read {
        file: Handle<File>,
        buf: KernelBufMut,
    },
    Write {
        file: Handle<File>,
        buf: KernelBuf,
    },
}
