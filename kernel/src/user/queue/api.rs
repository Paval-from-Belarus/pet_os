#![allow(unused)]

use crate::{
    fs::FsWork,
    object::{self, runtime, Handle, ObjectContainer},
    user::queue::Queue,
};

pub fn try_fetch(queue: object::RawHandle) -> Option<&'static mut FsWork> {
    let queue = Handle::<Queue<FsWork>>::from_raw(queue).unwrap();

    queue.pop()
}

pub fn blocking_fetch(queue: object::RawHandle) -> Option<&'static mut FsWork> {
    loop {
        let queue = Handle::<Queue<FsWork>>::from_raw(queue).unwrap();

        if let Some(event) = queue.pop() {
            break Some(event);
        }

        runtime::block_on(queue.as_raw()).unwrap();
    }
}
