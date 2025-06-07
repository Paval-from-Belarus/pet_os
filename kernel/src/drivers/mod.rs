use alloc::sync::Arc;
use kernel_types::collections::LinkedList;
use kernel_types::drivers::{DeviceId, DriverId};
use module_info::Module;

use crate::common::atomics::UnsafeLazyCell;
use crate::current_task;
use crate::memory::ProcessId;

pub mod api;
mod auto_load;
mod generated;
mod loader;
mod module_info;

pub use module_info::*;

// mod disk;
// mod keyboard;
// mod memory;
// mod network;
// mod vga;

use generated::STATIC_DRIVERS;

// pub enum ModuleQueue {
//     Fs(Queue<FsWork>),
//     Block(Queue<block::WorkObject>),
//     Char(Queue<FileWork>),
// }

pub type ModuleId = ProcessId;
pub const KERNEL_MODULE: usize = 0;

pub struct ModuleManager {
    modules: spin::Mutex<LinkedList<'static, ModuleItem>>,
}

impl ModuleManager {
    pub fn from_modules(modules: LinkedList<'static, ModuleItem>) -> Self {
        Self {
            modules: spin::Mutex::new(modules),
        }
    }

    pub fn find_module(&self, id: ModuleId) -> Option<Arc<Module>> {
        self.modules
            .try_lock()
            .unwrap()
            .iter()
            .find(|item| item.state.id == id)
            .map(|item| item.state.clone())
    }
}

pub fn current_module() -> Option<Arc<Module>> {
    let module_id = current_task!()
        .process
        .clone()
        .map(|proc| proc.id)
        .unwrap_or(KERNEL_MODULE);

    MODULES.get().find_module(module_id)
}

unsafe impl Send for ModuleManager {}
unsafe impl Sync for ModuleManager {}

static MODULES: UnsafeLazyCell<ModuleManager> = UnsafeLazyCell::empty();

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

    MODULES.set(ModuleManager::from_modules(LinkedList::empty()));

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
