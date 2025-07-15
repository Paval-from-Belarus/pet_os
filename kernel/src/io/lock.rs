use core::cell::UnsafeCell;
use core::marker::PhantomData;
use core::ops::{Deref, DerefMut};
use core::ptr::NonNull;

use crate::io;

///should be used only in single cpu architectures
pub struct InterruptableLazyCell<T> {
    cell: UnsafeCell<Option<T>>,
}

unsafe impl<T> Send for InterruptableLazyCell<T> {}

unsafe impl<T> Sync for InterruptableLazyCell<T> {}

impl<T> InterruptableLazyCell<T> {
    pub const fn empty() -> Self {
        Self {
            cell: UnsafeCell::new(None),
        }
    }

    pub const fn new(value: T) -> Self {
        Self {
            cell: UnsafeCell::new(Some(value)),
        }
    }

    pub fn set(&self, value: T) {
        let cell = unsafe { &mut *self.cell.get() };
        if cell.is_none() {
            cell.replace(value);
        } else {
            unreachable!("Attempt to init second time");
        }
    }

    pub fn lock(&self) -> InterruptableLock<T> {
        let cell = unsafe { &mut *self.cell.get() };
        if let Some(data) = cell {
            InterruptableLock::new(data)
        } else {
            unreachable!("Failed to fetch from int lazy cell");
        }
    }
}

pub struct InterruptableLock<'a, T> {
    data: NonNull<T>,
    should_restore: bool,
    _marker: PhantomData<&'a mut T>,
}

impl<'a, T> InterruptableLock<'a, T> {
    fn new(data: &'a mut T) -> Self {
        let should_restore = unsafe { io::status() };

        unsafe { io::disable() };

        Self {
            should_restore,
            data: NonNull::from(data),
            _marker: PhantomData,
        }
    }
}

impl<'a, T> Deref for InterruptableLock<'a, T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        unsafe { self.data.as_ref() }
    }
}

impl<'a, T> DerefMut for InterruptableLock<'a, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe { self.data.as_mut() }
    }
}

impl<'a, T> Drop for InterruptableLock<'a, T> {
    fn drop(&mut self) {
        if self.should_restore {
            unsafe { io::enable() }
        }
    }
}
