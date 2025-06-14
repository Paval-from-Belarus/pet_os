use core::{cell::UnsafeCell, sync::atomic::Ordering};

use crate::task::{Mutex, MutexGuard};

use super::AllocError;

#[atomic_enum::atomic_enum]
#[repr(usize)]
pub enum Context {
    Boot,
    Irq,
    Kernel,
}

static CONTEXT: AtomicContext = AtomicContext::new(Context::Boot);

pub unsafe fn init() {
    CONTEXT.store(Context::Kernel, Ordering::SeqCst);
}

pub fn start_irq<F: FnOnce()>(f: F) {
    CONTEXT.store(Context::Irq, Ordering::SeqCst);

    f();

    CONTEXT.store(Context::Kernel, Ordering::SeqCst);
}

pub fn context() -> Context {
    CONTEXT.load(Ordering::SeqCst)
}

pub struct ContextLock<T> {
    data: UnsafeCell<T>,

    spin_lock: spin::Mutex<()>,
    object_lock: UnsafeCell<Option<crate::task::Mutex<()>>>,
}

enum LockKind<'a> {
    Spin(spin::MutexGuard<'a, ()>),
    Object(MutexGuard<'a, ()>, spin::MutexGuard<'a, ()>),
}

pub struct ContextLockGuard<'a, T: 'a> {
    lock: &'a ContextLock<T>,
    kind: LockKind<'a>,
}

#[derive(Debug, thiserror_no_std::Error)]
pub enum LockError {
    SpinIsBusy,
}

impl<T> ContextLock<T> {
    pub fn new(value: T) -> Self {
        Self {
            data: UnsafeCell::new(value),
            spin_lock: spin::Mutex::new(()),
            object_lock: UnsafeCell::new(None),
        }
    }

    /// Returns the init of this [`ContextLock<T>`].
    ///
    /// # Errors
    ///
    /// This function will return an error if mutex cannot be crated
    ///
    /// # Safety
    ///
    /// .
    pub unsafe fn init(&self) -> Result<(), AllocError> {
        unsafe {
            *self.object_lock.get() = Some(Mutex::new(())?);
        }

        Ok(())
    }

    pub fn lock(&self) -> Result<ContextLockGuard<'_, T>, LockError> {
        match context() {
            Context::Boot | Context::Irq => {
                let Some(lock) = self.spin_lock.try_lock() else {
                    return Err(LockError::SpinIsBusy);
                };

                Ok(ContextLockGuard {
                    lock: self,
                    kind: LockKind::Spin(lock),
                })
            }

            Context::Kernel => {
                let mutex = unsafe { &*self.object_lock.get() }
                    .as_ref()
                    .expect("Object lock is not set");

                let spin_lock = self.spin_lock.try_lock().unwrap();

                let lock = mutex.lock();

                Ok(ContextLockGuard {
                    lock: self,
                    kind: LockKind::Object(lock, spin_lock),
                })
            }
        }
    }
}

impl<'a, T: 'a> core::ops::Deref for ContextLockGuard<'a, T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        unsafe { &*self.lock.data.get() }
    }
}

impl<'a, T: 'a> core::ops::DerefMut for ContextLockGuard<'a, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe { &mut *self.lock.data.get() }
    }
}
