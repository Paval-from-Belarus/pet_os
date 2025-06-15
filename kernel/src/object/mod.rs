mod handle;
pub mod runtime;
mod user_handle;
mod work;

use core::{ptr::NonNull, sync::atomic::AtomicU16};

use kernel_macro::ListNode;
use kernel_types::collections::ListNode;

use crate::memory::{self, slab_alloc, Slab, SlabBox, VirtualAddress};

pub use handle::*;
pub use user_handle::*;

pub struct AnyObject;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum Kind {
    BlockDeviceWork,
    FsWork,
    FileLookupWork,
    FileWork,

    IrqEvent,

    Queue,
    SuperBlock,
    File,
    Mutex,
    Event,

    KernelBuf,
}

#[derive(Debug, ListNode)]
#[repr(C)]
pub struct Object {
    #[list_pivots]
    node: ListNode<Object>,
    pub parent: Option<RawHandle>,

    pub kind: Kind,
    pub status: AtomicStatus,

    pub ref_count: AtomicU16,
}

pub enum DetachError {
    NoParent,
}

#[atomic_enum::atomic_enum]
#[derive(PartialEq, Eq)]
#[repr(u8)]
pub enum Status {
    //the corresponding operation is ready
    Completed = 1,
    //the operation when no block is performed
    Working = 2,
    //the
    Blocked = 3,
}

impl Object {
    fn new_root(kind: Kind) -> Self {
        Self {
            kind,
            parent: None,
            ref_count: AtomicU16::new(0),
            status: AtomicStatus::new(Status::Working),
            node: ListNode::empty(),
        }
    }

    fn new_child(kind: Kind, parent: RawHandle) -> Self {
        Self {
            kind,
            parent: parent.into(),
            ref_count: AtomicU16::new(1),
            status: AtomicStatus::new(Status::Working),
            node: ListNode::empty(),
        }
    }

    pub fn handle<T: ObjectContainer>(&self) -> Handle<T> {
        Handle::from_addr(self.raw_handle()).unwrap()
    }

    pub fn raw_handle(&self) -> RawHandle {
        self as *const Object as VirtualAddress
    }
}

pub trait ObjectContainer: Sized + Slab + 'static {
    const KIND: Kind;
    fn container_of(object: *mut Object) -> *mut Self;
    fn object(&self) -> &Object;
    fn object_mut(&mut self) -> &mut Object;

    fn new_object<T: ObjectContainer>(parent: &Handle<T>) -> Object {
        assert!(runtime::lookup(parent.clone()));

        Object::new_child(Self::KIND, parent.as_addr())
    }

    fn attach_to_parent<T: ObjectContainer>(&mut self, parent: &Handle<T>) {
        assert!(runtime::lookup(parent.clone()));

        *self.object_mut() = Object::new_child(Self::KIND, parent.as_addr())
    }

    //detach given object from paret
    fn detatch(&mut self) -> Result<(), DetachError> {
        let Some(parent) = self.object_mut().parent.take() else {
            return Err(DetachError::NoParent);
        };

        runtime::remove_child(self.object().raw_handle(), parent);

        Ok(())
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

    Ok(Handle::from_addr(raw_handle).unwrap())
}

pub fn dealloc_root_object<T: ObjectContainer>(handle: Handle<T>) {
    let handle_cloned = handle.clone();

    let Some(object) = runtime::unregister(handle_cloned.as_addr()) else {
        panic!("No root object for handle: 0x{:x?}", handle.as_addr());
    };

    let container =
        NonNull::new(T::container_of(object)).expect("Invalid container");

    let _ = memory::into_boxed(container);
}
