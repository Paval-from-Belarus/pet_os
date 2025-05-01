#![allow(unused)]

use kernel_types::collections::LinkedList;

use crate::task::SCHEDULER;

use super::{Handle, Object, Status};

struct Runtime {
    pub objects: spin::RwLock<LinkedList<'static, Object>>,
}

static RUNTIME: Runtime = Runtime::new();

unsafe impl Send for Runtime {}
unsafe impl Sync for Runtime {}

impl Runtime {
    pub const fn new() -> Self {
        Self {
            objects: spin::RwLock::new(LinkedList::empty()),
        }
    }

    pub fn remove_object(&self, _handle: Handle) -> Option<&'static Object> {
        None
    }

    pub fn get_mut(&self, _handle: Handle) -> Option<&mut Object> {
        todo!()
    }
}

pub fn block_on(handle: Handle) -> Result<&'static Object, ()> {
    let Some(object) = RUNTIME.get_mut(handle) else {
        return Err(());
    };

    if object.status == Status::Completed {
        let object = RUNTIME.remove_object(handle).unwrap();
        return Ok(object);
    }

    object.status = Status::Blocked;

    let _ = object;

    SCHEDULER.switch_lock().block_on(handle);

    let object = RUNTIME
        .remove_object(handle)
        .expect("Completed object doesn't exist");

    Ok(object)
}
