use core::cell::UnsafeCell;
use core::ops::{Deref, DerefMut};

use crate::utils::atomics::SpinLock;

pub struct SpinBox<'a, 'b, T> {
    lock: &'a SpinLock,
    data: UnsafeCell<&'b mut T>,
}

impl<'a, 'b, T> SpinBox<'a, 'b, T> {
    pub fn new(lock: &'a SpinLock, data: &'b mut T) -> Self {
        lock.acquire();
        Self {
            lock,
            data: UnsafeCell::new(data),
        }
    }

    ///Using API of SpinBox is possible to create several mutable reference to any data,
    ///that is forbidden by Rust rules and should be considered as UB.
    ///Please, be very careful using such API
    pub unsafe fn leak(&'a self) -> &'b mut T {
        unsafe { *self.data.get() }
    }
}

impl<'a, 'b, T> Drop for SpinBox<'a, 'b, T> {
    fn drop(&mut self) {
        self.lock.release();
    }
}

impl<'a, 'b, T> Deref for SpinBox<'a, 'b, T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        unsafe { self.leak() }
    }
}

impl<'a, 'b, T> DerefMut for SpinBox<'a, 'b, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe { self.leak() }
    }
}