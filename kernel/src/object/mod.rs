mod event;
mod handle;
pub mod runtime;

use core::{ptr::NonNull, sync::atomic::AtomicU16};

use kernel_macro::ListNode;
use kernel_types::collections::ListNode;

use crate::memory::{self, slab_alloc, Slab, SlabBox, VirtualAddress};

pub use handle::*;

pub struct AnyObject;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum Kind {
    BlockDeviceWork,
    FsWork,
    FileWork,
    IrqEvent,

    Queue,

    File,
    Mutex,
    //rendevouz oneshot channel
    Exchange,
}

#[derive(Debug, ListNode)]
#[repr(C)]
pub struct Object {
    #[list_pivots]
    node: ListNode<Object>,
    pub parent: Option<RawHandle>,

    pub kind: Kind,
    pub status: Status,

    pub ref_count: AtomicU16,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum Status {
    //the corresponding operation is ready
    Completed,
    //the operation when no block is performed
    Working,
    //the
    Blocked,
}

impl Object {
    fn new_root(kind: Kind) -> Self {
        Self {
            kind,
            parent: None,
            ref_count: AtomicU16::new(0),
            status: Status::Working,
            node: ListNode::empty(),
        }
    }

    fn new_child(kind: Kind, parent: RawHandle) -> Self {
        Self {
            kind,
            parent: parent.into(),
            ref_count: AtomicU16::new(0),
            status: Status::Working,
            node: ListNode::empty(),
        }
    }

    fn handle<T: ObjectContainer>(&self) -> Handle<T> {
        unsafe { Handle::from_raw_unchecked(self.raw_handle()) }
    }

    fn raw_handle(&self) -> RawHandle {
        self as *const Object as VirtualAddress
    }
}

pub trait ObjectContainer: Sized + Slab + 'static {
    const KIND: Kind;
    fn container_of(object: *mut Object) -> *mut Self;
    fn object(&self) -> &Object;
    fn object_mut(&mut self) -> &mut Object;

    fn new_object<T: ObjectContainer>(parent: &Handle<T>) -> Object {
        assert!(runtime::lookup(parent.clone().into_raw()));

        Object::new_child(Self::KIND, parent.clone().into_raw())
    }

    fn new_root_object() -> Object {
        Object::new_root(Self::KIND)
    }

    fn handle(&self) -> Handle<Self> {
        self.object().handle()
    }
}

// alloc new root object
// any root object can be used as parent for another objects
pub fn alloc_root_object<T: ObjectContainer + Slab + 'static>(
    value: T,
) -> Result<Handle<T>, memory::AllocError> {
    let object = slab_alloc(value)?;

    let leaked_object = unsafe { &mut *SlabBox::into_raw(object) };

    let raw_handle = runtime::register(leaked_object.object_mut());

    unsafe { Ok(Handle::from_raw_unchecked(raw_handle)) }
}

pub fn dealloc_root_object<T: ObjectContainer>(handle: Handle<T>) {
    let handle_cloned = handle.clone();

    let Some(object) = runtime::unregister(handle_cloned.into_raw()) else {
        panic!("No root object for handle: {:X?}", handle.into_raw());
    };

    let container =
        NonNull::new(T::container_of(object)).expect("Invalid container");

    let _ = memory::into_boxed(container);
}
