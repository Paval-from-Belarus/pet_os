use alloc::sync::Arc;
use kernel_macro::ListNode;
use kernel_types::{
    collections::ListNode,
    drivers::{ModuleId, ModuleKind, UserModule},
};

use crate::{
    fs::{FileWork, FsWork},
    io::block,
    object::Handle,
    user::queue::Queue,
};

#[derive(ListNode)]
#[repr(C)]
pub struct ModuleItem {
    #[list_pivots]
    node: ListNode<ModuleItem>,
    pub state: Arc<Module>,
}

const MAX_MODULE_NAME_LEN: usize = 12;

#[repr(C)]
pub struct Module {
    pub id: ModuleId,
    pub name: heapless::String<MAX_MODULE_NAME_LEN>,
    pub queue: ModuleQueue,
}

#[derive(Clone)]
pub enum ModuleQueue {
    Fs(Handle<Queue<FsWork>>),
    Char(Handle<Queue<FileWork>>),
    Block(Handle<Queue<block::WorkObject>>),
}

impl Module {
    pub fn as_user_module(&self) -> kernel_types::drivers::UserModule {
        let queue_handle = self.queue.clone();

        let (raw_handle, kind) = match queue_handle {
            ModuleQueue::Fs(handle) => (handle.into_raw(), ModuleKind::Fs),
            ModuleQueue::Char(handle) => (handle.into_raw(), ModuleKind::Char),
            ModuleQueue::Block(handle) => {
                (handle.into_raw(), ModuleKind::Block)
            }
        };

        UserModule {
            id: self.id,
            kind,
            queue: unsafe {
                kernel_types::object::RawHandle::new_unchecked(raw_handle)
            },
        }
    }
}
