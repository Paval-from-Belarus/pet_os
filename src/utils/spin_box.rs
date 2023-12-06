use core::ops::{Deref, DerefMut};
use core::ptr::NonNull;
use crate::utils::atomics::SpinLock;

pub struct SpinBox<'a, T> {
    lock: &'a SpinLock,
    data: NonNull<T>,
}

impl<'a, T> SpinBox<'a, T> {
    pub fn new(lock: &'a SpinLock, data: &mut T) -> Self {
        lock.acquire();
        Self {
            lock,
            data: NonNull::from(data),
        }
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
        unsafe { self.data.as_ref() }
    }
}

impl<'a, T> DerefMut for SpinBox<'a, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe { self.data.as_mut() }
    }
}