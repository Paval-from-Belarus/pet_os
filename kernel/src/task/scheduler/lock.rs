use core::{
    cell::UnsafeCell,
    marker::PhantomData,
    ptr::{self, NonNull},
    sync::atomic::{AtomicBool, AtomicUsize, Ordering},
};

use crate::{
    current_task, io, log_unchecked,
    memory::{self, SegmentSelector},
    set_eax, set_edx,
    task::{switch_context, RunningTask, TaskContext},
};

use super::TaskScheduler;

pub struct SchedulerLock {
    scheduler: UnsafeCell<TaskScheduler>,
}

pub struct SchedulerGuard<'a> {
    allow_task_switching: bool,
    restore_interrupts: bool,
    lock: &'a SchedulerLock,
    old_context: *mut TaskContext,
}

unsafe impl Send for SchedulerLock {}

unsafe impl Sync for SchedulerLock {}

impl<'a> Drop for SchedulerGuard<'a> {
    fn drop(&mut self) {
        if self.allow_task_switching
            && !ptr::eq(self.old_context, self.current.context_ptr())
        {
            log::debug!("Switching task");
            unsafe { self.lock.switch(self.old_context, self.current) }
        }

        if self.restore_interrupts {
            unsafe { io::enable() };
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
        Self {
            scheduler: UnsafeCell::new(TaskScheduler::new(task)),
        }
    }

    //let's say scheduler is locked somewhere
    //if it has been locked (interrupts disabled) then no other way
    //to obtain schedular in another thread (this thread is never executed)
    pub fn switch_lock(&self) -> SchedulerGuard<'_> {
        let restore_interrupts = unsafe { io::status() };

        unsafe { io::disable() };

        let old_context =
            unsafe { &*self.scheduler.get() }.current.context_ptr();

        SchedulerGuard {
            allow_task_switching: true,
            restore_interrupts,
            lock: self,
            old_context,
        }
    }

    pub fn access_lock(&self) -> SchedulerGuard<'_> {
        let restore_interrupts = unsafe { io::status() };

        unsafe { io::disable() };

        let old_context = unsafe { &mut *self.scheduler.get() }
            .current_task()
            .context_ptr();

        SchedulerGuard {
            restore_interrupts,
            allow_task_switching: false,
            lock: self,
            old_context,
        }
    }

    #[inline(never)]
    pub fn run(&self) -> ! {
        unsafe {
            let task = { &mut *self.scheduler.get() }.current_task();

            memory::switch_to_task(task);

            let context = task.context_ptr();

            let _ = task;

            core::arch::asm! {
                "mov esp, eax",
                "iretd",
                in("eax") (*context).esp + 16, //skip poping data segments
                options(noreturn)
            }
        }
    }

    /// scheduler should be already locked
    #[no_mangle]
    unsafe fn switch(
        &self,
        old_context: *mut TaskContext,
        new_task: &mut RunningTask,
    ) {
        let new_context = new_task.context_ptr();

        if ptr::eq(old_context, new_context) {
            log::warn!("Switching to already running task");
            return;
        }

        memory::switch_to_task(&mut *new_task);

        core::arch::asm! {
            "pushfd",
            "push ecx",
            "call switch_context",
            "",
            in("eax") old_context,
            in("edx") new_context,
            in("ecx") *SegmentSelector::KERNEL_CODE
        }

        log::debug!("Returning from switch");

        memory::switch_to_kernel();
    }
}
//the task to be invoked before passing execution to desirable task
