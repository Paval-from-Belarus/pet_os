#![no_std]
#![feature(lang_items)]
#![feature(slice_ptr_get)]

#[cfg(not(test))]
#[lang = "eh_personality"]
pub extern "C" fn eh_personality() {}

#[cfg(test)]
extern crate static_assertions;
extern crate bitfield;
extern crate bitflags;
extern crate spin;
extern crate alloca;

mod paging;
mod memory;

use core::arch::asm;
use core::ptr;

use panic_halt as _;
use alloca::{with_alloca};
use paging::{MemRangeRec, CaptureMemRec};
use paging::{CaptureAllocator, KernelAllocator};
use crate::memory::{DirEntry, PageMarker};
use crate::paging::{Allocator, AllocOffset, Page};

#[repr(packed)]
pub struct KernelProperties<'a> {
    captures: &'a mut [CaptureMemRec],
    directory: &'a  mut [DirEntry]
}
fn test_main() {
    
}
#[cfg(not(test))]
#[no_mangle]
pub unsafe extern "C" fn main(records_cnt: usize, records: *mut MemRangeRec) {
    let kernel_size = 0x42;
    let kernel_offset = 0x10;
    let ranges = unsafe {
        core::slice::from_raw_parts_mut(records, records_cnt)
    };
    let allocator = with_alloca(records_cnt * core::mem::size_of::<CaptureMemRec>(), |stack_buffer| {
        let mut stack_buffer = stack_buffer.as_mut_ptr() as *mut CaptureMemRec;
        let mut captures: &mut [CaptureMemRec] = unsafe {
            core::slice::from_raw_parts_mut(stack_buffer, records_cnt)
        };
        //todo! init PageManager and set paging through asm code
        let mut allocator = CaptureAllocator::new(captures);
        allocator.alloc(AllocOffset::Start(kernel_offset), kernel_size);//capture memory where kernel stored
        return KernelAllocator::new(&mut allocator);
    });
    let numbers = [1, 2, 12];
    let sum: u32 = numbers.iter().sum();
    asm! {
    "mov eax, {0}",
    in(reg) sum
    };
}
