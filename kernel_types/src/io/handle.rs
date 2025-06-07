use crate::object::{Handle, KernelObject, RawHandle};

use super::Error;

pub struct IoEvent;

impl KernelObject for IoEvent {}

impl From<RawHandle> for IoEvent {
    fn from(_: RawHandle) -> Self {
        todo!()
    }
}

impl Handle<IoEvent> {
    pub fn wait(self) -> Result<(), Error> {
        todo!()
    }
}
