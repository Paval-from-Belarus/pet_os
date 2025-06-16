use crate::common::atomics::UnsafeLazyCell;
use crate::current_task;
use crate::error::KernelError;
use crate::io::InterruptableLazyCell;
use crate::object::Handle;
use crate::task::Event;
use alloc::string::String;
use alloc::sync::Arc;
use alloc::vec::Vec;
use kernel_types::collections::LinkedList;
pub use kernel_types::drivers::ModuleId;
use kernel_types::drivers::ModuleKind;

pub mod api;
mod auto_load;
mod dev_fs;
mod error;
mod fat_fs;
mod generated;
mod loader;
mod module_info;

pub use error::*;
pub use loader::run_process_task;
pub use module_info::*;

use generated::STATIC_DRIVERS;

pub const KERNEL_MODULE: usize = 0;

pub struct ModuleManager {
    modules: InterruptableLazyCell<LinkedList<'static, ModuleItem>>,
    mount: Handle<Event>,
}

impl ModuleManager {
    pub fn new(
        modules: LinkedList<'static, ModuleItem>,
    ) -> Result<Self, KernelError> {
        Ok(Self {
            modules: InterruptableLazyCell::new(modules),
            mount: Event::new()?,
        })
    }

    pub fn find_module(&self, id: ModuleId) -> Option<Arc<Module>> {
        self.modules
            .lock()
            .iter()
            .find(|item| item.state.id == id)
            .map(|item| item.state.clone())
    }

    pub fn find_module_by_name(&self, name: &str) -> Option<Arc<Module>> {
        self.modules
            .lock()
            .iter()
            .find(|item| item.state.name.eq(name))
            .map(|item| item.state.clone())
    }

    pub fn add_module(&self, module: Module) -> Result<(), ModuleError> {
        let item = ModuleItem::new_boxed(module)?;

        let mut modules = self.modules.lock();

        let has_found = modules
            .iter()
            .any(|m| m.state.name.eq(&item.item.state.name));

        if has_found {
            return Err(ModuleError::UniqueError);
        }

        modules.push_back(item.into_node());

        if modules.len() == STATIC_DRIVERS.len() {
            self.mount.set();
        }

        Ok(())
    }
}

pub fn find_by_name<T: AsRef<str>>(name: T) -> Option<Arc<Module>> {
    MODULES.get().find_module_by_name(name.as_ref())
}

pub struct ModuleEntry {
    pub name: heapless::String<12>,
    pub status: &'static str,
}

pub fn modules() -> Vec<ModuleEntry> {
    MODULES
        .get()
        .modules
        .lock()
        .iter()
        .map(|m| ModuleEntry {
            name: m.state.name.clone(),
            status: "Ok",
        })
        .collect()
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
    ctx: *const (),
    kind: ModuleKind,
    capacity: usize,
) -> Result<(), ModuleError> {
    log::debug!("new module detected: {name}");

    let module = Module::new(name, ctx, kind, capacity)?;

    MODULES.get().add_module(module)?;

    log::debug!("new module added: {name}");

    Ok(())
}

pub fn ready_event() -> Handle<Event> {
    MODULES.get().mount.clone()
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

    let modules = ModuleManager::new(LinkedList::empty()).unwrap();

    MODULES.set(modules);

    auto_load::spawn_task().expect("Failed to init autoload task");

    dev_fs::spawn_task().expect("Failed to init dev fs");

    fat_fs::spawn_task().expect("Failed to init fat fs");
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
