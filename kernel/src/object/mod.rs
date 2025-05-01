mod runtime;

use kernel_macro::ListNode;
use kernel_types::collections::{HashCode, HashKey, ListNode};

use crate::memory::VirtualAddress;

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd)]
#[must_use]
pub struct Handle(pub VirtualAddress);

#[derive(Debug, ListNode)]
#[repr(C)]
pub struct Object {
    #[list_pivots]
    node: ListNode<Object>,
    pub kind: Kind,
    pub status: Status,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Status {
    //the corresponding operation is ready
    Completed,
    //the operation
    InProgress,
    //the
    Blocked,
}

impl Object {
    pub fn new_in_progress(kind: Kind) -> Self {
        Self {
            kind,
            status: Status::InProgress,
            node: ListNode::empty(),
        }
    }

    pub fn handle<T: ObjectContainer>(&self) -> Handle {
        let container = T::container_of(self);

        Handle(container as VirtualAddress)
    }
}

pub trait ObjectContainer {
    fn container_of(object: *const Object) -> *const Self;
}

#[derive(Debug)]
#[repr(u8)]
pub enum Kind {
    IoWork,
    FsWork,

    //synchronization primitive (such as mutex)
    Sync,
}

impl HashKey for Handle {
    fn hash_code(&self) -> HashCode {
        self.0 as HashCode
    }
}

impl Handle {
    pub unsafe fn cast<T: ObjectContainer>(&self) -> *mut T {
        self.0 as *mut T
    }
}
