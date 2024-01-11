use core::{mem, slice};
use kernel_macro::export_symbolic;
use kernel_types::drivers::KernelSymbol;

use crate::declare_constants;
use crate::memory::VirtualAddress;

mod vga;
mod keyboard;

#[export_symbolic]
pub fn register_display_driver() {}

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

fn find_symbol(name: &str) -> bool {
    let table_size = unsafe {
        SYMBOL_TABLE_END.sub_ptr(SYMBOL_TABLE_START)
    };
    let symbol_table = unsafe {
        slice::from_raw_parts(SYMBOL_TABLE_START, table_size)
    };
    symbol_table.iter()
        .any(|entry| entry.has_name(name))
}

#[repr(transparent)]
#[derive(Clone, Copy, PartialEq)]
pub struct Handle(VirtualAddress);

impl Handle {
    declare_constants!(
        pub Handle,
        KERNEL = Handle(0);
    );
}