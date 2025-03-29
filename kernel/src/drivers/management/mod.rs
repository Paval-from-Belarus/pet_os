use alloc::vec::Vec;
use kernel_types::drivers::DriverId;

use crate::{
    memory::{PhysicalAddress, VirtualAddress},
    syscall,
    common::SystemCall,
};

/// This module contains basic functionality for driver subssystem

pub enum Operation<'a> {
    Read {
        target: Target<'a>,
        source: Target<'a>,
    },
    Write {
        target: Target<'a>,
        data: Target<'a>,
    },
}

impl<'a> Operation<'a> {
    pub fn new_read(_data: &'a [u8], _target: Target) -> Option<Self> {
        todo!()
    }

    pub fn new_write(_data: &'a mut [u8], _target: Target) -> Option<Self> {
        todo!()
    }

    pub fn as_sys_call(&self) -> SystemCall {
        todo!()
    }
}

///the list of platform specific operatiion
pub enum Target<'a> {
    #[cfg(target_arch = "x86")]
    Port(&'a u8),

    VirtualMem(&'a VirtualAddress),
    PhysicalMem(&'a PhysicalAddress),
}

pub struct Message<'a> {
    //the source of message
    pub driver: DriverId,

    pub operations: Vec<Operation<'a>>,
}
