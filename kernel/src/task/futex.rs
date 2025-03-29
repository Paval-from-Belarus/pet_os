#![allow(unused)]

use core::{
    cell::UnsafeCell,
    ptr::NonNull,
    sync::atomic::{AtomicUsize, Ordering},
};

use kernel_types::collections::{BorrowingLinkedList, LinkedList, ListNode};

use crate::memory::{self, Slab};

use super::{RunningTask, TaskStatus, SCHEDULER};

pub struct Futex {
    inner: UnsafeCell<NonNull<FutexInner>>,
}

impl Slab for FutexInner {
    const NAME: &str = "futex";
}

impl Futex {
    pub fn new(capacity: usize) -> Self {
        let raw_futex = memory::slab_alloc_old::<FutexInner>(
            memory::AllocationStrategy::Kernel,
        )
        .expect("Failed to alloc futex");
        let futex = raw_futex.write(FutexInner {
            count: AtomicUsize::new(0),
            max_count: capacity,
            waiting: LinkedList::empty(),
        });
        let inner = UnsafeCell::new(NonNull::from(futex));
        Self { inner }
    }

    pub fn mutex() -> Self {
        Self::new(1)
    }

    pub fn acquire(&self) {
        SCHEDULER.lock();
        unsafe {
            //if failed to acquire
            let futex = self.inner();
            loop {
                if futex.try_acquire().is_ok() {
                    break;
                }
                let current = SCHEDULER.block_current();
                //we are not in queue now, therefore we should put ourself in queue again
                futex.wait(current);
                SCHEDULER.switch();
            }
            SCHEDULER.unlock();
        }
    }

    pub fn release(&self) {
        SCHEDULER.lock();

        let futex = self.inner();
        let waiting_option = futex.release();
        if let Some(waiting) = waiting_option {
            SCHEDULER.add_task(waiting.into_boxed());
        }

        SCHEDULER.unlock();
    }

    fn inner(&self) -> &mut FutexInner {
        unsafe { (*self.inner.get()).as_mut() }
    }
}

///the struct is absolutely not thread-safe
struct FutexInner {
    count: AtomicUsize,
    max_count: usize,
    waiting: LinkedList<'static, RunningTask>,
}

impl FutexInner {
    pub fn try_acquire(&mut self) -> Result<(), ()> {
        if self.count.load(Ordering::Acquire) == self.max_count {
            return Err(());
        }
        self.count.fetch_add(1, Ordering::Release);
        Ok(())
    }

    pub fn wait(&mut self, task: &'static mut RunningTask) {
        task.lock.write().status = TaskStatus::Blocked;

        self.waiting.push_back(task.as_node())
    }

    fn release(&mut self) -> Option<&'static mut ListNode<RunningTask>> {
        self.count.fetch_sub(1, Ordering::Release);
        self.waiting.remove_first()
    }
}
