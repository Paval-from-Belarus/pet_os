use crate::{
    io::{KernelBuf, KernelBufMut},
    object::{OperationStatus, RawHandle},
};

pub enum FileRequest {
    Command { file: RawHandle, command: usize },
    Read { file: RawHandle, buf: KernelBufMut },
    Write { file: RawHandle, buf: KernelBuf },
}

pub enum FileResponse {
    Status(OperationStatus),
}
