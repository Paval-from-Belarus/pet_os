use crate::common::atomics::UnsafeLazyCell;
use crate::current_task;
use alloc::sync::Arc;
use kernel_types::collections::LinkedList;
pub use kernel_types::drivers::ModuleId;
use kernel_types::drivers::ModuleKind;

pub mod api;
mod auto_load;
mod dev_fs;
mod error;
mod generated;
mod loader;
mod module_info;

pub use error::*;
pub use module_info::*;

use generated::STATIC_DRIVERS;

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

    pub fn find_module_by_name(&self, name: &str) -> Option<Arc<Module>> {
        self.modules
            .try_lock()
            .unwrap()
            .iter()
            .find(|item| item.state.name.eq(name))
            .map(|item| item.state.clone())
    }

    pub fn add_module(&self, module: Module) -> Result<(), ModuleError> {
        let item = ModuleItem::new_boxed(module)?;

        let mut modules = self.modules.try_lock().unwrap();

        let has_found = modules
            .iter()
            .any(|m| m.state.name.eq(&item.item.state.name));

        if has_found {
            return Err(ModuleError::UniqueError);
        }

        modules.push_back(item.into_node());

        Ok(())
    }
}

pub fn find_by_name<T: AsRef<str>>(name: T) -> Option<Arc<Module>> {
    MODULES.get().find_module_by_name(name.as_ref())
}

pub fn current_module() -> Option<Arc<Module>> {
    let module_id = current_task!()
        .process
        .clone()
        .map(|proc| proc.id)
        .unwrap_or(KERNEL_MODULE);

    MODULES.get().find_module(module_id)
}

pub fn init_module(
    name: &str,
    kind: ModuleKind,
    capacity: usize,
) -> Result<(), ModuleError> {
    log::debug!("new module detected: {name}");

    let module = Module::new(name, kind, capacity)?;

    MODULES.get().add_module(module)?;

    log::debug!("new module added: {name}");

    Ok(())
}

unsafe impl Send for ModuleManager {}
unsafe impl Sync for ModuleManager {}

static MODULES: UnsafeLazyCell<ModuleManager> = UnsafeLazyCell::empty();

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

    dev_fs::spawn_task().expect("Failed to init dev fs");
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
