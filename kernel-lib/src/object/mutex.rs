use core::cell::UnsafeCell;

use kernel_types::{object::RawHandle, syscall};

pub struct Mutex<T> {
    data: UnsafeCell<T>,
    handle: RawHandle,
}

pub struct MutexGuard<'a, T> {
    lock: &'a Mutex<T>,
}

impl<T> Mutex<T> {
    pub fn new(value: T) -> Self {
        let mut handle = 0usize;

        unsafe {
            syscall! {
                syscall::Request::MutexNew,
                edx: &mut handle
            }
            .expect("Failed to create mutex");
        }

        Self {
            data: UnsafeCell::new(value),
            handle: unsafe { RawHandle::new_unchecked(handle) },
        }
    }

    pub fn lock(&self) -> MutexGuard<'_, T> {
        unsafe {
            syscall! {
                syscall::Request::MutexAcquire,
                edx: self.handle.syscall()
            }
            .expect("Invalid handle");
        }

        MutexGuard { lock: self }
    }
}

impl<T> core::ops::Deref for MutexGuard<'_, T> {
    type Target = T;
    fn deref(&self) -> &Self::Target {
        unsafe { &*self.lock.data.get() }
    }
}

impl<T> core::ops::DerefMut for MutexGuard<'_, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe { &mut *self.lock.data.get() }
    }
}

impl<T> Drop for MutexGuard<'_, T> {
    fn drop(&mut self) {
        unsafe {
            let _ = syscall! {
                syscall::Request::MutexRelease,
                edx: self.lock.handle.syscall()
            };
        }
    }
}
