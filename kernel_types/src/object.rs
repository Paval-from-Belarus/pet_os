#![allow(unused)]

use core::{marker::PhantomData, ops::Deref};

#[derive(Debug, Clone)]
pub struct Handle<T>(usize, PhantomData<T>);

impl Handle<Event> {
    pub fn new_event() -> Result<Self, ()> {
        Ok(Self(0, PhantomData))
    }

    pub fn block_on(&self) {}

    pub fn notify(&self) {}
}

#[derive(Debug, Clone)]
pub struct Event;

impl<T> Deref for Handle<T> {
    type Target = T;
    fn deref(&self) -> &Self::Target {
        todo!()
    }
}
