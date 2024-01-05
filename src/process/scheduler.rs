use core::arch::asm;
use core::cell::UnsafeCell;
use core::intrinsics::truncf32;
use core::ptr;
use core::ptr::NonNull;
use core::sync::atomic;
use core::sync::atomic::{AtomicBool, AtomicUsize, Ordering};
use core::sync::atomic::Ordering::{Relaxed, Release};
use crate::{interrupts, memory};
use crate::process::{TaskContext, TaskStatus, ThreadTask};
use crate::utils::{BorrowingLinkedList, LinkedList, ListNode, ListNodeData, TinyLinkedList, TinyListNode, TinyListNodeData, UnlinkableListGuard};
use crate::utils::atomics::SpinLock;

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
    delayed: LinkedList<'static, ThreadTask>,
    //the queue of tasks consider to be clean up
    killed: TinyLinkedList<'static, ThreadTask>,
    sleeping: TinyLinkedList<'static, ThreadTask>,
    current: NonNull<ListNode<ThreadTask>>,
    idle_task: NonNull<ListNode<ThreadTask>>,
}

impl TaskSchedulerInner {
    //always should be the current task!
    pub fn new(task: &'static mut ListNode<ThreadTask>) -> Self {
        task.status = TaskStatus::Active;//the status of idle task is never changed
        let current = NonNull::from(task);
        let idle_task = current;
        Self {
            current,
            idle_task,
            //set the linked list as empty
            ..Default::default()
        }
    }
    pub fn add_task(&mut self, task: &'static mut ListNode<ThreadTask>) {
        task.status = TaskStatus::Delayed;
        self.delayed.push_back(task);
    }
    pub fn add_sleeping(&mut self, task: &'static mut ListNode<ThreadTask>) {
        task.status = TaskStatus::Blocked;
        self.sleeping.push_back(task.cast_node_mut());
    }
    ///try to move task from sleeping list
    pub fn awake_sleeping(&mut self, current_time: usize) {
        let guard = self.sleeping.link_guard();
        let iter = self.sleeping.iter_mut()
            .filter(|task| task.start_time <= current_time);
        let list = unsafe { guard.collect(iter) };
        for task in list {
            self.add_task(task);
        }
    }
    ///Try to fetch the next task
    ///If task is killed then it will be pushed in list of killed tasks
    ///If no task is available in list then idle task will return
    pub fn next_task(&mut self) -> &'static mut ListNode<ThreadTask> {
        let mut iterator = self.delayed.iter_mut();
        let mut next_task = None;
        while next_task.is_none() && let Some(task) = iterator.next() {
            if task.status == TaskStatus::Killed {
                self.killed.push_back(task.cast_node_mut());
                continue;
            }
            assert!(task.status != TaskStatus::Active, "No active task can be in delayed queue");
            next_task = iterator.unlink_watched();
        }
        if let Some(task) = next_task {
            task
        } else {
            unsafe { self.idle_task.as_mut() }
        }
    }
    pub fn cleanup(&mut self) -> TinyLinkedList<'static, ThreadTask> {
        let guard = unsafe { self.delayed.link_guard() };
        let iter = self.delayed.iter_mut().limit()
            .filter(|task| task.status == TaskStatus::Killed);
        let list: TinyLinkedList<ThreadTask> = unsafe {
            guard.map_collect(iter, |node| node.cast_node())
        };
        self.killed.splice(list);
        let list = self.killed;
        self.killed = TinyLinkedList::empty();
        list
    }
    //replace current task and place it in delayed queue
    pub fn replace_current(&mut self, next: &'static mut ListNode<ThreadTask>) {
        if !self.current.eq(&self.idle_task) {
            let old = unsafe { self.current.as_mut() };
            assert!(old.status == TaskStatus::Active);
            self.add_task(old);
        }
        next.status = TaskStatus::Active;
        //if not current task is specified, simply set it
        self.current = NonNull::from(next);
    }
    //set status of current task and set idle task as current
    pub fn block_current(&mut self) -> &'static mut ListNode<ThreadTask> {
        assert!(!self.current(&self.idle_task), "Attempt to block idle task");
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
    context: *mut TaskContext,
    spin: SpinLock,
}

unsafe impl Send for TaskScheduler {}

unsafe impl Sync for TaskScheduler {}

///all time-consuming methods are marked as unsafe
impl TaskScheduler {
    pub fn new(idle_task: &'static mut ListNode<ThreadTask>) -> Self {
        Self {
            inner: UnsafeCell::new(TaskSchedulerInner::new(idle_task)),
            locked_count: AtomicUsize::new(0),
            postponed_count: AtomicUsize::new(0),
            should_reschedule: AtomicBool::new(false),
            context: ptr::null_mut(),
            spin: SpinLock::new(),
        }
    }
    ///unlock the scheduler to be available
    pub unsafe fn unlock(&self) {
        let _ = self.postponed_count.fetch_sub(1, Ordering::SeqCst);
        if self.postponed_count.load(Ordering::Acquire) == 0 && self.should_reschedule.load(Ordering::SeqCst) {
            self.should_reschedule.store(false, Ordering::SeqCst);
            self.reschedule();
        }
        let _ = self.locked_count.fetch_sub(1, Ordering::SeqCst);
        if self.locked_count.load(Ordering::SeqCst) == 0 {
            unsafe { interrupts::enable() };
        }
    }
    pub fn lock(&self) {
        let old_locked_count = self.locked_count.fetch_add(1, Ordering::Relaxed);
        let old_postponed_count = self.postponed_count.fetch_add(1, Ordering::Relaxed);
        assert!(old_locked_count >= 1 && old_postponed_count >= 1);
        unsafe { interrupts::disable() };
    }
    pub fn add_task(&self, task: &'static mut ListNode<ThreadTask>) {
        self.lock();
        self.inner().add_task(task);
        unsafe { self.unlock() };//interrupts can be safely enabled
    }
    //this method should be invoked with properly synchronization police
    unsafe fn reschedule(&self) {
        let mut inner = self.inner();
        let next_task = inner.next_task();
        inner.replace_current(next_task);
    }
    ///Block the current task and replace by another available from delayed queue (or
    pub unsafe fn block_current(&self) -> &'static mut ListNode<ThreadTask> {
        let current = self.inner().block_current();
        self.reschedule();
        current
    }
    pub fn sleep(&self, period: usize) {
        self.lock();
        let mut inner = self.inner();
        let blocked_current = inner.block_current();
        blocked_current.start_time += period;//update the time until wait
        assert!(!ptr::eq(blocked_current, self.idle_task.as_ptr()), "Attempt to sleep idle task");
        inner.add_sleeping(blocked_current);
        unsafe {
            self.reschedule();//change the current task
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
        switch_context(&mut self.context, current.context);
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

    pub fn current_task(&self) -> &'static mut ListNode<ThreadTask> {
        unsafe { self.inner().current.as_mut() }
    }

    fn inner(&self) -> &'static mut TaskSchedulerInner {
        unsafe { &mut *self.inner.get() }
    }
}
//the task to be invoked before passing execution to desirable task
