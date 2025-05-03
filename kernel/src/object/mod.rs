mod event;
mod handle;
mod queue;
pub mod runtime;

use kernel_macro::ListNode;
use kernel_types::collections::ListNode;

use crate::memory::{self, slab_alloc, Slab, SlabBox, VirtualAddress};

pub use handle::Handle;

#[derive(Debug)]
#[repr(u8)]
pub enum Kind {
    IoWork,
    FsWork,

    Mutex,
    Queue,
    //rendevouz oneshot channel
    Exchange,
}

#[derive(Debug, ListNode)]
#[repr(C)]
pub struct Object {
    #[list_pivots]
    node: ListNode<Object>,
    pub parent: Option<Handle>,
    pub kind: Kind,
    pub status: Status,
}

impl Slab for Object {
    const NAME: &str = "kobject";
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Status {
    //the corresponding operation is ready
    Completed,
    //the operation when no block is performed
    Working,
    //the
    Blocked,
}

impl Object {
    fn new_root(kind: Kind) -> Result<SlabBox<Self>, memory::AllocError> {
        slab_alloc(Self {
            kind,
            parent: None,
            status: Status::Working,
            node: ListNode::empty(),
        })
    }

    fn new_child(kind: Kind, parent: Handle) -> Self {
        Self {
            kind,
            parent: parent.into(),
            status: Status::Working,
            node: ListNode::empty(),
        }
    }

    pub fn handle(&self) -> Handle {
        Handle(self as *const Object as VirtualAddress)
    }
}

pub trait ObjectContainer {
    const KIND: Kind;
    fn container_of(object: *mut Object) -> *mut Self;
    fn object(&self) -> &Object;

    fn new_object(parent: Handle) -> Object {
        assert!(runtime::lookup(parent));

        Object::new_child(Self::KIND, parent)
    }

    fn handle(&self) -> Handle {
        self.object().handle()
    }
}

// alloc new root object
// any root object can be used as parent for another objects
pub fn alloc_root_object(kind: Kind) -> Result<Handle, memory::AllocError> {
    let object = Object::new_root(kind)?;

    let leaked_object = unsafe { &mut *SlabBox::into_raw(object) };

    Ok(runtime::register(leaked_object))
}

pub fn dealloc_root_object(handle: Handle) {
    let Some(leaked_object) = runtime::unregister(handle) else {
        panic!("No root object for handle: {handle:?}");
    };

    let _ = memory::into_boxed(leaked_object.into());
}
