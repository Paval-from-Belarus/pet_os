use core::mem::MaybeUninit;

use kernel_types::{
    drivers::{ModuleKind, UserModule},
    fs::{FileRequest, FsRequest},
    io::block,
    object::Queue,
    syscall,
};

use crate::{
    fs::{FileOperations, FsError, SuperBlockOperations},
    io::block::Operations,
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

pub fn handle_char_module(queue: Queue<FileRequest>, _ops: FileOperations) {
    loop {
        let Some(_) = queue.blocking_recv() else {
            break;
        };

        // match op {
        //     FileOperation::Command { file, command } => todo!(),
        //     FileOperation::Read { file, buf } => (ops.read)(file, buf),
        //     FileOperation::Write { file, buf } => todo!(),
        // }
    }
}

pub fn handle_fs_module(queue: Queue<FsRequest>, _ops: SuperBlockOperations) {
    loop {
        let Some(_op) = queue.blocking_recv() else {
            break;
        };
    }
}

pub fn handle_block_module(queue: Queue<block::Request>, _ops: Operations) {
    loop {
        let Some(_request) = queue.blocking_recv() else {
            break;
        };
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
