use core::{
    cell::UnsafeCell,
    sync::atomic::{AtomicBool, Ordering},
};

use crate::{
    impl_container,
    memory::AllocError,
    object::{
        self,
        runtime::{self, critical_section},
        Handle, Object, ObjectContainer,
    },
};

pub struct Mutex<T: Sized> {
    data: UnsafeCell<T>,
    mutex: Handle<MutexObject>,
}
impl<T: Sized> core::fmt::Debug for Mutex<T> {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        f.debug_struct("Mutex")
            .field("mutex", &*self.mutex)
            .finish()
    }
}

#[derive(Debug)]
pub struct MutexObject {
    locked: AtomicBool,
    object: Object,
}

impl MutexObject {
    pub fn new() -> Result<Handle<Self>, AllocError> {
        object::alloc_root_object(MutexObject {
            object: MutexObject::new_root_object(),
            locked: AtomicBool::new(false),
        })
    }

    pub fn acquire(&self) {
        loop {
            let is_locked = self
                .locked
                .compare_exchange(
                    false,
                    true,
                    Ordering::SeqCst,
                    Ordering::SeqCst,
                )
                .is_err();

            if !is_locked {
                return;
            }

            runtime::block_on(self.handle()).unwrap();
        }
    }

    pub fn release(&self) {
        self.locked.store(false, Ordering::SeqCst);

        runtime::notify(self.handle());
    }
}

impl_container! {
    MutexObject,
    obj_kind: Mutex,
    slab: "futex"
}

pub struct MutexGuard<'a, T: Sized + 'a> {
    lock: &'a Mutex<T>,
}

impl<T: Sized> Drop for MutexGuard<'_, T> {
    fn drop(&mut self) {
        self.lock.mutex.locked.store(false, Ordering::SeqCst);
        runtime::notify(self.lock.mutex.handle());
    }
}

impl<T: Sized> core::ops::Deref for MutexGuard<'_, T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        unsafe { &*self.lock.data.get() }
    }
}

impl<T: Sized> core::ops::DerefMut for MutexGuard<'_, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe { &mut *self.lock.data.get() }
    }
}

unsafe impl<T: Sized + Send> Sync for Mutex<T> {}
unsafe impl<T: Sized + Send> Send for Mutex<T> {}

impl<T: Sized> Mutex<T> {
    pub fn new(value: T) -> Result<Mutex<T>, AllocError> {
        let mutex = MutexObject::new()?;

        Ok(Self {
            mutex,
            data: UnsafeCell::new(value),
        })
    }

    pub fn handle(&self) -> Handle<MutexObject> {
        self.mutex.handle()
    }

    pub fn try_lock(&self) -> Option<MutexGuard<'_, T>> {
        let is_locked = self
            .mutex
            .locked
            .compare_exchange(false, true, Ordering::SeqCst, Ordering::SeqCst)
            .is_err();

        if is_locked {
            None
        } else {
            Some(MutexGuard { lock: self })
        }
    }

    pub fn lock(&self) -> MutexGuard<'_, T> {
        runtime::critical_section(self.handle(), |mutex| {
            mutex.acquire();
        });

        MutexGuard { lock: self }
    }
}
