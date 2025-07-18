#![allow(unused)]

mod lock;
mod queue;

use core::arch::asm;
use core::cell::UnsafeCell;
use core::ptr::NonNull;
use core::sync::atomic::Ordering::Relaxed;
use core::sync::atomic::{AtomicBool, AtomicUsize, Ordering};
use core::{mem, ptr};

use kernel_types::collections::{
    BorrowingLinkedList, HashTable, LinkedList, ListNode,
};
use queue::TaskQueue;

use crate::object::{Handle, ObjectContainer};
use crate::task::{switch_context, RunningTask, TaskContext, TaskStatus};
use crate::{io, log_module, memory, ticks_size};
use crate::{object, ticks_now};

use super::{BlockedTask, RunningTaskBox, Task, TaskPriority};

pub use lock::SchedulerLock;

pub struct TaskScheduler {
    // the queue of delayed tasks
    // which will be running on next stage
    delayed: &'static mut TaskQueue,
    running: &'static mut TaskQueue,

    blocked: LinkedList<'static, BlockedTask>,
    sleeping: LinkedList<'static, RunningTask>,

    current: &'static mut RunningTask,

    // the list of tasks running
    // when no active tasks is detected
    idle_tasks: LinkedList<'static, RunningTask>,
}

impl TaskScheduler {
    pub fn new(current: &'static mut RunningTask) -> Self {
        Self {
            current,
            running: TaskQueue::new_leaked(),
            delayed: TaskQueue::new_leaked(),
            sleeping: LinkedList::empty(),
            blocked: LinkedList::empty(),
            idle_tasks: LinkedList::empty(),
        }
    }

    /// Each idle task has several limitation:
    /// 1. It will never be terminated (busy loop)
    /// 2. It requires no time constraints
    pub fn push_task(&mut self, task: &'static mut RunningTask) {
        task.metrics.elapsed = 0;
        task.metrics.base_duration = task.priority.static_duration();

        if task.priority == TaskPriority::Idle {
            log::trace!("Pushing idle task");
            self.idle_tasks.push_back(task);
        } else {
            log::trace!("Pushing task#{}", task.id);
            self.delayed.push(task);
        }
    }

    /// block the current task on object handle
    pub fn block_on<T: ObjectContainer, F: Fn(&T)>(
        &mut self,
        handle: Handle<T>,
        awake_another: bool,
        on_block: F,
    ) {
        log::debug!("Blocking: 0x{:x}", handle.as_addr());

        let mut next_task = self
            .running
            .take_next()
            .unwrap_or_else(|| self.reschedule());

        mem::swap(&mut self.current, &mut next_task);

        let mut blocked_task = next_task.into_blocked(handle.as_addr());

        let blocked_task_id = blocked_task.id;

        assert!(!self.blocked.iter().any(|task| task.id == blocked_task_id
            && *task.block_reason() == handle.as_addr()));

        if awake_another {
            self.unblock_on(handle.as_addr());
        }

        self.blocked.push_back(blocked_task);

        on_block(&handle);
    }

    /// unblock task with highest priority on object handle
    pub fn unblock_on(&mut self, handle: object::RawHandle) {
        log::debug!("Unblocking: 0x{handle:x?}");

        let mut max_priority = Option::<TaskPriority>::None;

        let maybe_task_id = self
            .blocked
            .iter()
            .filter(|task| task.block_reason().eq(&handle))
            .max_by_key(|task| task.priority.into_raw())
            .map(|task| task.id);

        let Some(task_id) = maybe_task_id else {
            log::trace!("No tasks to unblock on 0x{handle:x?}");
            return;
        };

        log::debug!("task#{task_id} will be unblocked");

        let unblocked_task = self
            .blocked
            .remove_by(|task| task.id == task_id)
            .expect("no task for existing id")
            .into_running();

        self.push_task(unblocked_task);
    }

    ///add current task to sleeping list
    pub fn sleep(&mut self, period: usize) {
        let mut next_task = self
            .running
            .take_next()
            .unwrap_or_else(|| self.reschedule());

        mem::swap(&mut next_task, &mut self.current);

        let sleeping = next_task.into_sleeping(period);

        self.sleeping.push_back(sleeping.as_node());
    }

    pub fn on_tick(&mut self) {
        let mut iter = self.sleeping.iter_mut();

        loop {
            let Some(task) = iter.next() else {
                break;
            };

            //fixme: time overflow?
            if task.start_time < ticks_now!() {
                let awaked_task = iter.unlink_watched().unwrap();

                awaked_task.metrics.elapsed = 0;

                if awaked_task.priority == TaskPriority::Idle {
                    self.idle_tasks.push_back(awaked_task);
                } else {
                    self.running.push(awaked_task);
                }
            }
        }

        log::trace!("On tick. Task = {}", self.current.id);

        self.current.metrics.elapsed += ticks_size!();

        if let Some(candidate) = self.running.probe_next() {
            assert!(
                candidate.metrics.elapsed <= candidate.metrics.base_duration,
            );

            if candidate.priority > self.current.priority {
                log::debug!(
                    "Replacing task {} with higher {}",
                    self.current.id,
                    candidate.id
                );

                let mut task = self.running.take_next().expect("Success probe");

                mem::swap(&mut task, &mut self.current);

                log::debug!("Old = {}. New = {}", task.id, self.current.id);

                //the problem: if task has too small execution time
                //should it be executed at whole?
                if task.priority == TaskPriority::Idle {
                    task.metrics.elapsed = 0;
                    self.idle_tasks.push_back(task);
                } else if task.metrics.elapsed >= task.metrics.base_duration {
                    task.metrics.elapsed = 0;
                    self.delayed.push(task);
                } else {
                    self.running.push(task);
                }
            }
        }

        if self.current.metrics.elapsed > self.current.metrics.base_duration {
            self.current.metrics.elapsed = 0;

            if let Some(mut task) = self.running.take_next() {
                mem::swap(&mut self.current, &mut task);

                self.push_task(task);
            } else if self.running.is_empty() && !self.delayed.is_empty() {
                let mut task = self.reschedule();

                mem::swap(&mut self.current, &mut task);

                self.push_task(task);
            } else {
                assert!(self.running.is_empty() && self.delayed.is_empty());
                //do nothing as task is already running
                //and we cannot take another task

                log::debug!("No more tasks");
            }
        }

        log::trace!("On tick end. Task = {}", self.current.id);
    }

    /// terminate the current task by
    /// releasing all resources assosicated with task
    pub fn terminate(&mut self) {
        let mut task = self.next_task();

        mem::swap(&mut task, &mut self.current);

        let task = task.as_node().into_boxed();
        drop(task)
    }

    pub fn current_task(&mut self) -> &mut RunningTask {
        self.current
    }

    ///Try to fetch the next task
    ///If task is killed then it will be pushed in list of killed tasks
    ///If no task is available in list then idle task will return
    fn next_task(&mut self) -> &'static mut RunningTask {
        self.running
            .take_next()
            .unwrap_or_else(|| self.reschedule())
    }

    /// update the task ordering
    /// and return current next task
    #[must_use]
    fn reschedule(&mut self) -> &'static mut RunningTask {
        log::trace!("Rescheduling");

        mem::swap(&mut self.delayed, &mut self.running);

        let Some(task) = self.running.take_next() else {
            return self.idle_tasks.remove_first().expect("No idle task");
        };

        task
    }
}
