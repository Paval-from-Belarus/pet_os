use core::mem::ManuallyDrop;

use kernel_types::object::RawHandle;

use super::{Handle, ObjectContainer};

pub struct UserHandle<T: ObjectContainer>(ManuallyDrop<Handle<T>>);

#[allow(unused)]
impl<T: ObjectContainer> UserHandle<T> {
    pub unsafe fn from_addr_unchecked(addr: usize) -> Self {
        let handle = Handle::from_addr_unchecked(addr);

        Self(ManuallyDrop::new(handle))
    }

    pub fn from_raw(handle: RawHandle) -> Self {
        let handle = Handle::from_raw(handle);

        Self(ManuallyDrop::new(handle))
    }

    pub fn to_owned(&self) -> Handle<T> {
        (*self.0).clone()
    }
}

impl<T: ObjectContainer> core::ops::Deref for UserHandle<T> {
    type Target = T;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
