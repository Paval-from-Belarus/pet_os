#![allow(unused)]
use core::{cell::UnsafeCell, sync::atomic::AtomicBool};

use kernel_types::container_of;

use crate::{
    memory::Slab,
    object::{self, Object, ObjectContainer},
};

//the actual objech which implemets logic of mutex
pub struct MutexObject {
    object: Object,
    lock: AtomicBool,
}

pub struct Mutex<T: Sized> {
    data: UnsafeCell<T>,
    mutex: MutexObject,
}

pub struct MutexGuard<'a, T: Sized + 'a> {
    lock: &'a Mutex<T>,
}

unsafe impl<T: Sized + Send> Sync for Mutex<T> {}
unsafe impl<T: Sized + Send> Send for Mutex<T> {}

impl Slab for MutexObject {
    const NAME: &str = "futex";
}

impl ObjectContainer for MutexObject {
    const KIND: object::Kind = object::Kind::Mutex;

    fn container_of(object: *mut object::Object) -> *mut Self {
        container_of!(object, MutexObject, object)
    }

    fn object(&self) -> &object::Object {
        &self.object
    }

    fn object_mut(&mut self) -> &mut object::Object {
        &mut self.object
    }
}

impl<T: Sized> Mutex<T> {
    pub fn new(_value: T) -> Self {
        todo!()
    }

    pub fn handle(&self) -> object::RawHandle {
        todo!()
    }

    pub fn try_lock(&self) {
        todo!()
    }

    pub fn lock(&self) {
        todo!()
    }
}
