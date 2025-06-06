use alloc::sync::Arc;
use kernel_macro::ListNode;
use kernel_types::collections::{LinkedList, ListNode};
use kernel_types::drivers::{DeviceId, DriverId};
use kernel_types::fs::{FileOperations, FileSystem, FileSystemKind};

use crate::fs::{FileWork, FsWork};
use crate::io::block;
use crate::memory::ProcessId;
use crate::user::queue::Queue;

pub mod api;
mod auto_load;
mod generated;
mod loader;
mod module_task;

// mod disk;
// mod keyboard;
// mod memory;
// mod network;
// mod vga;

use generated::STATIC_DRIVERS;

const MAX_MODULE_NAME_LEN: usize = 12;

#[derive(ListNode)]
pub struct Module {
    #[list_pivots]
    node: ListNode<Module>,
    //same as process id
    pub id: ModuleId,
    pub name: heapless::String<MAX_MODULE_NAME_LEN>,
    pub ops: ModuleOperations,
}

pub enum ModuleOperations {
    CharDeviceModule(CharDeviceModule),
}

pub struct CharDeviceModule {
    pub ops: FileOperations,
}

pub enum ModuleQueue {
    Fs(Queue<FsWork>),
    Block(Queue<block::WorkObject>),
    Char(Queue<FileWork>),
}

pub type ModuleId = ProcessId;

pub struct ModuleManager {
    modules: spin::RwLock<LinkedList<'static, Module>>,
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

pub fn init() {
    log::info!("Detected {} static drivers", STATIC_DRIVERS.len());

    for driver in STATIC_DRIVERS.iter() {
        let elf_data =
            unsafe { core::slice::from_raw_parts(driver.offset, driver.len) };
        let _ = loader::load_in_memory(elf_data).inspect_err(|cause| {
            log::warn!("Failed to load driver: {cause}");
        });
    }

    auto_load::spawn_task().expect("Failed to init autoload task");
}

// extern "Rust" {
//     #[link_name = "symbol_table_start"]
//     static SYMBOL_TABLE_START: *const KernelSymbol;
//     #[link_name = "symbol_table_end"]
//     static SYMBOL_TABLE_END: *const KernelSymbol;
// }
//
// fn find_symbol(name: &str) -> Option<VirtualAddress> {
//     let table_size =
//         unsafe { SYMBOL_TABLE_END.offset_from_unsigned(SYMBOL_TABLE_START) };
//     let symbol_table =
//         unsafe { slice::from_raw_parts(SYMBOL_TABLE_START, table_size) };
//     symbol_table
//         .iter()
//         .find(|entry| entry.has_same_name(name))
//         .map(|entry| entry.offset())
// }
