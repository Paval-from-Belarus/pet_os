use crate::object::{Handle, KernelObject};

use super::Error;

pub struct IoEvent;

impl KernelObject for IoEvent {}

impl Handle<IoEvent> {
    pub fn wait(self) -> Result<(), Error> {
        todo!()
    }
}
