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
    use core::sync::atomic::Ordering;

    let object = unsafe { &*handle.object() };

    object.status.store(Status::Blocked, Ordering::SeqCst);

    SCHEDULER.switch_lock().block_on(handle.into_addr());

    Ok(())
}

pub fn notify<T: ObjectContainer>(handle: Handle<T>) {
    SCHEDULER.switch_lock().unblock_on(handle.into_addr());
}

pub fn lookup<T: ObjectContainer>(handle: Handle<T>) -> bool {
    let objects = RUNTIME.objects.read();

    objects
        .iter()
        .any(|object| object.raw_handle() == handle.as_addr())
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
#[allow(unused)]
pub fn remove_child(_child: RawHandle, _parent: RawHandle) {
    todo!()
}
