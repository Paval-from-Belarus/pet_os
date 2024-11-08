use core::arch::asm;
use core::cell::UnsafeCell;
use core::ptr;
use core::ptr::NonNull;
use core::sync::atomic::Ordering::Relaxed;
use core::sync::atomic::{AtomicBool, AtomicUsize, Ordering};

use kernel_types::collections::{
    BorrowingLinkedList, LinkedList, ListNode, TinyLinkedList,
    UnlinkableListGuard,
};

use crate::process::{RunnableTask, TaskContext, TaskStatus, ThreadTask};
use crate::utils::atomics::SpinLock;
use crate::{interrupts, memory};

#[macro_export]
macro_rules! current_task {
    () => {
        $crate::process::scheduler::SCHEDULER.get().current_task()
    };
}
#[inline(never)]
unsafe fn switch_context(old: &mut *mut TaskContext, new: *mut TaskContext) {
    asm!(
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
    options(nostack));
}

struct TaskSchedulerInner {
    //the queue of delayed tasks
    delayed: LinkedList<'static, RunnableTask>,
    //the queue of tasks consider to be clean up
    killed: TinyLinkedList<'static, RunnableTask>,
    sleeping: TinyLinkedList<'static, RunnableTask>,
    current: NonNull<ListNode<RunnableTask>>,
    idle_task: NonNull<ListNode<RunnableTask>>,
}

impl TaskSchedulerInner {
    //always should be the current task!
    ///task is simple idle task
    pub fn new(task: &'static mut ThreadTask) -> Self {
        task.status = TaskStatus::Active; //the status of idle task is never changed
        let raw_task = NonNull::from(task.as_runnable());
        unsafe {
            Self {
                delayed: LinkedList::empty(),
                killed: TinyLinkedList::empty(),
                sleeping: TinyLinkedList::empty(),
                current: raw_task,
                idle_task: raw_task,
                //set the linked list as empty
            }
        }
    }
    pub fn add_task(&mut self, task: &'static mut ThreadTask) {
        task.status = TaskStatus::Delayed;
        self.delayed.push_back(task.as_runnable());
    }
    pub fn add_sleeping(&mut self, task: &'static mut ThreadTask) {
        task.status = TaskStatus::Blocked;
        let tiny_task = task.as_runnable().tiny_mut();
        self.sleeping.push_back(tiny_task);
    }
    ///try to move task from sleeping list
    pub fn awake_sleeping(&mut self, current_time: usize) {
        let guard = self.sleeping.link_guard();
        let iter = self
            .sleeping
            .iter_mut()
            .filter(|task| task.start_time <= current_time);
        let mut list = unsafe { guard.collect(iter) };
        for tiny in list.iter_mut() {
            let node = tiny.node_mut();
            self.add_task(node as &mut ThreadTask);
        }
    }
    ///Try to fetch the next task
    ///If task is killed then it will be pushed in list of killed tasks
    ///If no task is available in list then idle task will return
    pub fn next_task(&mut self) -> &'static mut ListNode<RunnableTask> {
        let mut iterator = self.delayed.iter_mut();
        let mut next_task = None;
        while next_task.is_none()
            && let Some(task) = iterator.next()
        {
            if task.status == TaskStatus::Killed {
                self.killed.push_back(task.tiny_mut());
                continue;
            }
            assert!(
                task.status != TaskStatus::Active,
                "No active task can be in delayed queue"
            );
            next_task = iterator.unlink_watched();
        }
        if let Some(task) = next_task {
            task
        } else {
            unsafe { self.idle_task.as_mut() }
        }
    }
    pub fn cleanup(&'static mut self) -> TinyLinkedList<'static, RunnableTask> {
        let guard = unsafe { self.delayed.link_guard() };
        let iter = self
            .delayed
            .iter_mut()
            .limit()
            .filter(|task| task.status == TaskStatus::Killed);
        let list: TinyLinkedList<RunnableTask> =
            unsafe { guard.collect_map(iter, |node| node.tiny_mut()) };
        self.killed.splice(list);
        let list = unsafe { self.killed.clone() };
        self.killed = TinyLinkedList::empty();
        list
    }
    //replace current task and place it in delayed queue
    pub fn replace_current(&mut self, next: &'static mut ThreadTask) {
        if !self.current.eq(&self.idle_task) {
            let old = unsafe { self.current.as_mut() };
            assert!(old.status == TaskStatus::Active);
            self.add_task(old);
        }
        next.status = TaskStatus::Active;
        //if not current task is specified, simply set it
        self.current = NonNull::from(next.as_runnable());
    }
    //set status of current task and set idle task as current
    pub fn block_current(&mut self) -> &'static mut ListNode<RunnableTask> {
        assert!(
            self.current.eq(&self.idle_task),
            "Attempt to block idle task"
        );
        let current_task = unsafe { self.current.as_mut() };
        current_task.status = TaskStatus::Blocked;
        self.current = self.idle_task;
        current_task
    }
}

pub struct TaskScheduler {
    inner: UnsafeCell<TaskSchedulerInner>,
    locked_count: AtomicUsize,
    postponed_count: AtomicUsize,
    should_reschedule: AtomicBool,
    context: UnsafeCell<*mut TaskContext>,
    spin: SpinLock,
}

unsafe impl Send for TaskScheduler {}

unsafe impl Sync for TaskScheduler {}

///all time-consuming methods are marked as unsafe
impl TaskScheduler {
    pub fn new(idle_task: &'static mut ThreadTask) -> Self {
        Self {
            inner: UnsafeCell::new(TaskSchedulerInner::new(idle_task)),
            locked_count: AtomicUsize::new(0),
            postponed_count: AtomicUsize::new(0),
            should_reschedule: AtomicBool::new(false),
            context: UnsafeCell::new(ptr::null_mut()),
            spin: SpinLock::new(),
        }
    }
    ///unlock the scheduler to be available
    pub unsafe fn unlock(&self) {
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
        let old_locked_count =
            self.locked_count.fetch_add(1, Ordering::Relaxed);
        let old_postponed_count =
            self.postponed_count.fetch_add(1, Ordering::Relaxed);
        assert!(old_locked_count >= 1 && old_postponed_count >= 1);
        unsafe { interrupts::disable() };
    }
    pub fn add_task(&self, task: &'static mut ThreadTask) {
        self.lock();
        self.inner().add_task(task);
        unsafe { self.unlock() }; //interrupts can be safely enabled
    }
    //this method should be invoked with properly synchronization police
    unsafe fn reschedule(&self) {
        let inner = self.inner();
        let next_task = inner.next_task();
        inner.replace_current(next_task);
    }
    ///Block the current task and replace by another available from delayed queue (or
    pub unsafe fn block_current(&self) -> &'static mut ThreadTask {
        let current = self.inner().block_current();
        self.reschedule();
        current
    }
    pub fn sleep(&self, period: usize) {
        self.lock();
        let inner = self.inner();
        let blocked_current = inner.block_current();
        blocked_current.start_time += period; //update the time until wait
        assert!(
            !ptr::eq(blocked_current, inner.idle_task.as_ptr()),
            "Attempt to sleep idle task"
        );
        inner.add_sleeping(blocked_current);
        unsafe {
            self.reschedule(); //change the current task
            self.switch();
            self.unlock();
        }
    }
    //wakeup sleeping tasks
    pub fn wakeup(&self, current_time: usize) {
        self.lock();
        self.inner().awake_sleeping(current_time);
        unsafe { self.unlock() };
    }
    //the SCHEDULER should be already locked
    pub unsafe fn switch(&self) {
        if self.postponed_count.load(Relaxed) == 0 {
            self.should_reschedule.store(true, Ordering::SeqCst);
            return;
        }
        let current = self.current_task();
        memory::switch_to_task(current);
        switch_context(&mut *self.context.get(), current.context);
        memory::switch_to_kernel();
    }
    pub fn run(&self) -> ! {
        unsafe { interrupts::enable() };
        loop {
            self.lock();
            unsafe {
                self.reschedule();
                self.switch();
                self.unlock();
            }
        }
    }

    pub fn current_task(&self) -> &'static mut ThreadTask {
        unsafe { self.inner().current.as_mut() }
    }

    fn inner(&self) -> &'static mut TaskSchedulerInner {
        unsafe { &mut *self.inner.get() }
    }
}
//the task to be invoked before passing execution to desirable task
