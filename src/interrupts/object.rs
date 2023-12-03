use core::ptr::NonNull;
use crate::interrupts::{Callback, CallbackInfo, enter_kernel_trap, leave_kernel_trap};
use crate::{log, memory};
use crate::utils::{SimpleList, SimpleListNode};

///The manager struct that handle all request for given interrupt.
pub struct InterruptObject {
    callbacks: SimpleList<CallbackInfo>,
    id: usize,//the interrupt number
}

impl InterruptObject {
    pub fn dispatch(&self) {
        let mut is_dispatched = false;
        for callback in self.callbacks.iter() {
            is_dispatched |= callback.invoke(is_dispatched);//if first is already dispatch the interrupt then other can only check
        }
        if !is_dispatched {
            log!("int {} is not dispatched", self.id);
        }
    }
    //the registration is appending callback to the end of sequence
    pub fn registry(&mut self, stack_info: CallbackInfo) {
        let raw_node = memory::slab_alloc::<SimpleListNode<CallbackInfo>>();
        let node = raw_node.write(SimpleListNode::wrap_data(stack_info));
        self.callbacks.push_back(node);
    }
}

