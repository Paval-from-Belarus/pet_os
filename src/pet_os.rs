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

use memory::PagingProperties;

#[cfg(not(test))]
#[panic_handler]
pub fn panic(info: &core::panic::PanicInfo) -> ! {
    log!("kernel panics={}", info);
    unsafe { asm!("hlt", options(noreturn)) }
}

use core::arch::asm;
use utils::logging;

#[no_mangle]
#[allow(dead_code)]
#[cfg(not(test))]
pub unsafe extern "C" fn main() {
    let properties: *const PagingProperties;
    asm!(
    "",
    out("eax") properties
    );
    logging::init();
    unsafe {
        let allocator = (*properties).allocator();
        let dir_table = (*properties).page_directory();
        let heap_offset = (*properties).heap_offset();
        memory::init_kernel_space(allocator, dir_table, heap_offset);
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