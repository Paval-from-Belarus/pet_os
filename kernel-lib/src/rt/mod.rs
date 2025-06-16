use core::mem::MaybeUninit;

use kernel_types::{
    drivers::{ModuleKind, UserModule},
    fs::{FileRequest, FileResponse, FsRequest, Work},
    io::block,
    object::{OpStatus, Queue},
    syscall,
};

use crate::{
    fs::{FileOperations, FsError, SuperBlockOperations},
    io::block::Operations,
    object::{KernelBuf, KernelBufMut, UserBuf, UserBufMut},
    process,
};

pub enum ModuleOperations {
    Block(Operations),
    Fs(SuperBlockOperations),
    Char(FileOperations),
}

impl From<FileOperations> for ModuleOperations {
    fn from(value: FileOperations) -> Self {
        Self::Char(value)
    }
}

impl From<Operations> for ModuleOperations {
    fn from(value: Operations) -> Self {
        Self::Block(value)
    }
}

impl From<SuperBlockOperations> for ModuleOperations {
    fn from(value: SuperBlockOperations) -> Self {
        Self::Fs(value)
    }
}

impl ModuleOperations {
    pub fn kind(&self) -> ModuleKind {
        match self {
            ModuleOperations::Block(_) => ModuleKind::Block,
            ModuleOperations::Fs(_) => ModuleKind::Fs,
            ModuleOperations::Char(_) => ModuleKind::Char,
        }
    }
}

pub fn module_task(ops: ModuleOperations) -> ! {
    let module = match access_module_info() {
        Ok(module) => module,
        Err(cause) => {
            log::error!("Failed to access module info: {cause:?}");
            process::exit(32);
        }
    };

    match module.kind {
        ModuleKind::Fs => unsafe {
            if let ModuleOperations::Fs(ops) = ops {
                handle_fs_module(module.queue.cast(), ops);
            } else {
                process::exit(34);
            }
        },

        ModuleKind::Char => unsafe {
            if let ModuleOperations::Char(ops) = ops {
                handle_char_module(module.queue.cast(), ops);
            } else {
                process::exit(34);
            }
        },

        ModuleKind::Block => unsafe {
            if let ModuleOperations::Block(ops) = ops {
                handle_block_module(module.queue.cast(), ops)
            } else {
                process::exit(34);
            }
        },
    };

    process::exit(33);
}

#[derive(Debug, thiserror_no_std::Error)]
pub enum HandleError {
    #[error("Fs operation is failed: {0}")]
    FsError(#[from] FsError),
}

pub fn handle_char_module(
    queue: Queue<Work<FileRequest>>,
    ops: FileOperations,
) {
    log::debug!("Handling char module");

    loop {
        let Some(mut work) = queue.blocking_recv() else {
            break;
        };

        let status = match work.request.take().unwrap() {
            FileRequest::Command { .. } => todo!(),
            FileRequest::Read { file, buf } => {
                let user_buf = UserBufMut::from(buf);

                (ops.read)(file.into(), user_buf)
            }
            FileRequest::Write { buf, file } => {
                log::debug!("write operation");

                let buf = KernelBuf::from(buf);

                let mut user_buf = UserBuf::new(buf.len());
                buf.copy_to(&mut user_buf).unwrap();

                (ops.write)(file.into(), user_buf)
            }
        };

        match status {
            Ok(_) => work.send_response(FileResponse::Completed).unwrap(),
            Err(cause) => {
                work.send_response(FileResponse::OpStatus(cause.into()))
                    .unwrap();
            }
        }
    }
}

pub fn handle_fs_module(
    queue: Queue<Work<FsRequest>>,
    _ops: SuperBlockOperations,
) {
    loop {
        let Some(_op) = queue.blocking_recv() else {
            break;
        };
    }
}

pub fn handle_block_module(
    queue: Queue<Work<block::Request>>,
    ops: Operations,
) {
    loop {
        let Some(mut work) = queue.blocking_recv() else {
            break;
        };

        let req = work.request.take().unwrap();

        log::debug!("Next blk req: {req:?}");

        let status = match req.work {
            block::Work::Read { sector, buffer } => {
                let buf = KernelBufMut::from(buffer);

                (ops.read)(sector, buf)
            }
            block::Work::Write { sector, buffer } => {
                let buf = KernelBuf::from(buffer);

                let mut user_buf = UserBuf::new(buf.capacity());
                buf.copy_to(&mut user_buf).unwrap();

                (ops.write)(sector, user_buf)
            }
            block::Work::Passthrough { cmd } => (ops.ioctl)(cmd),
        };

        match status {
            Ok(_) => work.send_response(block::Response::Completed).unwrap(),
            Err(status) => work
                .send_response(block::Response::OpStatus(status.into()))
                .unwrap(),
        }
    }
}

pub fn access_module_info() -> syscall::Result<UserModule> {
    let module = unsafe {
        let mut module = MaybeUninit::<UserModule>::uninit();

        syscall! {
            syscall::Request::GetModuleInfo,
            edx: module.as_mut_ptr()
        }?;

        module.assume_init()
    };

    Ok(module)
}
