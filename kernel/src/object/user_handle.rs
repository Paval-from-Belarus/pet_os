use core::mem::ManuallyDrop;

use super::{Handle, ObjectContainer};

pub struct UserHandle<T: ObjectContainer>(ManuallyDrop<Handle<T>>);

impl<T: ObjectContainer> UserHandle<T> {
    pub unsafe fn from_addr_unchecked(addr: usize) -> Self {
        let handle = Handle::from_addr_unchecked(addr);

        Self(ManuallyDrop::new(handle))
    }
}

impl<T: ObjectContainer> core::ops::Deref for UserHandle<T> {
    type Target = T;
    fn deref(&self) -> &Self::Target {
        &self.0
    }
}
