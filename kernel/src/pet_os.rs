#![no_std]
#![crate_name = "kernel"]
#![feature(slice_ptr_get)]
#![feature(let_chains)]
#![feature(const_trait_impl)]
#![feature(core_intrinsics)]
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

extern crate multiboot2;

use core::arch::asm;
use core::ptr;

use fallible_collections::FallibleVec;

use memory::PagingProperties;
use multiboot2::BootInformation;
use utils::logging;

use crate::process::TaskPriority;

#[cfg(any(not(target_arch = "x86")))]
compile_error!("Operation system is suitable for x86 CPU only");

mod boot;
mod drivers;
#[allow(dead_code)]
mod file_system;
#[allow(dead_code)]
mod interrupts;
#[allow(dead_code)]
mod memory;
mod process;
#[allow(dead_code)]
mod utils;

#[cfg(not(test))]
#[panic_handler]
pub fn panic(info: &core::panic::PanicInfo) -> ! {
    log!("kernel panics={}", info);
    unsafe { asm!("hlt", options(noreturn)) }
}

#[no_mangle]
pub unsafe extern "C" fn main() {
    let properties: *mut PagingProperties;
    asm!(
    "",
    out("eax") properties,
    options(nostack)
    );
    unsafe { rust_main(&mut *properties) };
}

pub extern "C" fn start(magic: u32, lp_header: *const u32) {
    logging::init();

    if magic != multiboot2::MAGIC {
        log!("Invalid grub2 magic");
        return;
    }

    let mbi_ptr = lp_header.cast();
    let mbi =
        unsafe { BootInformation::load(mbi_ptr).expect("Failed to load mbi") };

    log!("Working");
}

pub fn rust_main(properties: &mut PagingProperties) {
    logging::init();

    let dir_table = properties.page_directory();
    let heap_offset = properties.heap_offset();

    let allocator = properties.boot_allocator();

    memory::init_kernel_space(allocator, dir_table, heap_offset);

    interrupts::init();

    let gdt = unsafe { properties.gdt().as_mut() };
    memory::enable_task_switching(gdt);

    let thread_1 =
        process::new_task(task1, ptr::null_mut(), TaskPriority::HIGH);
    let thread_2 = process::new_task(task2, ptr::null_mut(), TaskPriority::LOW);

    process::submit_task(thread_1);
    process::submit_task(thread_2);
    process::run();
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

// pub(self) fn print_memory_map(mbi: &BootInformation) -> anyhow::Result<()> {
//     let memmap = mbi
//         .memory_map_tag()
//         .ok_or("Should have memory map")
//         .map_err(anyhow::Error::msg)?;
//     log::info!("12");
//
//     log!("Memory Map:");
//     memmap.memory_areas().iter().for_each(|e| {
//         log!(
//             "  0x{:010x} - 0x{:010x} ({:.3} MiB {:?})",
//             e.start_address(),
//             e.end_address(),
//             e.size() as f32 / 1024.0 / 1024.0,
//             e.typ()
//         );
//     });
//     Ok(())
// }
//
// pub(self) fn print_elf_info(mbi: &BootInformation) -> anyhow::Result<()> {
//     let sections_iter = mbi
//         .elf_sections()
//         .ok_or("Should have elf sections")
//         .map_err(anyhow::Error::msg)?;
//     log!("ELF sections:");
//     for s in sections_iter {
//         let typ = log!("{:?}", s.section_type());
//         let flags = log!("{:?}", s.flags());
//         let name = s.name().map_err(anyhow::Error::msg)?;
//         log!(
//             "  {:<13} {:<17} {:<22} 0x{:010x} 0x{:010x} {:>5.2} MiB align={}",
//             name,
//             typ,
//             flags,
//             s.start_address(),
//             s.end_address(),
//             s.size() as f32 / 1024.0,
//             s.addralign(),
//         );
//     }
//     Ok(())
// }
//
// pub(self) fn print_module_info(mbi: &BootInformation) -> anyhow::Result<()> {
//     let modules = mbi.module_tags().collect::<Vec<_>>();
//     // mbi.module_tags()
//
//     if modules.len() != 1 {
//         Err(anyhow::Error::msg("Should have exactly one boot module"))?
//     }
//     let module = modules.first().unwrap();
//     let module_cmdline = module.cmdline().map_err(anyhow::Error::msg)?;
//     log!("Modules:");
//     log!(
//         "  0x{:010x} - 0x{:010x} ({} B, cmdline='{}')",
//         module.start_address(),
//         module.end_address(),
//         module.module_size(),
//         module_cmdline
//     );
//     log!(" grub cfg passed as boot module:");
//     let grup_cfg_ptr = module.start_address() as *const u32 as *const u8;
//     let grub_cfg = unsafe {
//         core::slice::from_raw_parts(grup_cfg_ptr, module.module_size() as usize)
//     };
//
//     // In the GRUB bootflow case, we pass the config as module with it. This is
//     // not done for the chainloaded case.
//     if let Ok(str) = core::str::from_utf8(grub_cfg) {
//         log!("=== file begin ===");
//         for line in str.lines() {
//             log!("    > {line}");
//         }
//         log!("=== file end ===");
//     }
//
//     Ok(())
// }
