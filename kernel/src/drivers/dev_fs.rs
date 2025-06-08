use kernel_types::{
    fs::{FileSystem, FileSystemKind, FsRequest, SuperBlockInfo},
    get_eax,
    io::block,
};

use crate::{
    fs::{self, FsWork},
    object::Handle,
    task,
    user::queue::Queue,
};

pub fn init() -> fs::Result<()> {
    let fs_info = FileSystem {
        name: "dev-fs".into(),
        kind: FileSystemKind::READ_ONLY,
    };

    let fs_id = fs::register_fs(fs_info)?;

    let queue = fs::fs_queue(fs_id).expect("Fs is not created");

    let fs_task = task::new_task(
        fs_task,
        queue.into_raw() as _,
        task::TaskPriority::Module(1),
    )
    .expect("Failed to spawn dev-fs task");

    task::submit_task(fs_task);

    unsafe { fs::mount_dev_fs() };

    Ok(())
}

extern "C" fn fs_task() {
    let raw_handle = unsafe { get_eax!() };
    let queue =
        unsafe { Handle::<Queue<FsWork>>::from_raw_unchecked(raw_handle) };

    loop {
        let Some(work) = queue.blocking_pop() else {
            break;
        };

        match work.request {
            FsRequest::Mount { .. } => todo!(),
            FsRequest::Unmount { fs } => todo!(),
            FsRequest::LookupNode { fs, file, name } => todo!(),
            FsRequest::CreateFile { fs, file, name } => todo!(),
            FsRequest::CreateDirectory { fs, file, name } => todo!(),
            FsRequest::FlushNode { fs, file } => todo!(),
            FsRequest::DestroyNode { fs, file } => todo!(),
        }
    }

    log::info!("Dev fs task is completed...");
}
