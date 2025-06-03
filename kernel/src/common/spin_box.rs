use core::ops::{Deref, DerefMut};

use crate::common::atomics::SpinLock;

pub struct SpinBox<'lock, T> {
    lock: &'lock SpinLock,
    data: T,
}

impl<'lock, T> SpinBox<'lock, T> {
    pub fn new_locked(lock: &'lock SpinLock, data: T) -> Self {
        assert!(lock.is_locked());

        Self { lock, data }
    }
}

impl<'a, T> Drop for SpinBox<'a, T> {
    fn drop(&mut self) {
        self.lock.release();
    }
}

impl<'a, T> Deref for SpinBox<'a, T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        &self.data
    }
}

impl<'a, T> DerefMut for SpinBox<'a, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.data
    }
}
