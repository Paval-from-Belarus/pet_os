use core::{
    cell::UnsafeCell,
    sync::atomic::{AtomicUsize, Ordering},
};

use alloc::{boxed::Box, string::ToString};
use kernel_types::{
    collections::{LinkedList, ListNode},
    fs::{FileSystem, FsId},
};

use crate::{fs, user::queue::Queue};

use crate::{
    common::{atomics::SpinLock, SpinBox},
    object::{self, Handle},
};

use super::{FileSystemItem, FsError, FsWork, MountPoint};

pub struct SystemMountPoints {
    mounts: UnsafeCell<LinkedList<'static, MountPoint>>,
    mounts_lock: SpinLock,

    fs: spin::RwLock<LinkedList<'static, FileSystemItem>>,

    fs_id: AtomicUsize,
}

unsafe impl Send for SystemMountPoints {}
unsafe impl Sync for SystemMountPoints {}

impl SystemMountPoints {
    pub const fn new() -> Self {
        Self {
            mounts: UnsafeCell::new(LinkedList::empty()),
            mounts_lock: SpinLock::new(),

            fs: spin::RwLock::new(LinkedList::empty()),

            fs_id: AtomicUsize::new(1),
        }
    }

    pub fn register(&self, fs: FileSystem) -> fs::Result<usize> {
        let Ok(fs) = Box::try_new(FileSystemItem::new(fs)) else {
            return Err(FsError::NotFound);
        };

        let id = self.fs_id.fetch_add(1, Ordering::SeqCst);

        let fs_leaked = unsafe { &mut *Box::into_raw(fs) };
        fs_leaked.id = id;

        self.fs.write().push_back(fs_leaked.as_node());

        Ok(id)
    }

    pub fn unregister(&self, _id: FsId) -> fs::Result<()> {
        todo!()
    }

    pub unsafe fn set_root_fs(&self, fs: &'static mut MountPoint) {
        self.mounts_lock.acquire();

        let mounts = unsafe { &mut *self.mounts.get() };
        assert!(mounts.is_empty(), "Only once");

        mounts.push_back(fs.as_node());

        self.mounts_lock.release();
    }

    pub unsafe fn set_dev_fs(&self, fs: &'static mut ListNode<MountPoint>) {
        todo!()
    }

    pub fn fs_by_name<F, T>(&self, name: &str, mut action: F) -> fs::Result<T>
    where
        F: FnMut(&FileSystemItem) -> fs::Result<T>,
    {
        let maybe_fs =
            self.fs.read().iter().find(|item| item.fs().name.eq(name));

        let Some(fs) = maybe_fs else {
            return Err(FsError::NotFound);
        };

        action(fs)
    }

    pub fn dev_fs(&self) -> SpinBox<'_, &FileSystemItem> {
        todo!()
    }

    pub fn root_fs(&self) -> SpinBox<'_, &MountPoint> {
        self.mounts_lock.acquire();

        let mounts = unsafe { &*self.mounts.get() };
        let root_fs = mounts.first().expect("Root FS is not set");

        SpinBox::new_locked(&self.mounts_lock, root_fs)
    }

    pub fn fs_queue(&self, id: FsId) -> Option<Handle<Queue<FsWork>>> {
        self.fs
            .read()
            .iter()
            .find(|fs| fs.id == id)
            .map(|fs| fs.queue())
    }

    pub fn lookup_fs<PATH: AsRef<str>>(
        &self,
        name: PATH,
    ) -> (alloc::string::String, SpinBox<'_, &MountPoint>) {
        let file_name = name.as_ref().to_string();

        (file_name, self.root_fs())
    }
}
