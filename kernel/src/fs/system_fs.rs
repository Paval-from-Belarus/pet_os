use core::{
    cell::UnsafeCell,
    sync::atomic::{AtomicUsize, Ordering},
};

use alloc::{boxed::Box, string::ToString};
use kernel_types::{
    collections::{LinkedList, ListNode},
    fs::{FileSystem, FsId},
};

use crate::{fs, task::Mutex, user::queue::Queue};

use crate::{
    common::{atomics::SpinLock, SpinBox},
    object::{self, Handle},
};

use super::{FileSystemItem, FsError, FsWork, MountPoint};

pub struct SystemMountPoints {
    mounts: Mutex<LinkedList<'static, MountPoint>>,
    fs: Mutex<LinkedList<'static, FileSystemItem>>,

    fs_id: AtomicUsize,
}

unsafe impl Send for SystemMountPoints {}
unsafe impl Sync for SystemMountPoints {}

impl SystemMountPoints {
    pub fn new() -> fs::Result<Self> {
        Ok(Self {
            mounts: Mutex::new(LinkedList::empty())?,
            fs: Mutex::new(LinkedList::empty())?,

            fs_id: AtomicUsize::new(1),
        })
    }

    pub fn register(&self, fs: FileSystem) -> fs::Result<usize> {
        let Ok(fs) = Box::try_new(FileSystemItem::new(fs)) else {
            return Err(FsError::NotFound);
        };

        let id = self.fs_id.fetch_add(1, Ordering::SeqCst);

        let fs_leaked = unsafe { &mut *Box::into_raw(fs) };
        fs_leaked.id = id;

        self.fs.lock().push_back(fs_leaked.as_node());

        Ok(id)
    }

    pub fn unregister(&self, _id: FsId) -> fs::Result<()> {
        todo!()
    }

    pub unsafe fn set_root_fs(&self, fs: &'static mut MountPoint) {
        self.mounts.lock().push_back(fs);
    }

    pub unsafe fn set_dev_fs(&self, fs: &'static mut ListNode<MountPoint>) {
        self.mounts.lock().push_back(fs);
    }

    pub fn fs_by_name<F, T>(&self, name: &str, mut action: F) -> fs::Result<T>
    where
        F: FnOnce(&FileSystemItem) -> fs::Result<T>,
    {
        let maybe_fs =
            self.fs.lock().iter().find(|item| item.fs().name.eq(name));

        let Some(fs) = maybe_fs else {
            return Err(FsError::NotFound);
        };

        action(fs)
    }

    pub fn fs_queue(&self, id: FsId) -> Option<Handle<Queue<FsWork>>> {
        self.fs
            .lock()
            .iter()
            .find(|fs| fs.id == id)
            .map(|fs| fs.queue())
    }

    pub fn lookup_fs<PATH, F, T>(
        &self,
        name: PATH,
        mut action: F,
    ) -> fs::Result<T>
    where
        PATH: AsRef<str>,
        F: FnMut(&str, &MountPoint) -> fs::Result<T>,
    {
        let path = name.as_ref().to_string();

        let Some(path) = path.strip_prefix("/") else {
            return Err(fs::FsError::InvalidFileHandle);
        };

        if path.starts_with("dev") {
            let Some(device_name) = path.strip_prefix("dev/") else {
                return Err(fs::FsError::NotFound);
            };

            let dev_fs = self
                .mounts
                .try_lock()
                .unwrap()
                .iter()
                .find(|mount| mount.path_node().eq("/dev"))
                .unwrap();

            return action(device_name, dev_fs);
        }

        let root_fs = self
            .mounts
            .try_lock()
            .unwrap()
            .iter()
            .find(|mount| mount.path_node().eq("/"))
            .unwrap();

        action(path, &root_fs)
    }
}
