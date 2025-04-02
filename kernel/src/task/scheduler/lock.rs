use core::{
    cell::UnsafeCell,
    marker::PhantomData,
    ptr,
    sync::atomic::{AtomicBool, AtomicUsize, Ordering},
};

use crate::{
    current_task, interrupts, memory,
    task::{switch_context, RunningTask, TaskContext},
};

use super::TaskScheduler;

pub struct SchedulerLock {
    context: UnsafeCell<*mut TaskContext>,
    scheduler: UnsafeCell<TaskScheduler>,
    allow_task_switches: AtomicBool,
    locked_count: AtomicUsize,
}

pub struct SchedulerGuard<'a> {
    lock: &'a SchedulerLock,
    task_id: usize,
}

unsafe impl Send for SchedulerLock {}

unsafe impl Sync for SchedulerLock {}

impl<'a> Drop for SchedulerGuard<'a> {
    fn drop(&mut self) {
        log::debug!("Lock is dropped");

        if self.task_id != self.current.task.id {
            log::debug!("Switching task");
            unsafe { self.lock.switch(self.current) }
        }

        self.lock.unlock();
    }
}

impl<'a> core::ops::Deref for SchedulerGuard<'a> {
    type Target = TaskScheduler;
    fn deref(&self) -> &Self::Target {
        //as this method is invoked then
        //scheduler is already locked
        unsafe { &*self.lock.scheduler.get() }
    }
}

impl<'a> core::ops::DerefMut for SchedulerGuard<'a> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        unsafe { &mut *self.lock.scheduler.get() }
    }
}

///all time-consuming methods are marked as unsafe
impl SchedulerLock {
    pub fn new(task: &'static mut RunningTask) -> Self {
        Self {
            scheduler: UnsafeCell::new(TaskScheduler::new(task)),
            context: UnsafeCell::new(ptr::null_mut()),
            locked_count: AtomicUsize::new(1),
            allow_task_switches: AtomicBool::new(false),
        }
    }

    //let's say scheduler is locked somewhere
    //if it has been locked (interrupts disabled) then no other way
    //to obtain schedular in another thread (this thread is never executed)
    pub fn switch_lock(&self) -> SchedulerGuard<'_> {
        self.locked_count.fetch_add(1, Ordering::SeqCst);
        self.allow_task_switches.store(true, Ordering::SeqCst);

        unsafe { interrupts::disable() };

        let task_id = unsafe { &*self.scheduler.get() }.current.id;

        SchedulerGuard {
            lock: self,
            task_id,
        }
    }

    pub fn access_lock(&self) -> SchedulerGuard<'_> {
        self.allow_task_switches.store(false, Ordering::SeqCst);
        self.locked_count.fetch_add(1, Ordering::SeqCst);

        unsafe { interrupts::disable() };

        let task_id = unsafe { &*self.scheduler.get() }.current.id;

        SchedulerGuard {
            lock: self,
            task_id,
        }
    }

    pub fn run(&self) -> ! {
        log::debug!("Main loop");

        self.locked_count.store(0, Ordering::SeqCst);

        loop {
            unsafe { memory::switch_to_kernel() }; //ensure that task is running in kernel space
            let lock = self.switch_lock();
            drop(lock);
        }
    }

    fn unlock(&self) {
        self.locked_count.fetch_sub(1, Ordering::SeqCst);

        if self.locked_count.load(Ordering::Acquire) == 0 {
            unsafe { interrupts::enable() };
        }
    }

    /// scheduler should be already locked
    unsafe fn switch(&self, current: &mut RunningTask) {
        if !self.allow_task_switches.load(Ordering::SeqCst) {
            return;
        }

        memory::switch_to_task(&mut *current);
        switch_context(&mut *self.context.get(), current.context);
        memory::switch_to_kernel();
    }
}
//the task to be invoked before passing execution to desirable task
