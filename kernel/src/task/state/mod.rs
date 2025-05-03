mod running;

use core::{mem, ptr::NonNull};

use kernel_macro::ListNode;
use kernel_types::collections::{HashData, ListNode};
use static_assertions::const_assert;

use crate::{
    memory::{slab_alloc, Page, ProcessStateLock, Slab, VirtualAddress},
    object,
};

use super::{FilePool, TaskContext, TaskFileSystem, TaskPriority, TaskStatus};

pub use running::{RunningTask, RunningTaskBox};

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
    /// The base execution duration for task
    pub base_duration: usize,
}

pub type TaskId = usize;

#[repr(C)]
pub struct Task {
    //the pivots in scheduler list
    pub priority: TaskPriority,
    pub status: TaskStatus,
    //the bottom of the thread's kernel stack
    //that is, last byt is kernel_stack + TASK_STACK_SIZE
    //that's also the place where TaskContext is storing
    pub kernel_stack_bottom: VirtualAddress,
    //the unique identifier of thread
    pub id: TaskId,
    //the time when task should be started
    //the value should be greater then 0
    pub start_time: usize,
    //the process context for thread
    pub state: Option<&'static ProcessStateLock>,
    pub file_system: NonNull<TaskFileSystem>,

    pub metrics: TaskMetrics,

    pub opened_files: FilePool,
}

pub type BlockedTask = RunningTask;

#[derive(ListNode)]
pub struct ProccessTask {
    #[list_pivots]
    node: ListNode<ProccessTask>,
}

impl HashData for BlockedTask {
    type Item<'a> = object::RawHandle;

    fn key<'a>(&self) -> &Self::Item<'a> {
        todo!()
    }
}

impl Slab for RunningTask {
    const NAME: &str = "task";
}

const_assert!(mem::size_of::<Task>() < Page::SIZE);

impl Task {
    pub fn new_boxed(
        id: usize,
        kernel_stack: VirtualAddress,
        priority: TaskPriority,
    ) -> RunningTaskBox {
        let context = TaskContext::zeroed();
        unsafe { (kernel_stack as *mut TaskContext).write(context) };

        let task = Task {
            kernel_stack_bottom: kernel_stack,
            id,
            priority,
            status: TaskStatus::Embryo,
            start_time: 0,
            state: None,
            opened_files: Default::default(),
            file_system: NonNull::dangling(),

            metrics: TaskMetrics {
                elapsed: 0,
                lock_count: 0,
                exec_count: 0,
                jump_ratio: 0,
                base_duration: priority.static_duration(),
            },
        };

        RunningTaskBox {
            node: slab_alloc(RunningTask {
                node: ListNode::empty(),
                task,
            })
            .unwrap(),
        }
    }

    pub fn context_ptr(&self) -> *mut TaskContext {
        self.kernel_stack_bottom as *mut TaskContext
    }

    pub fn context(&self) -> &TaskContext {
        unsafe { &*(self.kernel_stack_bottom as *const TaskContext) }
    }

    pub fn context_mut(&mut self) -> &mut TaskContext {
        unsafe { &mut *(self.kernel_stack_bottom as *mut TaskContext) }
    }
}
