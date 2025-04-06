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
    //previous switched task?
    context: UnsafeCell<*mut TaskContext>,
    scheduler: UnsafeCell<TaskScheduler>,
}

pub struct SchedulerGuard<'a> {
    allow_task_switching: bool,
    lock: &'a SchedulerLock,
    task_id: usize,
}

unsafe impl Send for SchedulerLock {}

unsafe impl Sync for SchedulerLock {}

impl<'a> Drop for SchedulerGuard<'a> {
    fn drop(&mut self) {
        if self.allow_task_switching && self.task_id != self.current.task.id {
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
        }
    }

    //let's say scheduler is locked somewhere
    //if it has been locked (interrupts disabled) then no other way
    //to obtain schedular in another thread (this thread is never executed)
    pub fn switch_lock(&self) -> SchedulerGuard<'_> {
        unsafe { interrupts::disable() };

        let task_id = unsafe { &*self.scheduler.get() }.current.id;

        SchedulerGuard {
            allow_task_switching: true,
            lock: self,
            task_id,
        }
    }

    pub fn access_lock(&self) -> SchedulerGuard<'_> {
        unsafe { interrupts::disable() };

        let task_id = unsafe { &*self.scheduler.get() }.current.id;

        SchedulerGuard {
            allow_task_switching: false,
            lock: self,
            task_id,
        }
    }

    pub fn run(&self) -> ! {
        unsafe { interrupts::enable() };

        loop {
            let scheduler = unsafe { &mut *self.scheduler.get() };

            log::info!("Current task: {}", scheduler.current.id);

            unsafe { self.switch(scheduler.current) };

            unsafe { core::arch::asm!("hlt") }
        }
    }

    fn unlock(&self) {
        unsafe { interrupts::enable() };
    }

    /// scheduler should be already locked
    unsafe fn switch(&self, current: &mut RunningTask) {
        memory::switch_to_task(&mut *current);
        switch_context(&mut *self.context.get(), current.context);
        memory::switch_to_kernel();
    }
}
//the task to be invoked before passing execution to desirable task
