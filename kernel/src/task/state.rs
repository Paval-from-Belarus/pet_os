use core::{
    mem,
    ptr::{self, NonNull},
};

use alloc::sync::Arc;
use kernel_macro::ListNode;
use kernel_types::collections::{BoxedNode, ListNode};
use static_assertions::const_assert;

use crate::memory::{
    slab_alloc, Kernel, Page, ProcessState, Slab, SlabBox, VirtualAddress,
};

use super::{FilePool, TaskContext, TaskFileSystem, TaskPriority, TaskStatus};

#[repr(C)]
pub struct TaskMetrics {
    /// The kernel lock's count
    pub lock_count: usize,
    /// The count of full execution
    pub exec_count: usize,
    /// the working time of thread (usize::max if too much)
    pub elapsed: usize,

    //the ratio to incrase time quantum according
    //task history
    pub jump_ratio: usize,
}

#[repr(C)]
pub struct Task {
    //the pivots in scheduler list
    pub priority: TaskPriority,
    pub status: TaskStatus,
    //the bottom of the thread's kernel stack
    //that is, last byt is kernel_stack + TASK_STACK_SIZE
    pub kernel_stack: VirtualAddress,
    pub context: *mut TaskContext,
    //the unique identifier of thread
    pub id: usize,
    //the time when task should be started
    //the value should be greater then 0
    pub start_time: usize,
    //the process context for thread
    pub state: Option<&'static mut ProcessState>,
    pub file_system: NonNull<TaskFileSystem>,

    /// The base execution duration for task
    pub base_duration: u32,
    pub metrics: TaskMetrics,

    pub files: NonNull<FilePool>,
    //todo: consider to add namespace field
}

pub type TaskBox = RunningTaskBox;

pub struct RunningTaskBox {
    node: SlabBox<RunningTask>,
}

impl RunningTaskBox {
    pub fn into_node(self) -> &'static mut ListNode<RunningTask> {
        unsafe { &mut *SlabBox::into_raw(self.node) }.as_node()
    }
}

impl BoxedNode for RunningTask {
    type Target = RunningTaskBox;

    fn into_boxed(
        node: &mut <RunningTask as kernel_types::collections::TinyListNodeData>::Item,
    ) -> Self::Target {
        let node = unsafe { SlabBox::from_raw_in(node, Kernel) };

        Self::Target { node }
    }
}

#[derive(ListNode)]
pub struct RunningTask {
    #[list_pivots]
    node: ListNode<RunningTask>,
    pub lock: Arc<spin::RwLock<Task>>,
}

impl Clone for RunningTask {
    fn clone(&self) -> Self {
        Self {
            node: unsafe { ListNode::empty() },
            lock: Arc::clone(&self.lock),
        }
    }
}

impl Slab for Task {
    const NAME: &str = "task";
}

const_assert!(mem::size_of::<Task>() < Page::SIZE);

impl Task {
    pub fn new_boxed(
        id: usize,
        kernel_stack: VirtualAddress,
        priority: TaskPriority,
    ) -> TaskBox {
        let lock = Arc::new(spin::RwLock::new(Task {
            kernel_stack,
            id,
            priority,
            status: TaskStatus::Embryo,
            context: ptr::null_mut(),
            start_time: 0,
            state: None,
            files: NonNull::dangling(),
            file_system: NonNull::dangling(),

            base_duration: 100,
            metrics: TaskMetrics {
                elapsed: 0,
                lock_count: 0,
                exec_count: 0,
                jump_ratio: 0,
            },
        }));

        TaskBox {
            node: slab_alloc(RunningTask {
                node: unsafe { ListNode::empty() },
                lock,
            })
            .unwrap(),
        }
    }
}
