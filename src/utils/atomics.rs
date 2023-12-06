use core::cell::UnsafeCell;
use core::fmt::Pointer;
use core::marker::PhantomData;
use core::ops::{Deref, DerefMut};
use core::ptr::NonNull;
use core::sync::atomic::{AtomicBool, Ordering};
use core::sync::atomic::Ordering::Acquire;

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
    data: UnsafeCell<Option<T>>,
}

unsafe impl<T> Send for SpinLockLazyCell<T> {}

unsafe impl<T> Sync for SpinLockLazyCell<T> {}

///Own spinlock while exists

pub struct SpinLockGuard<'a, T: 'a> {
    lock: &'a SpinLock,
    data: NonNull<T>,
}

impl<T> SpinLockLazyCell<T> {
    pub const fn empty() -> Self {
        Self {
            lock: SpinLock::new(),
            data: UnsafeCell::new(None),
        }
    }
    ///return true if data was placed
    pub fn set(&self, value: T) -> bool {
        let was_placed: bool;
        self.lock.acquire();
        let option = unsafe { &mut *self.data.get() };
        if option.is_none() {
            option.replace(value);
            was_placed = true;
        } else {
            was_placed = false;
        }
        self.lock.release();
        was_placed
    }
    pub fn get(&self) -> SpinLockGuard<'_, T> {
        let data = unsafe { &mut *self.data.get() };
        SpinLockGuard::new(data, &self.lock)
    }
}

impl<'a, T> SpinLockGuard<'a, T> {
    pub fn new(data_option: &mut Option<T>, lock: &'a SpinLock) -> SpinLockGuard<'a, T> {
        let pointer: NonNull<T>;
        loop {
            lock.acquire();
            if let Some(data) = data_option {
                pointer = NonNull::from(data);
                break;
            }
            lock.release();
        }
        Self { lock, data: NonNull::from(pointer) }
    }
    fn data(&self) -> &T {
        unsafe { self.data.as_ref() }
    }
    fn data_mut(&mut self) -> &mut T {
        unsafe { self.data.as_mut() }
    }
}

impl<'a, T> Drop for SpinLockGuard<'a, T> {
    fn drop(&mut self) {
        self.lock.release()
    }
}

impl<'a, T> Deref for SpinLockGuard<'a, T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        self.data()
    }
}

impl<'a, T> DerefMut for SpinLockGuard<'a, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        self.data_mut()
    }
}