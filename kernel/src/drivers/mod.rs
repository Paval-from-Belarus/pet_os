use core::{mem, slice};

use kernel_macro::export_symbolic;
use kernel_types::{declare_constants, declare_types};
use kernel_types::drivers::{Device, KernelSymbol};

use crate::memory::VirtualAddress;
use crate::utils::atomics::SpinLockLazyCell;

mod vga;
mod keyboard;

#[export_symbolic]
pub fn register_display_driver() {}

#[export_symbolic]
pub fn io_remap() {}

#[export_symbolic]
pub fn io_unmap() {}


extern "Rust" {
    #[link_name = "symbol_table_start"]
    static SYMBOL_TABLE_START: *const KernelSymbol;
    #[link_name = "symbol_table_end"]
    static SYMBOL_TABLE_END: *const KernelSymbol;
}

pub fn init() {
    unsafe {
        let bytes_size = (SYMBOL_TABLE_END as *const u8).sub_ptr(SYMBOL_TABLE_START as *const u8);
        assert!(bytes_size % mem::size_of::<KernelSymbol>() == 0 && bytes_size > mem::size_of::<KernelSymbol>(), "Invalid Symbol table sizes");
    }
}

fn find_symbol(name: &str) -> Option<VirtualAddress> {
    let table_size = unsafe {
        SYMBOL_TABLE_END.sub_ptr(SYMBOL_TABLE_START)
    };
    let symbol_table = unsafe {
        slice::from_raw_parts(SYMBOL_TABLE_START, table_size)
    };
    symbol_table.iter()
                .find(|entry| entry.has_same_name(name))
                .map(|entry| entry.offset())
}
declare_constants! {
    pub usize,
    MAX_DEVICE_COUNT = 128;
}
declare_types! {
    pub Device as new,
    TTY = 4 , "The terminal";
    SCSI = 8, "The hard drive";
}
static DRIVERS_TABLE: SpinLockLazyCell<[VirtualAddress; MAX_DEVICE_COUNT]> = SpinLockLazyCell::empty();

#[repr(transparent)]
#[derive(Clone, Copy, PartialEq)]
#[deprecated]
pub struct Handle(VirtualAddress);

impl Handle {
    declare_constants!(
        pub Handle,
        KERNEL = Handle(0);
    );
}
