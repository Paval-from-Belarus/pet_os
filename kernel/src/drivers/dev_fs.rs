use kernel_types::{
    drivers::ModuleKind,
    fs::{
        FileLookupRequest, FilePermissions, FileSystem, FileSystemKind,
        FsRequest, IndexNodeInfo, NodeKind, SuperBlockInfo,
    },
    get_eax,
    object::OpStatus,
};

use crate::{
    drivers,
    fs::{self, FileLookupWork, FsWork},
    object::Handle,
    task,
    user::queue::Queue,
};

pub fn spawn_task() -> fs::Result<()> {
    let fs_info = FileSystem {
        name: "dev-fs".into(),
        kind: FileSystemKind::READ_ONLY,
    };

    let fs_id = fs::register_fs(fs_info)?;

    let queue = fs::fs_queue(fs_id).expect("Fs is not created");

    let fs_task = task::new_task(
        fs_task,
        queue.into_addr() as _,
        task::TaskPriority::Module(1),
    )
    .expect("Failed to spawn dev-fs task");

    task::submit_task(fs_task);

    Ok(())
}

#[allow(unused)]
extern "C" fn fs_task() {
    let raw_handle = unsafe { get_eax!() };
    let queue =
        unsafe { Handle::<Queue<FsWork>>::from_addr_unchecked(raw_handle) };

    loop {
        let Some(work) = queue.blocking_pop() else {
            break;
        };

        match work.request {
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
                let arg = unsafe { queue.leak() as _ };
                let sb_task =
                    task::new_task(sb_task, arg, task::TaskPriority::Module(0))
                        .unwrap();

                task::submit_task(sb_task);
            }
        }
    }

    log::info!("Dev fs task is completed...");
}

extern "C" fn sb_task() {
    let raw_handle = unsafe { get_eax!() };
    let queue = unsafe {
        Handle::<Queue<FileLookupWork>>::from_addr_unchecked(raw_handle)
    };

    loop {
        let Some(work) = queue.blocking_pop() else {
            break;
        };

        match &work.request {
            FileLookupRequest::LookupNode { name } => {
                if let Some(module) = drivers::find_by_name(name) {
                    let node_kind = match module.kind() {
                        ModuleKind::Fs => {
                            work.send_response(OpStatus::NotFound.into());
                            continue;
                        }

                        ModuleKind::Char => NodeKind::Char,
                        ModuleKind::Block => NodeKind::Block,
                    };

                    let inode_info = IndexNodeInfo {
                        id: module.id as _,
                        size: 0,
                        kind: node_kind,
                        queue_size: 10,
                        permissions: FilePermissions::READ_WRITE,
                    };

                    work.send_response(inode_info.into());
                } else {
                    work.send_response(OpStatus::NotFound.into());
                }
            }

            FileLookupRequest::FlushNode { .. } => todo!(),
            FileLookupRequest::DestroyNode { .. } => todo!(),
            FileLookupRequest::CreateFile { .. } => todo!(),
            FileLookupRequest::CreateDirectory { .. } => todo!(),
        }
    }
}
