use crate::declare_constants;
use crate::memory::VirtualAddress;

mod vga;
mod keyboard;

pub fn register_display_driver() {}

#[repr(transparent)]
#[derive(Clone, Copy, PartialEq)]
pub struct Handle(VirtualAddress);

impl Handle {
    declare_constants!(
        pub Handle,
        KERNEL = Handle(0);
    );
}