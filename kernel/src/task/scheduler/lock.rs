use core::{
    cell::UnsafeCell,
    marker::PhantomData,
    ptr,
    sync::atomic::{AtomicBool, AtomicUsize, Ordering},
};

use crate::{
    interrupts, memory,
    task::{switch_context, RunningTask, TaskContext},
};

use super::TaskScheduler;

pub struct SchedulerLock {
    locked_count: AtomicUsize,
    postponed_task_switches: AtomicUsize,
    should_reschedule: AtomicBool,

    context: UnsafeCell<*mut TaskContext>,
    scheduler: UnsafeCell<TaskScheduler>,
}

pub struct SchedulerGuard<'a> {
    lock: &'a SchedulerLock,
}

unsafe impl Send for SchedulerLock {}

unsafe impl Sync for SchedulerLock {}

impl<'a> Drop for SchedulerGuard<'a> {
    fn drop(&mut self) {
        unsafe { self.lock.switch(self.current) }

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
            locked_count: AtomicUsize::new(1),
            postponed_task_switches: AtomicUsize::new(1),
            should_reschedule: AtomicBool::new(false),
            context: UnsafeCell::new(ptr::null_mut()),
        }
    }

    //let's say scheduler is locked somewhere
    //if it has been locked (interrupts disabled) then no other way
    //to obtain schedular in another thread (this thread is never executed)
    pub fn lock(&self) -> SchedulerGuard<'_> {
        let _ = self.locked_count.fetch_add(1, Ordering::Relaxed);

        let _ = self.postponed_task_switches.fetch_add(1, Ordering::Relaxed);

        unsafe { interrupts::disable() };

        SchedulerGuard { lock: self }
    }

    pub fn run(&self) -> ! {
        loop {
            self.lock().reschedule();
        }
    }

    ///unlock the scheduler to be available
    fn unlock(&self) {
        let _ = self.postponed_task_switches.fetch_sub(1, Ordering::SeqCst);

        if self.postponed_task_switches.load(Ordering::Acquire) == 0
            && self.should_reschedule.load(Ordering::SeqCst)
        {
            self.should_reschedule.store(false, Ordering::SeqCst);
            unsafe {
                let scheduler = &mut *self.scheduler.get();
                self.switch(scheduler.current);
            }
        }

        let _ = self.locked_count.fetch_sub(1, Ordering::SeqCst);

        if self.locked_count.load(Ordering::SeqCst) == 0 {
            unsafe { interrupts::enable() };
        }
    }

    //the SCHEDULER should be already locked
    unsafe fn switch(&self, current: &mut RunningTask) {
        if self.postponed_task_switches.load(Ordering::Relaxed) != 0 {
            self.should_reschedule.store(true, Ordering::SeqCst);
            log::debug!("Skip switching");
            return;
        }

        memory::switch_to_task(&mut *current);
        switch_context(&mut *self.context.get(), current.context);
        memory::switch_to_kernel();
    }
}
//the task to be invoked before passing execution to desirable task
