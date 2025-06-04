#![allow(unused)]

use core::{marker::PhantomData, ops::Deref};

use crate::io;

pub trait KernelObject {}

#[derive(Debug, Clone)]
#[repr(C)]
pub struct Handle<T: KernelObject>(usize, PhantomData<T>);
pub type RawHandle = usize;

impl Handle<Event> {
    pub fn new_event() -> io::Result<Self> {
        Ok(Self(0, PhantomData))
    }

    pub fn block_on(&self) {}

    pub fn notify(&self) {}
}

#[derive(Debug, Clone)]
pub struct Event;
impl KernelObject for Event {}

impl<T: KernelObject> Deref for Handle<T> {
    type Target = T;
    fn deref(&self) -> &Self::Target {
        todo!()
    }
}
