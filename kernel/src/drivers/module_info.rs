use alloc::sync::Arc;
use kernel_macro::ListNode;
use kernel_types::{collections::ListNode, fs::FileOperations};

use crate::{fs::FileWork, user::queue::Queue};

use super::ModuleId;

const MAX_MODULE_NAME_LEN: usize = 12;

#[derive(ListNode)]
pub struct ModuleItem {
    #[list_pivots]
    node: ListNode<ModuleItem>,
    pub state: Arc<Module>,
}

pub struct Module {
    //same as process id
    pub id: ModuleId,
    pub name: heapless::String<MAX_MODULE_NAME_LEN>,
    pub ops: ModuleOperations,
}

pub enum ModuleOperations {
    CharDeviceModule(CharDeviceModule),
}

pub struct CharDeviceModule {
    pub queue: Queue<FileWork>,
    pub ops: FileOperations,
}
