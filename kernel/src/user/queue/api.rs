#![allow(unused)]

use crate::{
    fs::FsWork,
    object::{self, Handle},
    user::queue::Queue,
};

pub fn try_fetch(queue: object::RawHandle) {
    let _queue = Handle::<Queue<FsWork>>::try_from_raw(queue).unwrap();
    //i'm really needed a way to access queue from object::Handle
}

pub fn blocking_fetch(_queue: object::RawHandle) {}
