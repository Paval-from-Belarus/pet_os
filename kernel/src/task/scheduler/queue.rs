use kernel_types::collections::{BorrowingLinkedList, HashTable, LinkedList};

use crate::{
    memory::{slab_alloc, SlabBox},
    task::{RunningTask, TaskPriority},
};

const SCHEDULING_CONTEXT_SIZE: usize = 32;

pub struct TaskQueue {
    tasks: [LinkedList<'static, RunningTask>; SCHEDULING_CONTEXT_SIZE],
}

impl TaskQueue {
    pub fn new_leaked() -> &'static mut TaskQueue {
        let tasks = core::array::from_fn(|_| LinkedList::empty());

        let boxed = slab_alloc(Self { tasks }).unwrap();

        SlabBox::leak(boxed)
    }

    pub fn push(&mut self, task: &'static mut RunningTask) {
        let priority = task.priority;

        let index = priority.into_raw() as usize;

        self.tasks[index as usize].push_back(task.as_node());
    }

    pub fn take_next(&mut self) -> Option<&'static mut RunningTask> {
        todo!()
    }

    pub fn probe_next(&self) -> Option<&'static RunningTask> {
        todo!()
    }
}
