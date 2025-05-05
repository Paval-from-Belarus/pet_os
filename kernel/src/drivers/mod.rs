#![allow(unused)]

/// All drivers storing in
use core::ptr::NonNull;
use core::{mem, slice};

use alloc::sync::Arc;
use kernel_macro::{export_symbolic, ListNode};
use kernel_types::collections::{LinkedList, ListNode, Queue};
use kernel_types::declare_constants;
use kernel_types::drivers::{Device, DeviceId, DriverId, KernelSymbol};

use crate::common::atomics::SpinLockLazyCell;
use crate::fs::{
    FileOperations, FileSystem, FileSystemKind, IndexNode, IndexNodeItem,
    SuperBlock, SuperBlockOperations,
};
use crate::memory::{slab_alloc, ProcessId, SlabBox, VirtualAddress};
use crate::{get_eax, set_eax, set_edx};

mod api;
mod disk;
mod generated;
mod keyboard;
mod loader;
mod management;
mod memory;
mod network;
mod vga;

use generated::STATIC_DRIVERS;

pub type ModuleId = ProcessId;

pub struct AutoLoad {
    pub shout_down_count: usize,
}

pub fn auto_load() {}

pub fn fs() -> Arc<FileSystem> {
    let fs = FileSystem {
        name: "dev-fs".into(),
        kind: FileSystemKind::READ_ONLY,
        max_file_size: None,
        private: core::ptr::null_mut(),
        operations: SuperBlockOperations {
            create_node: todo!(),
            dirty_node: todo!(),
            destroy_node: todo!(),
        },
    };

    Arc::new(fs)
}

pub fn register_char_device_range(
    _id: DriverId,
    _count: usize,
    _name: &str,
) -> Result<(), ()> {
    Err(())
}

///return the lowest value of deviceId
pub fn alloc_char_device_range(
    _minor_base: usize,
    _count: usize,
    _name: &str,
) -> Result<DeviceId, ()> {
    Err(())
}

#[repr(C)]
pub struct StaticDriver {
    pub offset: *const u8,
    pub len: usize,
}

extern "Rust" {
    #[link_name = "symbol_table_start"]
    static SYMBOL_TABLE_START: *const KernelSymbol;
    #[link_name = "symbol_table_end"]
    static SYMBOL_TABLE_END: *const KernelSymbol;
}

pub fn init() {
    log::info!("Detected {} static drivers", STATIC_DRIVERS.len());

    for driver in STATIC_DRIVERS.iter() {
        let elf_data =
            unsafe { core::slice::from_raw_parts(driver.offset, driver.len) };
        let _ = loader::load_in_memory(elf_data).inspect_err(|cause| {
            log::warn!("Failed to load driver: {cause}");
        });
    }

    disk::init();
}

fn find_symbol(name: &str) -> Option<VirtualAddress> {
    let table_size =
        unsafe { SYMBOL_TABLE_END.offset_from_unsigned(SYMBOL_TABLE_START) };
    let symbol_table =
        unsafe { slice::from_raw_parts(SYMBOL_TABLE_START, table_size) };
    symbol_table
        .iter()
        .find(|entry| entry.has_same_name(name))
        .map(|entry| entry.offset())
}
