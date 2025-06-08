use crate::object::{KernelObject, RawHandle};

pub struct IoEvent;

impl KernelObject for IoEvent {}

impl From<RawHandle> for IoEvent {
    fn from(_: RawHandle) -> Self {
        todo!()
    }
}
