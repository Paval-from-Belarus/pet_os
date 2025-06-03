use kernel_types::collections::LinkedList;

use crate::io::pic::PicLine;
use crate::io::{pic, CallbackInfo};
use crate::memory::{self, Slab, SlabBox};
use crate::{object, ticks_now};

use crate::task::TaskContext;

///The manager struct that handle all request for given interrupt.
#[derive(Debug)]
pub struct IrqChain {
    callbacks: spin::Mutex<LinkedList<'static, CallbackInfo>>,
    //the interrupt number
    line: PicLine,
}

impl Slab for IrqChain {
    const NAME: &str = "irq_chain";
}

unsafe impl Sync for IrqChain {}

unsafe impl Send for IrqChain {}

impl IrqChain {
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

    pub fn remove(&self, removable: object::RawHandle) {
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
