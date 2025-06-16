use alloc::{boxed::Box, string::ToString, vec::Vec};
use kernel_types::{
    drivers::ModuleKind,
    fs::{
        DirEntriesInfo, FileLookupRequest, FilePermissions, FileSystem,
        FileSystemKind, FsRequest, FsResponse, IndexNodeInfo, NodeKind,
        SuperBlockInfo,
    },
    object::{OpStatus, RawHandle},
};

use crate::{
    current_task,
    drivers::{self, ready_event, MODULES},
    fs::{self, FileLookupWork, FsWork, SuperBlock},
    memory::VirtualAddress,
    object::Handle,
    task,
    user::queue::Queue,
};

use super::init_module;

pub fn spawn_task() -> fs::Result<()> {
    let fs_info = FileSystem {
        name: "dev-fs".into(),
        kind: FileSystemKind::READ_ONLY,
    };

    let fs_id = fs::register_fs(fs_info)?;

    let queue = fs::fs_queue(fs_id).expect("Fs is not created");

    let fs_task = task::new_task(
        fs_task,
        unsafe { queue.into_addr() as _ },
        task::TaskPriority::Module(1),
    )
    .expect("Failed to spawn dev-fs task");

    task::submit_task(fs_task);

    init_module("fat-fs", core::ptr::null(), ModuleKind::Fs, 3).unwrap();

    Ok(())
}

pub struct InitMessage {
    work: Handle<FsWork>,
    queue: RawHandle,
}

extern "C" fn fs_task(raw_handle: *const ()) {
    let queue = unsafe {
        Handle::<Queue<FsWork>>::from_addr_unchecked(
            raw_handle as VirtualAddress,
        )
    };

    log::debug!(
        "dev-fs task #{}. Queue = {raw_handle:?}",
        current_task!().id
    );

    ready_event().wait();

    log::debug!("All modules are ready");

    loop {
        let Some(work) = queue.blocking_pop() else {
            break;
        };

        let request = work.take_request();

        match request {
            FsRequest::Mount { .. } => {
                let sb_info = SuperBlockInfo {
                    block_size: 512,
                    queue_size: 3,
                    context: core::ptr::null(),
                };

                work.send_response(sb_info.into());
            }
            FsRequest::Unmount { .. } => todo!(),
            FsRequest::FsQueue { queue } => {
                let init_message =
                    Box::try_new(InitMessage { work, queue }).unwrap();

                let arg = Box::into_raw(init_message) as *mut ();

                let sb_task =
                    task::new_task(sb_task, arg, task::TaskPriority::Module(0))
                        .unwrap();

                task::submit_task(sb_task);
            }
        }
    }

    log::info!("Dev fs task is completed...");
}

extern "C" fn sb_task(ptr: *const ()) {
    let raw_message = ptr as *mut InitMessage;

    let message: Box<InitMessage> = unsafe { Box::from_raw(raw_message) };

    let message = *message;

    message.work.send_response(FsResponse::Completed);

    let queue = Handle::<Queue<FileLookupWork>>::from_raw(message.queue);

    log::debug!("dev sb task is started #{}", current_task!().id);

    loop {
        let Some(work) = queue.blocking_pop() else {
            break;
        };

        let request =
            work.request.try_lock().unwrap().take().expect("No request");

        match request {
            FileLookupRequest::LookupNode { name, sb } => {
                let _ = Handle::<SuperBlock>::from_raw(sb);

                log::debug!("lookup req: {name}");

                if let Some(module) = drivers::find_by_name(name) {
                    let node_kind = match module.kind() {
                        ModuleKind::Fs => {
                            work.send_response(OpStatus::NotFound.into());
                            continue;
                        }

                        ModuleKind::Char => NodeKind::Char,
                        ModuleKind::Block => NodeKind::Block,
                    };

                    let queue = module.queue.clone().into_file_queue().unwrap();

                    let inode_info = IndexNodeInfo {
                        id: module.id as _,
                        size: 0,
                        ctx: module.file_ctx(),
                        kind: node_kind,
                        queue,
                        permissions: FilePermissions::READ_WRITE,
                    };

                    work.send_response(inode_info.into());
                } else {
                    work.send_response(OpStatus::NotFound.into());
                }
            }
            FileLookupRequest::DirectoryEnries { sb, .. } => {
                let _ = Handle::<SuperBlock>::from_raw(sb);
                let entries = MODULES
                    .modules
                    .lock()
                    .iter()
                    .map(|m| m.state.name.to_string())
                    .collect::<Vec<_>>();

                work.send_response(DirEntriesInfo { entries }.into());
            }
            FileLookupRequest::FlushNode { .. }
            | FileLookupRequest::DestroyNode { .. }
            | FileLookupRequest::CreateFile { .. }
            | FileLookupRequest::CreateDirectory { .. } => {
                work.send_response(OpStatus::NotSupported.into());
            }
        }
    }
}
