use core::cell::UnsafeCell;
use core::ops::{Deref, DerefMut};
use core::ptr::NonNull;
use core::sync::atomic::{AtomicBool, AtomicUsize, Ordering};

#[repr(transparent)]
pub struct RefCounter(AtomicUsize);

impl RefCounter {
    pub const fn new() -> Self {
        Self(AtomicUsize::new(0))
    }
    pub fn count(&self) -> usize {
        self.0.load(Ordering::Relaxed)
    }
    pub fn take(&self) {
        self.0.fetch_add(1, Ordering::Release);
    }
    pub fn free(&self) -> Result<(), ()> {
        self.0.fetch_sub(1, Ordering::Acquire);
        todo!()
    }
}

#[derive(Debug)]
#[repr(transparent)]
pub struct SpinLock {
    lock: AtomicBool,
}

impl SpinLock {
    pub const fn new() -> Self {
        SpinLock {
            lock: AtomicBool::new(false),
        }
    }

    pub fn acquire(&self) {
        loop {
            let is_acquired = !self.lock.swap(true, Ordering::Acquire);

            if is_acquired {
                break;
            }
        }
    }

    pub fn release(&self) {
        self.lock.store(false, Ordering::Release);
    }

    pub fn try_acquire(&self) -> Result<(), ()> {
        let is_acquired = !self.lock.swap(true, Ordering::Acquire);
        if is_acquired {
            Ok(())
        } else {
            Err(())
        }
    }
}

#[repr(transparent)]
pub struct UnsafeLazyCell<T> {
    cell: UnsafeCell<Option<T>>,
}

impl<T> UnsafeLazyCell<T> {
    pub const fn empty() -> Self {
        Self {
            cell: UnsafeCell::new(None),
        }
    }

    pub fn set(&self, value: T) {
        let option = unsafe { &mut *self.cell.get() };
        if option.is_none() {
            option.replace(value);
        }
    }

    pub fn get(&self) -> &T {
        let option = unsafe { &*self.cell.get() };
        if let Some(value) = option {
            &value
        } else {
            unreachable!("The lazy cell is not initialized");
        }
    }
}

unsafe impl<T> Send for UnsafeLazyCell<T> where T: Send {}

unsafe impl<T> Sync for UnsafeLazyCell<T> where T: Sync {}

impl<T> Deref for UnsafeLazyCell<T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        self.get()
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
    pub fn new(
        data_option: &mut Option<T>,
        lock: &'a SpinLock,
    ) -> SpinLockGuard<'a, T> {
        let pointer: NonNull<T>;
        loop {
            lock.acquire();
            if let Some(data) = data_option {
                pointer = NonNull::from(data);
                break;
            }
            lock.release();
        }
        Self {
            lock,
            data: NonNull::from(pointer),
        }
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
