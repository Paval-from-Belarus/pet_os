use kernel_macro::ListNode;
use kernel_types::collections::{BoxedNode, ListNode};

use crate::{
    memory::{Kernel, SlabBox},
    object,
    task::TaskStatus,
};

use super::{BlockedTask, Task};

pub struct RunningTaskBox {
    pub node: SlabBox<RunningTask>,
}

#[derive(ListNode)]
pub struct RunningTask {
    #[list_pivots]
    pub node: ListNode<RunningTask>,
    pub task: Task,
}

impl RunningTaskBox {
    pub fn into_node(self) -> &'static mut ListNode<RunningTask> {
        unsafe { &mut *SlabBox::into_raw(self.node) }.as_node()
    }
}

impl RunningTask {
    pub fn into_blocked(&mut self, handle: object::Handle) -> &mut BlockedTask {
        self.task.status = TaskStatus::Blocked(handle);

        self
    }

    pub fn into_running(&mut self) -> &mut RunningTask {
        self.task.status = TaskStatus::Running;

        self
    }

    pub fn into_sleeping(&mut self, timeout: usize) -> &mut RunningTask {
        self.task.status = TaskStatus::Sleeping;
        self.task.start_time += timeout;

        self
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

impl core::ops::Deref for RunningTask {
    type Target = Task;

    fn deref(&self) -> &Self::Target {
        &self.task
    }
}

impl core::ops::DerefMut for RunningTask {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.task
    }
}
