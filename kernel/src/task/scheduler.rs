#![allow(unused)]

use core::arch::asm;
use core::cell::UnsafeCell;
use core::ptr;
use core::ptr::NonNull;
use core::sync::atomic::Ordering::Relaxed;
use core::sync::atomic::{AtomicBool, AtomicUsize, Ordering};

use kernel_types::collections::{
    BorrowingLinkedList, LinkedList, ListNode, TinyLinkedList,
};

use crate::task::{RunningTask, TaskContext, TaskStatus};
use crate::{interrupts, memory};

use super::TaskBox;

#[macro_export]
macro_rules! current_task {
    () => {
        $crate::process::scheduler::SCHEDULER.get().current_task()
    };
}

#[inline(never)]
unsafe fn switch_context(old: &mut *mut TaskContext, new: *mut TaskContext) {
    asm! {
        "push ebx",
        "push esi",
        "push edi",
        "push ebp",
        "mov [eax], esp",
        "mov esp, edx",
        "pop ebp",
        "pop edi",
        "pop esi",
        "pop ebx",

        in("eax") old,
        in("edx") new,

        options(nostack)
    }
}
const PRIORIY_LEVEL_SIZE: usize = 32;

struct TaskSchedulerInner {
    //the queue of delayed tasks
    delayed: LinkedList<'static, RunningTask>,
    //the queue of tasks consider to be clean up
    killed: TinyLinkedList<'static, RunningTask>,
    sleeping: TinyLinkedList<'static, RunningTask>,

    current: NonNull<ListNode<RunningTask>>,
    idle_task: NonNull<ListNode<RunningTask>>,

    /// current level of running task
    /// must be the highest value of all possible task
    priority_level: u16,

}

impl TaskSchedulerInner {
    //always should be the current task!
    ///task is simple idle task
    pub fn new(task: TaskBox) -> Self {
        let node = task.into_node();
        node.lock.write().status = TaskStatus::Active; //the status of idle task is never changed
        let priority_level = node.lock.read().priority.into();
        let raw_task = NonNull::from(node);

        Self {
            delayed: LinkedList::empty(),
            killed: TinyLinkedList::empty(),
            sleeping: TinyLinkedList::empty(),
            current: raw_task,
            idle_task: raw_task,
            priority_level,
            //set the linked list as empty
        }
    }

    pub fn add_task(&mut self, task: TaskBox) {
        let node = task.into_node();
        node.lock.write().status = TaskStatus::Delayed;

        self.delayed.push_back(node);
    }

    pub fn add_sleeping(&mut self, task: &'static mut RunningTask) {
        task.lock.write().status = TaskStatus::Blocked;

        let node = task.as_node();

        self.sleeping.push_back(node.tiny_mut());
    }

    ///try to move task from sleeping list
    pub fn awake_sleeping(&mut self, current_time: usize) {
        let mut iter = self.sleeping.iter_mut();

        let mut awaked_tasks = TinyLinkedList::empty();

        loop {
            let Some(task) = iter.next() else {
                break;
            };

            if task.lock.try_read().unwrap().start_time <= current_time {
                awaked_tasks.push_back(task.node_mut().tiny_mut());
            }
        }

        for task in awaked_tasks.into_iter() {

        }
    }
    ///Try to fetch the next task
    ///If task is killed then it will be pushed in list of killed tasks
    ///If no task is available in list then idle task will return
    pub fn next_task(&mut self) -> &'static mut ListNode<RunningTask> {
        let mut iter = self.delayed.iter_mut();

        let mut next_task = None;

        while next_task.is_none()
            && let Some(task) = iter.next()
        {
            if task.lock.read().status == TaskStatus::Killed {
                self.killed.push_back(task.tiny_mut());
                continue;
            }

            assert!(
                task.lock.read().status != TaskStatus::Active,
                "No active task can be in delayed queue"
            );

            next_task = iter.unlink_watched();
        }

        if let Some(task) = next_task {
            task
        } else {
            unsafe { self.idle_task.as_mut() }
        }
    }

    pub fn cleanup(&'static mut self) -> TinyLinkedList<'static, RunningTask> {
        let mut iter = self.delayed.iter_mut();
        let mut list = TinyLinkedList::empty();

        loop {
            let Some(next) = iter.next() else {
                break;
            };

            if next.lock.try_read().unwrap().status == TaskStatus::Killed {
                let node = iter.unlink_watched().unwrap();
                list.push_front(node.tiny_mut());
            }
        }

        self.killed.splice(list);

        self.killed.take()
    }
    //replace current task and place it in delayed queue
    pub fn replace_current(&mut self, next: &'static mut RunningTask) {
        if !self.current.eq(&self.idle_task) {
            log::debug!("Replacing idle");
            let old = unsafe { self.current.as_mut() };

            assert!(old.lock.read().status == TaskStatus::Active);

            self.add_task(old.into_boxed());
        }

        next.lock.write().status = TaskStatus::Active;
        //if not current task is specified, simply set it
        self.current = NonNull::from(next.as_node());
    }
    //set status of current task and set idle task as current
    pub fn block_current(&mut self) -> &'static mut ListNode<RunningTask> {
        assert_ne!(self.current, self.idle_task, "Attempt to block idle task");

        let current_task = unsafe { self.current.as_mut() };
        current_task.lock.write().status = TaskStatus::Blocked;

        self.current = self.idle_task;

        current_task
    }
}

pub struct TaskScheduler {
    inner: spin::Mutex<TaskSchedulerInner>,

    locked_count: AtomicUsize,
    postponed_count: AtomicUsize,
    should_reschedule: AtomicBool,

    context: UnsafeCell<*mut TaskContext>,
}

unsafe impl Send for TaskScheduler {}

unsafe impl Sync for TaskScheduler {}

///all time-consuming methods are marked as unsafe
impl TaskScheduler {
    pub fn new(idle_task: TaskBox) -> Self {
        Self {
            inner: spin::Mutex::new(TaskSchedulerInner::new(idle_task)),
            locked_count: AtomicUsize::new(1),
            postponed_count: AtomicUsize::new(1),
            should_reschedule: AtomicBool::new(false),
            context: UnsafeCell::new(ptr::null_mut()),
        }
    }

    ///unlock the scheduler to be available
    pub fn unlock(&self) {
        let _ = self.postponed_count.fetch_sub(1, Ordering::SeqCst);

        if self.postponed_count.load(Ordering::Acquire) == 0
            && self.should_reschedule.load(Ordering::SeqCst)
        {
            self.should_reschedule.store(false, Ordering::SeqCst);
            self.reschedule();
        }

        let _ = self.locked_count.fetch_sub(1, Ordering::SeqCst);
        if self.locked_count.load(Ordering::SeqCst) == 0 {
            unsafe { interrupts::enable() };
        }
    }

    pub fn lock(&self) {
        let _ = self.locked_count.fetch_add(1, Ordering::Relaxed);

        let _ = self.postponed_count.fetch_add(1, Ordering::Relaxed);

        unsafe { interrupts::disable() };
    }

    pub fn add_task(&self, task: TaskBox) {
        self.lock();

        self.inner.lock().add_task(task);

        self.unlock(); //interrupts can be safely enabled
    }

    /// this method should be invoked with properly synchronization police
    fn reschedule(&self) {
        log::debug!("Rescheduling");

        let mut inner = self.inner.lock();

        let next_task = inner.next_task();

        inner.replace_current(next_task);
    }

    ///Block the current task and replace by another available from delayed queue (or
    pub unsafe fn block_current(&self) -> &'static mut RunningTask {
        let current = self.inner.lock().block_current();

        self.reschedule();

        current
    }

    pub fn sleep(&self, period: usize) {
        self.lock();

        let mut inner = self.inner.lock();

        let blocked_current = inner.block_current();
        blocked_current.lock.write().start_time += period; //update the time until wait
                                                           //
        assert!(
            !ptr::eq(blocked_current, inner.idle_task.as_ptr()),
            "Attempt to sleep idle task"
        );

        inner.add_sleeping(blocked_current);

        drop(inner);

        unsafe {
            self.reschedule(); //change the current task
            self.switch();
            self.unlock();
        }
    }

    //wakeup sleeping tasks
    pub fn wakeup(&self, current_time: usize) {
        self.lock();

        self.inner.lock().awake_sleeping(current_time);

        self.unlock();
    }

    //the SCHEDULER should be already locked
    pub unsafe fn switch(&self) {
        if self.postponed_count.load(Relaxed) == 0 {
            self.should_reschedule.store(true, Ordering::SeqCst);
            log::debug!("Skip switching");
            return;
        }

        log::debug!("Switching to another task");

        let current = self.current_task();

        memory::switch_to_task(&mut current.lock.write());
        switch_context(&mut *self.context.get(), current.lock.read().context);
        memory::switch_to_kernel();
    }

    pub fn run(&self) -> ! {
        self.unlock();

        loop {
            self.lock();

            unsafe {
                self.reschedule();
                self.switch();
                self.unlock();
            }
        }
    }

    pub fn current_task(&self) -> &'static mut RunningTask {
        unsafe { self.inner.lock().current.as_mut() }
    }
}
//the task to be invoked before passing execution to desirable task
