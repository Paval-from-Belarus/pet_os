#![allow(unused)]

use crate::{
    fs::FsWork,
    object::{self, runtime, Handle, ObjectContainer},
    user::queue::Queue,
};

// pub fn try_fetch(queue: object::RawHandle) -> Option<FsWork> {
//     let queue = Handle::<Queue<FsWork>>::from_raw(queue).unwrap();
//
//     queue.blocking_pop()
// }
//
// pub fn blocking_fetch(queue: object::RawHandle) -> Option<FsWork> {
//     loop {
//         let queue = Handle::<Queue<FsWork>>::from_raw(queue).unwrap();
//
//         if let Some(event) = queue.blocking_pop() {
//             break Some(event);
//         }
//
//         runtime::block_on(queue.as_raw()).unwrap();
//     }
// }
