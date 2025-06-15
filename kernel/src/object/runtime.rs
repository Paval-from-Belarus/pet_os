use core::sync::atomic::Ordering;

use kernel_types::collections::LinkedList;

use crate::{error::KernelError, task::SCHEDULER};

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

pub fn block_on<T: ObjectContainer>(
    handle: Handle<T>,
) -> Result<(), KernelError> {
    let status = T::object(&handle).status.load(Ordering::SeqCst);

    //this task is blocking on object
    //and holding critical section
    let awake_another = status == Status::Blocked;

    SCHEDULER
        .switch_lock()
        .block_on(handle, awake_another, |obj| {
            obj.object().status.store(Status::Working, Ordering::SeqCst);
        });

    Ok(())
}

pub fn critical_section<T, F, OUTPUT>(handle: Handle<T>, f: F) -> OUTPUT
where
    T: ObjectContainer,
    F: Fn(&T) -> OUTPUT,
{
    loop {
        let status = T::object(&handle).status.compare_exchange(
            Status::Working,
            Status::Blocked,
            Ordering::SeqCst,
            Ordering::SeqCst,
        );

        if status.is_ok() {
            let v = f(&handle);

            T::object(&handle)
                .status
                .store(Status::Working, Ordering::SeqCst);

            notify(handle.clone());

            break v;
        }

        block_on(handle.clone()).expect("Failed to block on critical section");
    }
}

pub fn notify<T: ObjectContainer>(handle: Handle<T>) {
    SCHEDULER.access_lock().unblock_on(handle.as_addr());
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
pub fn remove_child(_child: RawHandle, _parent: RawHandle) {}
