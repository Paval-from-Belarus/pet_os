use core::{cell::UnsafeCell, marker::PhantomData};

use kernel_types::{collections::LinkedList, container_of};

use crate::{
    common::atomics::SpinLock,
    memory::{self, Slab, SlabBox},
    object::{
        self, alloc_root_object, dealloc_root_object, runtime, AnyObject,
        Handle, Kind, Object, ObjectContainer,
    },
};

pub struct Queue<T: 'static> {
    data: UnsafeCell<LinkedList<'static, Object>>,
    lock: SpinLock,
    object: Object,
    kind: object::Kind,
    max_capacity: Option<usize>,
    _marker: PhantomData<T>,
}

impl Queue<AnyObject> {
    pub fn kind(&self) -> object::Kind {
        self.kind
    }

    pub unsafe fn cast<T: ObjectContainer>(&self) -> &Queue<T> {
        core::mem::transmute(self)
    }
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
            kind: T::KIND,
            max_capacity: None,
            _marker: PhantomData,
        })?;

        Ok(handle)
    }

    pub fn new_bounded(
        capacity: usize,
    ) -> Result<Handle<Self>, memory::AllocError> {
        alloc_root_object(Self {
            max_capacity: capacity.into(),
            kind: T::KIND,
            object: Self::new_root_object(),
            data: UnsafeCell::new(LinkedList::empty()),
            lock: SpinLock::new(),
            _marker: PhantomData,
        })
    }

    pub fn push(&self, data: SlabBox<T>) {
        let data = unsafe { &mut *SlabBox::into_raw(data) };

        self.lock.acquire();

        {
            let list = unsafe { &mut *self.data.get() };

            list.push_back(data.object_mut());
        }

        self.lock.release();

        runtime::notify(self.handle().into_addr());
    }

    pub fn try_push(&self, _data: SlabBox<T>) -> Result<(), ()> {
        Ok(())
    }

    pub fn try_pop(&self) -> Option<SlabBox<T>> {
        todo!()
    }

    pub fn blocking_pop(&self) -> Option<SlabBox<T>> {
        loop {}
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
