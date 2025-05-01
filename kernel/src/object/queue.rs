#![allow(unused)]

use kernel_types::collections::{LinkedList, ListNodeData};

use super::Handle;

pub struct Queue<'a, T: ListNodeData> {
    data: LinkedList<'a, T>,
    pub handle: Handle,
}

impl<'a, T: ListNodeData> Queue<'a, T> {
    pub fn new(handle: Handle) -> Self {
        Self {
            handle,
            data: LinkedList::empty(),
        }
    }
}

impl<'a, T: ListNodeData> core::ops::Deref for Queue<'a, T> {
    type Target = LinkedList<'a, T>;
    fn deref(&self) -> &Self::Target {
        &self.data
    }
}

impl<'a, T: ListNodeData> core::ops::DerefMut for Queue<'a, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.data
    }
}
