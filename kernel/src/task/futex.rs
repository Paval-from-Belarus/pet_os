#![allow(unused)]

use core::{
    cell::UnsafeCell,
    ptr::NonNull,
    sync::atomic::{AtomicUsize, Ordering},
};

use kernel_types::collections::{BorrowingLinkedList, LinkedList, ListNode};

use crate::{
    memory::{self, Slab, SlabBox},
    object,
};

use super::{RunningTask, TaskStatus, SCHEDULER};

pub struct Futex {
    inner: UnsafeCell<NonNull<FutexInner>>,
}

impl Slab for FutexInner {
    const NAME: &str = "futex";
}

impl Futex {
    pub fn new(capacity: usize) -> Self {
        let futex = memory::slab_alloc(FutexInner {
            count: AtomicUsize::new(0),
            max_count: capacity,
            waiting: LinkedList::empty(),
        })
        .unwrap();

        let inner = UnsafeCell::new(NonNull::from(SlabBox::leak(futex)));
        Self { inner }
    }

    pub fn mutex() -> Self {
        Self::new(1)
    }

    pub fn handle(&self) -> object::RawHandle {
        todo!()
    }

    pub fn acquire(&self) {
        unsafe {
            //if failed to acquire
            let futex = self.inner();
            loop {
                if futex.try_acquire().is_ok() {
                    break;
                }

                SCHEDULER.switch_lock().block_on(self.handle());
                //we are not in queue now, therefore we should put ourself in queue again
            }
        }
    }

    pub fn release(&self) {
        todo!()
        // SCHEDULER.switch_lock().unblock_on(self.handle());
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

    fn release(&mut self) -> Option<&'static mut ListNode<RunningTask>> {
        self.count.fetch_sub(1, Ordering::Release);
        self.waiting.remove_first()
    }
}
