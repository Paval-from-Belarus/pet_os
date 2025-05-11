mod api;

use core::{cell::UnsafeCell, marker::PhantomData};

use kernel_types::{collections::LinkedList, container_of};

use crate::{
    common::atomics::SpinLock,
    memory::{self, Slab},
    object::{
        alloc_root_object, dealloc_root_object, runtime, Handle, Kind, Object,
        ObjectContainer,
    },
};

#[allow(unused)]
pub use api::*;

pub struct Queue<T: 'static> {
    data: UnsafeCell<LinkedList<'static, Object>>,
    lock: SpinLock,
    object: Object,
    _marker: PhantomData<T>,
}

impl<T> Queue<T>
where
    T: ObjectContainer + 'static,
{
    pub fn new_unbounded() -> Result<Handle<Self>, memory::AllocError> {
        let handle = alloc_root_object(Self {
            object: Self::new_root_object(),
            data: UnsafeCell::new(LinkedList::empty()),
            lock: SpinLock::new(),
            _marker: PhantomData,
        })?;

        Ok(handle)
    }

    pub fn new_bounded(
        _capacity: usize,
    ) -> Result<Handle<Self>, memory::AllocError> {
        todo!()
    }

    pub fn push(&self, data: &'static mut T) {
        self.lock.acquire();

        {
            let list = unsafe { &mut *self.data.get() };

            list.push_back(data.object_mut());
        }

        self.lock.release();

        runtime::notify(self.handle().as_raw());
    }

    pub fn try_push(&self, _data: &'static mut T) -> Result<(), ()> {
        Ok(())
    }

    pub fn pop(&self) -> Option<&'static mut T> {
        None
    }
}

impl<T: 'static> ObjectContainer for Queue<T> {
    const KIND: Kind = Kind::Queue;

    fn container_of(object: *mut Object) -> *mut Self {
        container_of!(object, Self, object)
    }

    fn object(&self) -> &Object {
        &self.object
    }

    fn object_mut(&mut self) -> &mut Object {
        &mut self.object
    }
}

impl<T> Slab for Queue<T> {
    const NAME: &'static str = "queue";
}

impl<T: 'static> Drop for Queue<T> {
    fn drop(&mut self) {
        dealloc_root_object(self.handle());
    }
}
