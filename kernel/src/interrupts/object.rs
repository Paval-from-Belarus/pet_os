use core::cell::UnsafeCell;
use core::mem::MaybeUninit;


use crate::interrupts::{CallbackInfo, pic};
use crate::{log, memory};
use crate::drivers::Handle;
use crate::interrupts::pic::{PicLine};
use crate::memory::AllocationStrategy::Kernel;
use kernel_types::collections::{BorrowingLinkedList, TinyLinkedList};
use crate::utils::atomics::{SpinLock};

///The manager struct that handle all request for given interrupt.
pub struct InterruptObject {
    callbacks: UnsafeCell<TinyLinkedList<'static, CallbackInfo>>,
    //the interrupt number
    line: PicLine,
    lock: SpinLock,
}

unsafe impl Sync for InterruptObject {}

unsafe impl Send for InterruptObject {}

impl InterruptObject {
    //the raw initial value to initialize static
    pub const unsafe fn default() -> Self {
        MaybeUninit::zeroed().assume_init()
    }
    pub fn new(line: PicLine) -> Self {
        let callbacks = UnsafeCell::new(TinyLinkedList::empty());
        let lock = SpinLock::new();
        Self { callbacks, line, lock }
    }
    pub fn dispatch(&self) {
        let mut is_dispatched = false;
        self.lock.acquire();
        let callbacks = unsafe { &*self.callbacks.get() };
        for callback in callbacks.iter() {
            is_dispatched |= callback.invoke(is_dispatched);//if first is already dispatch the interrupt then other can only check
        }
        self.lock.release();
        if !is_dispatched {
            //todo: replace with system message
            log!("int {:?} is not dispatched", self.line);
            //if no one complete request simply suppress irq
            pic::complete(self.line);
        }
    }
    //the registration is appending callback to the end of sequence
    //to remove consider to add DriverHandle
    pub fn add(&self, stack_info: CallbackInfo) {
        let raw_node = memory::slab_alloc::<CallbackInfo>(Kernel)
            .expect("Failed to alloc interrupt object info");
        let node = raw_node.write(stack_info);
        self.lock.acquire();
        unsafe {
            (*self.callbacks.get()).push_back(node.as_next());
        }
        self.lock.release();
    }
    pub fn remove(&self, removable: Handle) {
        self.lock.acquire();
        let list = unsafe { &mut *self.callbacks.get() };
        let mut iterator = list.iter_mut();
        while let Some(callback) = iterator.next() {
            if callback.driver.eq(&removable) {
                let node = iterator
                    .unlink_watched()
                    .expect("The node is only visited");
                memory::slab_dealloc(node);
            }
        }
        self.lock.release();
    }
    pub fn line(&self) -> PicLine {
        self.line
    }
}
