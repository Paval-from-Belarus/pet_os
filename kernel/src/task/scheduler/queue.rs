use kernel_types::collections::{BorrowingLinkedList, HashTable, LinkedList};

use crate::{
    memory::{slab_alloc, Slab, SlabBox},
    task::{RunningTask, TaskPriority},
};

const SCHEDULING_CONTEXT_SIZE: usize = 32;

pub struct TaskQueue {
    tasks: [LinkedList<'static, RunningTask>; SCHEDULING_CONTEXT_SIZE],
}

impl Slab for TaskQueue {
    const NAME: &str = "task_queue";
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

        self.tasks[index].push_back(task.as_node());
    }

    pub fn take_next(&mut self) -> Option<&'static mut RunningTask> {
        for tasks in self.tasks.iter_mut().rev() {
            let mut iter = tasks.iter_mut();
            if iter.next().is_some() {
                let task = iter.unlink_watched().unwrap();
                return Some(task);
            }
        }

        None
    }

    pub fn probe_next(&self) -> Option<&'static RunningTask> {
        for tasks in self.tasks.iter() {
            let mut iter = tasks.iter();

            if let Some(task) = iter.next() {
                return Some(task);
            }
        }

        None
    }

    pub fn is_empty(&self) -> bool {
        self.tasks.iter().all(|list| list.is_empty())
    }
}
