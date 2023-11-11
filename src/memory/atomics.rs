use core::ops::{Deref, DerefMut};
use core::ptr::NonNull;
use core::sync::atomic::{AtomicBool, Ordering};
use core::sync::atomic::Ordering::Acquire;
use crate::memory::ToPhysicalAddress;

pub struct AtomicCell<T> {
    // value: UnsafeCell<T>,
    value: T,
    lock: bool,
}

impl<T: Clone + Copy> AtomicCell<T> {
    pub fn wrap(value: T) -> AtomicCell<T> {
        AtomicCell { value, lock: false }
    }
    pub fn set(&mut self, value: T) {
        self.value = value;
        todo!("Replace with asm code")
    }
    pub fn get(&self) -> T {
        return self.value.clone();
    }
    pub fn replace(&mut self, value: T) -> T {
        let old = self.value;
        self.value = value;
        old
    }
}

#[repr(transparent)]
pub struct SpinLock {
    lock: AtomicBool,
}

impl SpinLock {
    pub const fn new() -> Self {
        SpinLock { lock: AtomicBool::new(false) }
    }
    pub fn acquire(&self) {
        loop {
            let is_acquired = !self.lock.swap(true, Acquire);
            if is_acquired {
                break;
            }
        }
    }
    pub fn release(&self) {
        self.lock.store(false, Ordering::Release);
    }
}

pub struct SpinLockLazyCell<T> {
    lock: SpinLock,
    data: Option<T>,
}

pub struct SpinLockGuard<'a, T> {
    lock: &'a SpinLock,
    data: NonNull<T>,
}

impl<T> SpinLockLazyCell<T> {
    pub const fn empty() -> Self {
        Self {
            lock: SpinLock::new(),
            data: None,
        }
    }
    ///return true if data was placed
    pub fn set(&mut self, value: T) -> bool {
        let was_placed: bool;
        self.lock.acquire();
        if self.data.is_none() {
            self.data = Some(value);
            was_placed = true;
        } else {
            was_placed = false;
        }
        self.lock.release();
        was_placed
    }
    pub fn get(&self) -> SpinLockGuard<'_, T> {
        SpinLockGuard::new(self)
    }
}

impl<'a, T> SpinLockGuard<'a, T> {
    pub fn new(parent: &'a SpinLockLazyCell<T>) -> SpinLockGuard<'a, T> {
        let data_ref: &T;
        let lock = &parent.lock;
        loop {
            lock.acquire();
            if let Some(data) = &parent.data {
                data_ref = data;
                break;
            }
            lock.release();
        }
        Self {
            lock,
            data: NonNull::from(data_ref),
        }
    }
    pub fn data(&self) -> &T {
        unsafe { self.data.as_ref() }
    }
    pub fn data_mut(&mut self) -> &mut T {
        unsafe { self.data.as_mut() }
    }
}

impl<T> Drop for SpinLockGuard<'_, T> {
    fn drop(&mut self) {
        self.lock.release()
    }
}

impl<T> Deref for SpinLockGuard<'_, T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        self.data()
    }
}

impl<T> DerefMut for SpinLockGuard<'_, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        self.data_mut()
    }
}