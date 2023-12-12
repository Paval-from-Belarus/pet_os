#![no_std]
#![crate_name = "pet_os"]
//#![feature(lang_items)]
#![feature(slice_ptr_get)]
#![feature(let_chains)]
#![feature(core_intrinsics)]
#![feature(ptr_from_ref)]
#![feature(const_trait_impl)]
#![feature(abi_x86_interrupt)]
#![feature(const_maybe_uninit_zeroed)]
#![feature(allocator_api)]
#![feature(pointer_byte_offsets)]
#![feature(ptr_sub_ptr)]
// #![feature(const_mut_refs)]
#[cfg(any(not(target_arch = "x86")))]
compile_error!("Operation system is suitable for Intel i686");
extern crate static_assertions;
extern crate num_enum;

#[cfg(not(test))]
#[allow(dead_code)]
#[macro_use]
mod file_system;
#[allow(dead_code)]
mod interrupts;
#[allow(dead_code)]
mod memory;
#[allow(dead_code)]
mod utils;
mod drivers;
mod process;

use memory::PagingProperties;

#[cfg(not(test))]
#[panic_handler]
pub fn panic(info: &core::panic::PanicInfo) -> ! {
    log!("kernel panics={}", info);
    unsafe { asm!("hlt", options(noreturn)) }
}

use core::arch::asm;
use core::ptr;
use utils::logging;

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


pub fn rust_main(properties: &PagingProperties) {
    logging::init();
    let allocator = properties.allocator();
    let dir_table = properties.page_directory();
    let heap_offset = properties.heap_offset();
    memory::init_kernel_space(allocator, dir_table, heap_offset);
    interrupts::init();
    let gdt = unsafe { properties.gdt().as_mut() };
    memory::enable_task_switching(gdt);
    let thread_1 = process::new_task(task1, ptr::null_mut());
    let thread_2 = process::new_task(task2, ptr::null_mut());
    process::submit_task(thread_1);
    process::submit_task(thread_2);
    process::run();
}

fn task1(_context: *mut ()) {
    unsafe { interrupts::enable() };
    log!("task 1 started");
    loop {
        process::sleep(300);
        log!("task 1 awaken");
    }
}

fn task2(_context: *mut ()) {
    unsafe { interrupts::enable() };
    log!("task 2 started");
    loop {
        process::sleep(400);
        log!("task 2 awaken");
    }
}