use kernel_types::collections::LinkedList;

use crate::task::SCHEDULER;

use super::{Handle, Object, ObjectContainer, RawHandle, Status};

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

    pub fn remove_object(
        &self,
        handle: RawHandle,
    ) -> Option<&'static mut Object> {
        let mut objects = self.objects.write();

        let node = objects.remove_by(|object| object.raw_handle() == handle)?;

        Some(&mut *node)
    }

    pub fn push_object(&self, object: &'static mut Object) {
        self.objects.write().push_back(object.as_node());
    }
}

pub fn block_on<T: ObjectContainer>(handle: Handle<T>) -> Result<(), ()> {
    let handle = handle.into_addr();

    let mut objects = RUNTIME.objects.write();

    let Some(object) = objects
        .iter_mut()
        .find(|object| object.raw_handle() == handle)
    else {
        todo!()
    };

    if object.status == Status::Completed {
        return Ok(());
    }

    object.status = Status::Blocked;

    let _ = objects;

    SCHEDULER.switch_lock().block_on(handle);

    Ok(())
}

pub fn notify<T: ObjectContainer>(_handle: Handle<T>) {
    //todo: add logic to wake up all tasks
    //waiting on object
}

pub fn lookup<T: ObjectContainer>(handle: Handle<T>) -> bool {
    let objects = RUNTIME.objects.read();

    objects.iter().any(|object| object.raw_handle() == handle.as_addr())
}

pub fn register(object: &'static mut Object) -> RawHandle {
    let handle = object.raw_handle();

    RUNTIME.push_object(object);

    handle
}

pub fn unregister(handle: RawHandle) -> Option<&'static mut Object> {
    RUNTIME.remove_object(handle)
}

//remove child from parent
pub fn remove_child(_child: RawHandle, _parent: RawHandle) {}
