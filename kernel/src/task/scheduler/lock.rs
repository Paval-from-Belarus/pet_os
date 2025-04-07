use core::{
    cell::UnsafeCell,
    marker::PhantomData,
    ptr::{self, NonNull},
    sync::atomic::{AtomicBool, AtomicUsize, Ordering},
};

use crate::{
    current_task, interrupts, memory, set_eax, set_edx,
    task::{switch_context, RunningTask, TaskContext},
};

use super::TaskScheduler;

pub struct SchedulerLock {
    scheduler: UnsafeCell<TaskScheduler>,
    context: UnsafeCell<*mut TaskContext>,
}

pub struct SchedulerGuard<'a> {
    allow_task_switching: bool,
    restore_interrupts: bool,
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

        if self.restore_interrupts {
            unsafe { interrupts::enable() };
        }
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
        let context = task.context.into();

        Self {
            scheduler: UnsafeCell::new(TaskScheduler::new(task)),
            context,
        }
    }

    //let's say scheduler is locked somewhere
    //if it has been locked (interrupts disabled) then no other way
    //to obtain schedular in another thread (this thread is never executed)
    pub fn switch_lock(&self) -> SchedulerGuard<'_> {
        let restore_interrupts = unsafe { interrupts::status() };

        unsafe { interrupts::disable() };

        let task_id = unsafe { &*self.scheduler.get() }.current.id;

        SchedulerGuard {
            allow_task_switching: true,
            restore_interrupts,
            lock: self,
            task_id,
        }
    }

    pub fn access_lock(&self) -> SchedulerGuard<'_> {
        let restore_interrupts = unsafe { interrupts::status() };

        unsafe { interrupts::disable() };

        let task_id = unsafe { &*self.scheduler.get() }.current.id;

        SchedulerGuard {
            restore_interrupts,
            allow_task_switching: false,
            lock: self,
            task_id,
        }
    }

    #[inline(never)]
    pub fn run(&self) -> ! {
        unsafe {
            interrupts::enable();

            let context = *self.context.get();

            core::arch::asm! {
                "mov esp, edx",
                "jmp eax",
                in("eax") (*context).eip,
                in("edx") (*context).esp,
                options(noreturn)
            }
        }
    }

    /// scheduler should be already locked
    unsafe fn switch(&self, current: &mut RunningTask) {
        let old_context = *self.context.get();
        let new_context = current.context;

        if ptr::eq(old_context, new_context) {
            log::warn!("Switching to already running task");
            return;
        }

        *self.context.get() = new_context;

        memory::switch_to_task(&mut *current);

        core::arch::asm! {
            "",
            in("eax") old_context,
            in("edx") new_context
        }

        switch_context();

        memory::switch_to_kernel();
    }
}
//the task to be invoked before passing execution to desirable task
