use core::cell::UnsafeCell;

use alloc::string::ToString;
use kernel_types::collections::LinkedList;

use crate::common::{atomics::SpinLock, SpinBox};

use super::MountPoint;

pub struct SystemMountPoints {
    mounts: UnsafeCell<LinkedList<'static, MountPoint>>,
    lock: SpinLock,
}

unsafe impl Send for SystemMountPoints {}
unsafe impl Sync for SystemMountPoints {}

impl SystemMountPoints {
    pub const fn new() -> Self {
        Self {
            mounts: UnsafeCell::new(LinkedList::empty()),
            lock: SpinLock::new(),
        }
    }

    pub unsafe fn set_root_fs(&self, fs: &'static mut MountPoint) {
        self.lock.acquire();

        let mounts = unsafe { &mut *self.mounts.get() };
        assert!(mounts.is_empty(), "Only once");

        mounts.push_back(fs.as_node());

        self.lock.release();
    }

    pub fn root_fs(&self) -> SpinBox<'_, &MountPoint> {
        self.lock.acquire();

        let mounts = unsafe { &*self.mounts.get() };
        let root_fs = mounts.first().expect("Root FS is not set");

        SpinBox::new_locked(&self.lock, root_fs)
    }

    pub fn lookup_fs<PATH: AsRef<str>>(
        &self,
        name: PATH,
    ) -> (alloc::string::String, SpinBox<'_, &MountPoint>) {
        let file_name = name.as_ref().to_string();

        (file_name, self.root_fs())
    }
}
