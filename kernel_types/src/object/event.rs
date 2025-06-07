use super::{KernelObject, RawHandle};

pub struct Event {
    handle: RawHandle,
}

impl From<RawHandle> for Event {
    fn from(handle: RawHandle) -> Self {
        Self { handle }
    }
}

impl KernelObject for Event {}

impl Event {
    pub fn new_event() -> io::Result<Self> {
        todo!()
    }
    pub fn block_on(&self) {}

    pub fn notify(&self) {}
}
