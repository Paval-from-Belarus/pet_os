#![no_std]
#![feature(lang_items)]
#![feature(slice_ptr_get)]
#![feature(let_chains)]
#![feature(core_intrinsics)]
#![feature(ptr_from_ref)]
#![feature(const_trait_impl)]

mod memory;
mod file_system;

#[cfg(not(test))]
#[lang = "eh_personality"]
pub extern "C" fn eh_personality() {}

#[cfg(test)]
extern crate static_assertions;
extern crate bitfield;
extern crate bitflags;
extern crate spin;
// extern crate alloc;


use core::arch::asm;
use core::mem::align_of;
use core::ptr;

use panic_halt as _;
use memory::{PagingProperties, PageAllocator, UtilsAllocator};

static ALLOCATOR: UtilsAllocator = UtilsAllocator::empty();

#[cfg(not(test))]
#[no_mangle]
pub unsafe extern "C" fn main(properties: *const PagingProperties) {
    let (allocator, layout) = unsafe {
        let allocator = (*properties).allocator();
        let marker = (*properties).page_marker();
        memory::init_kernel_space(allocator, marker)
    };
    ALLOCATOR.configure(allocator, layout);

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
    let numbers = [1, 2, 12];
    let sum: u32 = numbers.iter().sum();
    asm! {
    "mov eax, {0}",
    in(reg) sum
    };
}
