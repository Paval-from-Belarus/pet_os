use alloc::sync::Arc;
use kernel_macro::ListNode;
use kernel_types::{
    collections::{BoxedNode, ListNode},
    drivers::{ModuleId, ModuleKind, UserModule},
};

use crate::{
    current_task,
    fs::{FileWork, FsWork},
    io::block,
    memory::{self, AllocError, Slab, SlabBox},
    object::Handle,
    user::queue::Queue,
};

use super::KERNEL_MODULE;

pub struct ModuleItemBox {
    pub item: SlabBox<ModuleItem>,
}

#[derive(ListNode)]
#[repr(C)]
pub struct ModuleItem {
    #[list_pivots]
    node: ListNode<ModuleItem>,
    pub state: Arc<Module>,
}

impl Slab for ModuleItem {
    const NAME: &str = "module_item";
}

impl ModuleItem {
    pub fn new_boxed(module: Module) -> Result<ModuleItemBox, AllocError> {
        let state = Arc::try_new(module)?;

        let item = memory::slab_alloc(Self {
            state,
            node: ListNode::empty(),
        })?;

        Ok(ModuleItemBox { item })
    }
}

impl ModuleItemBox {
    pub fn into_node(self) -> &'static mut ListNode<ModuleItem> {
        unsafe { &mut *SlabBox::into_raw(self.item) }.as_node()
    }
}

impl BoxedNode for ModuleItem {
    type Target = SlabBox<ModuleItem>;

    fn into_boxed(node: &mut Self::Item) -> Self::Target {
        memory::into_boxed(node.into())
    }
}
pub const MAX_MODULE_NAME_LEN: usize = 12;

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
    Block(Handle<Queue<block::BlockWork>>),
}

impl Module {
    pub fn new(
        name: &str,
        kind: ModuleKind,
        capacity: usize,
    ) -> Result<Self, AllocError> {
        let queue = match kind {
            ModuleKind::Fs => ModuleQueue::Fs(Queue::new_bounded(capacity)?),
            ModuleKind::Char => {
                ModuleQueue::Char(Queue::new_bounded(capacity)?)
            }
            ModuleKind::Block => {
                ModuleQueue::Block(Queue::new_bounded(capacity)?)
            }
        };

        let id = current_task!()
            .process
            .clone()
            .map(|proc| proc.id)
            .unwrap_or(KERNEL_MODULE);

        let len = usize::min(name.len(), MAX_MODULE_NAME_LEN);
        let concated_name = &name[..len];

        Ok(Self {
            queue,
            id,
            name: concated_name.into(),
        })
    }
    pub fn as_user_module(&self) -> kernel_types::drivers::UserModule {
        let queue_handle = self.queue.clone();

        let (raw_handle, kind) = match queue_handle {
            ModuleQueue::Fs(handle) => (handle.into_addr(), ModuleKind::Fs),
            ModuleQueue::Char(handle) => (handle.into_addr(), ModuleKind::Char),
            ModuleQueue::Block(handle) => {
                (handle.into_addr(), ModuleKind::Block)
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
