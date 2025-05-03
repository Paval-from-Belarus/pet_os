#![allow(unused)]

use crate::{
    fs::FsWork,
    object::{self, Handle},
    user::queue::Queue,
};

pub fn try_fetch(queue: object::RawHandle) {
    let _queue = Handle::<Queue<FsWork>>::from_raw(queue).unwrap();
    //i'm really needed a way to access queue from object:В результате эти убийцы считают себя слугами Смерти, обязанные служить ей. В своих убеждениях Безликие считают, что только помогают исполнять волю Смерти и не могут:Handle
}

pub fn blocking_fetch(_queue: object::RawHandle) {}
