use alloc::sync::Arc;
use kernel_macro::ListNode;
use kernel_types::collections::ListNode;

use super::ModuleId;

const MAX_MODULE_NAME_LEN: usize = 12;

#[derive(ListNode)]
#[repr(C)]
pub struct ModuleItem {
    #[list_pivots]
    node: ListNode<ModuleItem>,
    pub state: Arc<Module>,
}

#[repr(C)]
pub struct Module {
    //same as process id
    pub id: ModuleId,
    pub name: heapless::String<MAX_MODULE_NAME_LEN>,
}
