use core::{marker::PhantomData, ops::DerefMut};

use kernel_types::{collections::LinkedList, container_of};

use crate::{
    memory::{self, Slab, SlabBox},
    object::{
        self, alloc_root_object, dealloc_root_object, runtime, AnyObject,
        Handle, Kind, Object, ObjectContainer,
    },
    task::Mutex,
};

pub struct Queue<T: 'static> {
    data: Mutex<LinkedList<'static, Object>>,
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
        let data = Mutex::new(LinkedList::empty())?;

        let handle = alloc_root_object(Self {
            object: Self::new_root_object(),
            data,
            kind: T::KIND,
            max_capacity: None,
            _marker: PhantomData,
        })?;

        Ok(handle)
    }

    pub fn new_bounded(
        capacity: usize,
    ) -> Result<Handle<Self>, memory::AllocError> {
        let data = Mutex::new(LinkedList::empty())?;

        alloc_root_object(Self {
            max_capacity: capacity.into(),
            kind: T::KIND,
            object: Self::new_root_object(),
            data,
            _marker: PhantomData,
        })
    }

    pub fn push(&self, data: SlabBox<T>) {
        let data = unsafe { &mut *SlabBox::into_raw(data) };

        self.data.lock().push_back(data.object_mut());

        runtime::notify(self.handle());
    }

    pub fn try_push(&self, data: SlabBox<T>) -> Result<(), ()> {
        let _ = data;
        todo!()
    }

    pub fn try_pop(&self) -> Option<SlabBox<T>> {
        todo!()
    }

    pub fn blocking_pop(&self) -> Option<SlabBox<T>> {
        loop {
            let maybe_obj = self.data.lock().remove_first();
            if let Some(obj) = maybe_obj {
                let boxed = unsafe { &mut *T::container_of(obj.deref_mut()) };

                log::debug!("S: {:?}", obj.kind);

                return Some(memory::into_boxed(boxed.into()));
            }
        }
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
