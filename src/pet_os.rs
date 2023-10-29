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
// #![feature(const_mut_refs)]
#[cfg(any(not(target_arch = "x86")))]
compile_error!("Operation system is suitable for Intel i686");

#[cfg(test)]
extern crate static_assertions;
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


use memory::PagingProperties;
//the minimal amount of memory is 16 MiB
// #[cfg(not(test))]
// #[lang = "eh_personality"]
// pub extern "C" fn eh_personality() {}
// #[cfg(not(test))]
// #[macro_use]
// extern crate static_assertions;
// extern crate bitfield;
// extern crate bitflags;
// extern crate alloc;
//
// use core::arch::asm;

//
// use memory::{PagingProperties, UtilsAllocator};
//
// static ALLOCATOR: UtilsAllocator = UtilsAllocator::empty();
#[cfg(not(test))]
#[panic_handler]
pub fn panic(_info: &PanicInfo) -> ! {
    stop_execution();
}

pub fn stop_execution() -> ! {
    unsafe {
        asm!("hlt");
    }
    unsafe { intrinsics::unreachable() };
}

#[cfg(not(test))]
#[no_mangle]
#[allow(dead_code)]
pub unsafe extern "C" fn main() {
    let properties: *const PagingProperties;
    asm! {
    "mov {}, eax",
    out(reg) properties
    };
    // pub unsafe extern "C" fn main(values: *const u8) {
    unsafe {
        let allocator = (*properties).allocator();
        let mut marker = (*properties).page_marker();
        // memory::init_kernel_space(allocator, marker)
        let _page_allocator = PageAllocator::new(allocator, &mut marker, 0);
    };
    interrupts::init();
    // ALLOCATOR.configure(allocator, layout);

    // let ranges = unsafe {
    //     core::slice::from_raw_parts_mut(records, records_cnt)
    // };
    // let dir_offset = records as *mut DirEntry;
    // let dir_entries: &mut [DirEntry; 1024] = {

    //     core::slice::from_raw_parts_mut(dir_offset, 1024).try_into().unwrap()
    // };
    // let marker = PageMarker::wrap(dir_entries);
    // let allocator = with_alloca(records_cnt * core::mem::size_of::<CaptureMemRec>(), |stack_buffer| {
    //     let mut stack_buffer = stack_buffer.as_mut_ptr() as *mut CaptureMemRec;
    //     let mut captures: &mut [CaptureMemRec] = unsafe {
    //         core::slice::from_raw_parts_mut(stack_buffer, records_cnt)
    //     };
    //     //todo! init PageManager and set paging through asm code
    //     let mut allocator = CaptureAllocator::new(captures);
    //     allocator.alloc(CaptureOffset::Start(kernel_offset), kernel_size);//capture memory where kernel stored
    //     let user_marker = marker.new(|page_cnt| allocator.alloc(CaptureOffset::Any, page_cnt) );
    //     return KernelAllocator::new(&mut allocator, );
    // });
    // let numbers = [1, 2, 12];
    // let sum: u32 = numbers.iter().sum();
    // asm! {
    // "mov eax, {0}",
    // in(reg) sum
    // };
    // asm!(
    // "hlt"
    // )
}

use crate::memory::PageAllocator;
use core::arch::asm;
use core::{hint, intrinsics, ptr, slice};
use core::panic::PanicInfo;
// use crate::memory::PagingProperties;
// use crate::memory::PageRecFlag;

//
// #[cfg(not(test))]
// #[lang = "eh_personality"]
// pub extern "C" fn eh_personality() {}
//
// #[cfg(not(test))]
// #[lang = "panic_impl"]
// #[panic_handler]
// #[no_mangle]
// pub unsafe extern "C" fn panic_impl(pi: &PanicInfo) -> ! {
//     asm! {
//     "hlt"
//     }
//     unreachable!()
// }

// //
