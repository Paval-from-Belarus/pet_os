use core::{marker::PhantomData, mem::ManuallyDrop, ptr::NonNull};

use kernel_types::collections::{HashCode, HashKey};

use crate::{
    error::KernelError,
    memory::{SlabBox, VirtualAddress},
};

use super::{Object, ObjectContainer};

#[must_use]
#[repr(transparent)]
pub struct Handle<T: ObjectContainer>(
    // pub struct Handle(
    RawHandle,
    PhantomData<&'static mut T>,
);

pub type RawHandle = VirtualAddress;

impl<T: ObjectContainer> PartialEq for Handle<T> {
    fn eq(&self, other: &Self) -> bool {
        self.0 == other.0
    }
}

impl<T: ObjectContainer> Eq for Handle<T> {}

impl<T: ObjectContainer> HashKey for Handle<T> {
    fn hash_code(&self) -> HashCode {
        self.0 as HashCode
    }
}

impl<T: ObjectContainer> Handle<T> {
    pub unsafe fn from_addr_unchecked(raw_handle: VirtualAddress) -> Self {
        Self(raw_handle, PhantomData)
    }

    pub fn from_raw(handle: kernel_types::object::RawHandle) -> Self {
        let handle = ManuallyDrop::new(handle);

        unsafe { Self::from_addr_unchecked(handle.syscall()) }
    }

    pub fn from_addr(raw_handle: RawHandle) -> Result<Self, ()> {
        let handle = unsafe { Self::from_addr_unchecked(raw_handle) };

        (*handle)
            .object()
            .ref_count
            .fetch_add(1, core::sync::atomic::Ordering::SeqCst);

        Ok(handle)
    }

    pub fn object(&self) -> *const Object {
        self.0 as *const Object
    }

    pub fn as_addr(&self) -> RawHandle {
        self.0
    }

    pub fn into_addr(self) -> RawHandle {
        let handle = self.0;

        let _ = ManuallyDrop::new(self);

        handle
    }

    pub fn into_raw(self) -> kernel_types::object::RawHandle {
        let handle = self.into_addr();

        unsafe { kernel_types::object::RawHandle::new_unchecked(handle) }
    }

    pub fn into_owned(self) -> Result<SlabBox<T>, KernelError> {
        //fixme: check ref count

        let slab = T::container_of(self.object() as *mut Object);

        Ok(crate::memory::into_boxed(NonNull::new(slab).unwrap()))
    }
}

impl<T: ObjectContainer> core::ops::Deref for Handle<T> {
    type Target = T;
    fn deref(&self) -> &Self::Target {
        let container = T::container_of(self.object() as *mut Object);

        unsafe { &*container }
    }
}

impl<T: ObjectContainer> core::ops::DerefMut for Handle<T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        let container = T::container_of(self.object() as *mut Object);

        unsafe { &mut *container }
    }
}

impl<T: ObjectContainer> Clone for Handle<T> {
    fn clone(&self) -> Self {
        use core::sync::atomic::Ordering;
        let object = unsafe { &*self.object() };

        object.ref_count.fetch_add(1, Ordering::SeqCst);

        Self(self.0, PhantomData)
    }
}

impl<T: ObjectContainer> Drop for Handle<T> {
    fn drop(&mut self) {
        use core::sync::atomic::Ordering;

        let object = unsafe { &*self.object() };

        log::debug!("Droping object handle: {object:?}");

        let prev_value = object.ref_count.fetch_sub(1, Ordering::SeqCst);

        let _value = prev_value - 1;
        //
        // if value == 0 {
        //     assert!(object.parent.is_none());
        //     let _ = object;
        //
        //     let container =
        //         unsafe { &mut *T::container_of(self.object() as *mut Object) };
        //     let _ = container;
        // } else if value == 1 {
        //     if let Some(parent) = object.parent {
        //         //parent should drop object by itself
        //         runtime::remove_child(self.0, parent);
        //     }
        // }
    }
}
