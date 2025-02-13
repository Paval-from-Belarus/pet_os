use kernel_types::collections::{BorrowingLinkedList, TinyLinkedList};

use crate::drivers::Handle;
use crate::interrupts::pic::PicLine;
use crate::interrupts::{pic, CallbackInfo};
use crate::memory;
use crate::memory::AllocationStrategy::Kernel;

///The manager struct that handle all request for given interrupt.
#[derive(Debug)]
pub struct InterruptObject {
    callbacks: spin::Mutex<TinyLinkedList<'static, CallbackInfo>>,
    //the interrupt number
    line: PicLine,
}

unsafe impl Sync for InterruptObject {}

unsafe impl Send for InterruptObject {}

impl InterruptObject {
    pub fn new(line: PicLine) -> Self {
        let callbacks = spin::Mutex::new(TinyLinkedList::empty());

        Self { callbacks, line }
    }

    pub fn dispatch(&self) {
        let mut is_dispatched = false;

        let callbacks = self.callbacks.lock();

        for callback in callbacks.iter() {
            is_dispatched |= callback.invoke(is_dispatched); //if first is already dispatch the interrupt then other can only check
        }

        drop(callbacks);

        if !is_dispatched {
            //todo: replace with system message
            log::info!("int {:?} is not dispatched", self.line);
            //if no one complete request simply suppress irq
            pic::complete(self.line);
        }
    }

    //the registration is appending callback to the end of sequence
    //to remove consider to add DriverHandle
    pub fn append(&self, stack_info: CallbackInfo) {
        let raw_node = memory::slab_alloc::<CallbackInfo>(Kernel)
            .expect("Failed to alloc interrupt object info");

        let node = raw_node.write(stack_info);

        let mut list = self.callbacks.lock();

        list.push_back(node.as_next());
    }

    pub fn remove(&self, removable: Handle) {
        let mut list = self.callbacks.lock();

        let mut iterator = list.iter_mut();

        while let Some(callback) = iterator.next() {
            if callback.driver.eq(&removable) {
                let node = iterator
                    .unlink_watched()
                    .expect("The node is only visited");
                memory::slab_dealloc(node);
            }
        }
    }

    pub fn line(&self) -> PicLine {
        self.line
    }
}
