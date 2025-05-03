#![allow(unused)]

use core::marker::PhantomData;

use kernel_types::collections::{LinkedList, ListNodeData};

use crate::{
    memory,
    object::{
        alloc_root_object, dealloc_root_object, runtime, Handle, Kind, Object,
        ObjectContainer,
    },
};

pub struct Queue<'a, T> {
    data: LinkedList<'a, Object>,
    handle: Handle,
    _marker: PhantomData<&'a T>,
}

impl<'a, T> Queue<'a, T>
where
    T: ObjectContainer,
    &'a mut T: Into<&'a mut Object>,
{
    pub fn new() -> Result<Self, memory::AllocError> {
        let handle = alloc_root_object(Kind::Queue)?;

        Ok(Self {
            handle,
            data: LinkedList::empty(),
            _marker: PhantomData,
        })
    }

    pub fn push(&mut self, data: &'a mut T) {
        let object = data.into();

        self.data.push_back(object);

        runtime::notify(self.handle());
    }

    pub fn pop(&mut self) -> Option<&'a mut T> {
        None
    }

    pub fn handle(&self) -> Handle {
        self.handle
    }
}

impl<'a, T> Drop for Queue<'a, T> {
    fn drop(&mut self) {
        dealloc_root_object(self.handle);
    }
}
