use core::ops::{Deref, DerefMut};
use crate::utils::atomics::SpinLock;

pub struct SpinBox<'a, T> {
    lock: &'a SpinLock,
    data: &'a mut T,
}

impl<'a, T> SpinBox<'a, T> {
    pub fn new(lock: &'a SpinLock, data: &'a mut T) -> Self {
        lock.acquire();
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