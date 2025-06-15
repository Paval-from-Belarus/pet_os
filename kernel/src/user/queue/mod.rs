use core::{
    marker::PhantomData,
    sync::atomic::{AtomicUsize, Ordering},
};

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
    len: AtomicUsize,
    object: Object,
    kind: object::Kind,
    max_capacity: Option<usize>,
    _marker: PhantomData<T>,
}

#[derive(Debug)]
pub enum TryPushError<T> {
    Full(T),
    Locked(T),
}

impl<T: 'static> core::fmt::Debug for Queue<T> {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        f.debug_struct("Queue")
            .field("kind", &self.kind)
            .field("object", &self.object)
            .field("max_capacity", &self.max_capacity)
            .finish()
    }
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
            len: AtomicUsize::new(0),
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
            len: AtomicUsize::new(0),
            kind: T::KIND,
            object: Self::new_root_object(),
            data,
            _marker: PhantomData,
        })
    }

    pub fn push(&self, data: SlabBox<T>) -> Handle<T> {
        let handle = data.handle();

        let data = unsafe { &mut *SlabBox::into_raw(data) };

        self.data.lock().push_back(data.object_mut());

        runtime::notify(self.handle());

        handle
    }

    pub fn try_push(
        &self,
        data: SlabBox<T>,
    ) -> Result<Handle<T>, TryPushError<SlabBox<T>>> {
        let Some(mut queue) = self.data.try_lock() else {
            return Err(TryPushError::Locked(data));
        };

        let handle = data.handle();

        let data = unsafe { &mut *SlabBox::into_raw(data) };

        queue.push_back(data.object_mut());

        drop(queue);

        runtime::notify(self.handle());

        Ok(handle)
    }

    pub fn try_pop(&self) -> Option<Handle<T>> {
        todo!()
    }

    pub fn blocking_pop(&self) -> Option<Handle<T>> {
        runtime::critical_section(self.handle(), |queue| loop {
            let mut maybe_obj = queue.data.try_lock().unwrap().remove_first();

            if let Some(obj) = maybe_obj.as_mut() {
                obj.parent = None;
                return Some(obj.handle());
            }

            runtime::block_on(queue.handle())
                .expect("Failed to block on queue");
        })
    }

    #[allow(unused)]
    fn has_capacity(&self) -> bool {
        self.max_capacity
            .map(|capacity| {
                let len = self.len.load(Ordering::SeqCst);
                len < capacity
            })
            .unwrap_or(true)
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
