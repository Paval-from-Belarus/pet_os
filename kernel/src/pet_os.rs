#![no_std]
#![crate_name = "kernel"]
#![feature(slice_ptr_get)]
#![feature(let_chains)]
#![feature(core_intrinsics)]
#![feature(ptr_from_ref)]
#![feature(const_trait_impl)]
#![feature(abi_x86_interrupt)]
#![feature(allocator_api)]

#![feature(pointer_byte_offsets)]
#![feature(ptr_sub_ptr)]
#![feature(offset_of)]
#![feature(ascii_char)]

// really raw features
#![feature(maybe_uninit_uninit_array)]
#![feature(const_maybe_uninit_zeroed)]
#![feature(maybe_uninit_array_assume_init)]
#![feature(hasher_prefixfree_extras)]

extern crate alloc;
extern crate fallible_collections;
extern crate num_enum;
extern crate static_assertions;

use core::arch::asm;
use core::ptr;

use fallible_collections::FallibleVec;

use memory::PagingProperties;
use utils::logging;

use crate::process::TaskPriority;

#[cfg(any(not(target_arch = "x86")))]
compile_error!("Operation system is suitable for x86 CPU only");


#[allow(dead_code)]
mod file_system;
#[allow(dead_code)]
mod interrupts;
#[allow(dead_code)]
mod memory;
#[allow(dead_code)]
mod utils;
mod drivers;
mod process;

#[cfg(not(test))]
#[panic_handler]
pub fn panic(info: &core::panic::PanicInfo) -> ! {
    log!("kernel panics={}", info);
    unsafe { asm!("hlt", options(noreturn)) }
}

#[no_mangle]
#[cfg(not(test))]
pub unsafe extern "C" fn main() {
    let properties: *const PagingProperties;
    asm!(
    "",
    out("eax") properties,
    options(nostack)
    );
    unsafe { rust_main(&*properties) };
}

#[no_mangle]
pub extern "C" fn _start() {
    logging::init();
    log!("Working");
}

pub fn rust_main(properties: &PagingProperties) {
    logging::init();
    let allocator = properties.allocator();
    let dir_table = properties.page_directory();
    let heap_offset = properties.heap_offset();
    memory::init_kernel_space(allocator, dir_table, heap_offset);
    interrupts::init();
    let gdt = unsafe { properties.gdt().as_mut() };
    memory::enable_task_switching(gdt);
    let thread_1 = process::new_task(task1, ptr::null_mut(), TaskPriority::HIGH);
    let thread_2 = process::new_task(task2, ptr::null_mut(), TaskPriority::LOW);
    process::submit_task(thread_1);
    process::submit_task(thread_2);
    process::run();
}

pub fn multi_boot_main(magic: u32, lp_header: *const u32) {
}
fn task1(_context: *mut ()) {
    log!("task 1 started");
    loop {
        process::sleep(300);
        log!("task 1 awaken");
    }
}

fn task2(_context: *mut ()) {
    log!("task 2 started");
    loop {
        process::sleep(400);
        log!("task 2 awaken");
    }
}
