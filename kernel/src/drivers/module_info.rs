use alloc::{boxed::Box, sync::Arc};
use kernel_macro::ListNode;
use kernel_types::{
    collections::{BoxedNode, ListNode},
    drivers::{ModuleId, ModuleKind, UserModule},
    object::{OpStatus, RawHandle},
};

use crate::{
    current_task,
    error::KernelError,
    fs::{FileWork, FsWork, IndexNode},
    io::{
        block::{self, BlockWork},
        InterruptableLazyCell, ModuleIrqContext,
    },
    memory::{self, AllocError, Slab, SlabBox},
    object::{Handle, ObjectContainer},
    task,
    user::{kernel_buf::KernelBuf, queue::Queue},
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
    pub ctx: *const (),
    irq_ctx: InterruptableLazyCell<Option<Arc<ModuleIrqContext>>>,
}

impl Module {
    pub fn kind(&self) -> ModuleKind {
        match self.queue {
            ModuleQueue::Fs(_) => ModuleKind::Fs,
            ModuleQueue::Char(_) => ModuleKind::Char,
            ModuleQueue::Block(_, _) => ModuleKind::Block,
        }
    }

    pub fn set_irq_ctx(&self, irq_ctx: Arc<ModuleIrqContext>) {
        let mut lock = self.irq_ctx.lock();
        *lock = Some(irq_ctx);
    }

    pub fn irq_ctx(&self) -> Option<Arc<ModuleIrqContext>> {
        self.irq_ctx.lock().clone()
    }

    pub fn file_ctx(&self) -> *const () {
        self.ctx
    }
}

#[derive(Clone)]
pub enum ModuleQueue {
    Fs(Handle<Queue<FsWork>>),
    Char(Handle<Queue<FileWork>>),
    Block(Handle<Queue<block::BlockWork>>, Handle<Queue<FileWork>>),
}

impl ModuleQueue {
    pub fn into_file_queue(self) -> Option<RawHandle> {
        match self {
            ModuleQueue::Fs(_) => None,
            ModuleQueue::Char(file_queue)
            | ModuleQueue::Block(_, file_queue) => Some(file_queue.into_raw()),
        }
    }
}

pub struct QueueExchange<TX: ObjectContainer, RX: ObjectContainer> {
    pub tx: Handle<Queue<TX>>,
    pub rx: Handle<Queue<RX>>,
}

pub struct BlkFile {
    pub sector: u32,
    pub disk_buf: Handle<KernelBuf>,
}

pub extern "C" fn blk_exchange(ctx: *const ()) {
    log::debug!("blk_exchange #{} started", current_task!().id);

    use kernel_types::fs::{FileRequest, FileResponse};

    let xchg = unsafe {
        Box::from_raw(ctx as *mut QueueExchange<block::BlockWork, FileWork>)
    };

    loop {
        let Some(file_work) = xchg.rx.blocking_pop() else {
            break;
        };

        match file_work.take_request() {
            FileRequest::Command { command, .. } => {
                let req = block::Request {
                    disk: 0,
                    work: block::Work::Passthrough { cmd: command },
                };

                let work =
                    unsafe { BlockWork::new_boxed(req, &xchg.tx).unwrap() };

                let work = xchg.tx.push(work);

                match work.wait().unwrap().status() {
                    Ok(_) => file_work.send_response(FileResponse::Completed),
                    Err(status) => file_work.send_response(status.into()),
                }
            }

            FileRequest::Read { file, buf } => {
                let file = Handle::<IndexNode>::from_raw(file);
                let buf = Handle::<KernelBuf>::from_raw(buf);

                let ctx = unsafe { &mut *(file.ctx as *mut BlkFile) };

                ctx.disk_buf.reset();

                let req = block::Request {
                    disk: 0,
                    work: block::Work::Read {
                        sector: ctx.sector,
                        buffer: ctx.disk_buf.handle().into_raw(),
                    },
                };

                let work =
                    unsafe { BlockWork::new_boxed(req, &xchg.tx).unwrap() };

                let work = xchg.tx.push(work);

                match work.wait().unwrap().status() {
                    Ok(_) => {
                        let bytes = &ctx.disk_buf.as_slice()
                            [0..usize::min(buf.capacity(), 512)];
                        if buf.copy_from(bytes).is_err() {
                            file_work.send_response(OpStatus::NoSpace.into());
                        } else {
                            file_work.send_response(FileResponse::Completed);
                        }
                    }
                    Err(status) => {
                        file_work.send_response(status.into());
                    }
                }

                ctx.sector += 1;
            }

            FileRequest::Write { file, buf } => {
                let file = Handle::<IndexNode>::from_raw(file);
                let buf = Handle::<KernelBuf>::from_raw(buf);

                let ctx = unsafe { &mut *(file.ctx as *mut BlkFile) };

                ctx.disk_buf.reset();

                let bytes = buf.as_slice();

                ctx.disk_buf.copy_from(&bytes).unwrap();

                drop(bytes);

                ctx.disk_buf.fill_with(0);

                let req = block::Request {
                    disk: 0,
                    work: block::Work::Write {
                        sector: ctx.sector,
                        buffer: ctx.disk_buf.handle().into_raw(),
                    },
                };

                let work =
                    unsafe { BlockWork::new_boxed(req, &xchg.tx).unwrap() };

                let work = xchg.tx.push(work);
                match work.wait().unwrap().status() {
                    Ok(_) => file_work.send_response(FileResponse::Completed),
                    Err(status) => file_work.send_response(status.into()),
                }

                ctx.sector += 1;
            }
        };
    }
}

pub fn spawn_block_exchange(
    capacity: usize,
) -> Result<(ModuleQueue, *const ()), KernelError> {
    let blk_q = Queue::<block::BlockWork>::new_bounded(capacity)?;
    let file_q = Queue::<FileWork>::new_bounded(capacity)?;

    let xchg_ctx = Box::try_new(QueueExchange {
        tx: blk_q.clone(),
        rx: file_q.clone(),
    })?;

    let file_ctx = Box::try_new(BlkFile {
        disk_buf: KernelBuf::new(512)?,
        sector: 0,
    })?;

    let xchg_task = task::new_task(
        blk_exchange,
        Box::into_raw(xchg_ctx) as *const (),
        task::TaskPriority::Module(5),
    )?;

    task::submit_task(xchg_task);

    Ok((
        ModuleQueue::Block(blk_q, file_q),
        Box::into_raw(file_ctx) as *const (),
    ))
}

impl Module {
    pub fn new(
        name: &str,
        mut ctx: *const (),
        kind: ModuleKind,
        capacity: usize,
    ) -> Result<Self, KernelError> {
        let queue = match kind {
            ModuleKind::Fs => ModuleQueue::Fs(Queue::new_bounded(capacity)?),
            ModuleKind::Char => {
                ModuleQueue::Char(Queue::new_bounded(capacity)?)
            }
            ModuleKind::Block => {
                let (queue, xchg_ctx) = spawn_block_exchange(capacity)?;

                ctx = xchg_ctx;

                queue
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
            id,
            ctx,
            queue,
            name: concated_name.into(),
            irq_ctx: InterruptableLazyCell::new(None),
        })
    }
    pub fn as_user_module(&self) -> kernel_types::drivers::UserModule {
        let queue_handle = self.queue.clone();

        let (raw_handle, kind) = unsafe {
            match queue_handle {
                ModuleQueue::Fs(handle) => (handle.into_addr(), ModuleKind::Fs),
                ModuleQueue::Char(handle) => {
                    (handle.into_addr(), ModuleKind::Char)
                }
                ModuleQueue::Block(handle, _) => {
                    (handle.into_addr(), ModuleKind::Block)
                }
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
