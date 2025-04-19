use kernel_types::collections::{BorrowingLinkedList, LinkedList};

use crate::drivers::Handle;
use crate::interrupts::pic::PicLine;
use crate::interrupts::{pic, CallbackInfo};
use crate::memory::{self, Slab, SlabBox};
use crate::ticks_now;

use super::TaskContext;

///The manager struct that handle all request for given interrupt.
#[derive(Debug)]
pub struct InterruptObject {
    callbacks: spin::Mutex<LinkedList<'static, CallbackInfo>>,
    //the interrupt number
    line: PicLine,
}

impl Slab for InterruptObject {
    const NAME: &str = "int_obj";
}

unsafe impl Sync for InterruptObject {}

unsafe impl Send for InterruptObject {}

impl InterruptObject {
    pub fn new(line: PicLine) -> Self {
        let callbacks = spin::Mutex::new(Default::default());

        Self { callbacks, line }
    }

    #[no_mangle]
    pub fn dispatch(&self, frame: &mut *mut TaskContext) {
        log::debug!("Dispatching {:?}. Time = {}", self.line, ticks_now!());

        let mut is_dispatched = false;

        let callbacks = self.callbacks.try_lock().unwrap();

        for callback in callbacks.iter() {
            is_dispatched |= callback.invoke(is_dispatched, frame); //if first is already dispatch the interrupt then other can only check
        }

        drop(callbacks);

        if !is_dispatched {
            log::error!("{:?} is not dispatched", self.line);
            //if no one complete request simply suppress irq
            pic::complete(self.line);
        }
    }

    //the registration is appending callback to the end of sequence
    //to remove consider to add DriverHandle
    pub fn append(&self, stack_info: CallbackInfo) {
        let boxed_info = memory::slab_alloc(stack_info)
            .expect("Failed to alloc interrupt object info");

        let leaked_info = SlabBox::leak(boxed_info);

        let mut list = self.callbacks.try_lock().unwrap();

        list.push_back(leaked_info.as_next());
    }

    pub fn remove(&self, removable: Handle) {
        let mut list = self.callbacks.try_lock().unwrap();

        let mut iterator = list.iter_mut();

        while let Some(callback) = iterator.next() {
            if callback.driver.eq(&removable) {
                let node = iterator
                    .unlink_watched()
                    .expect("The node is only visited");

                let _ = node.into_boxed();
            }
        }
    }

    pub fn line(&self) -> PicLine {
        self.line
    }
}
