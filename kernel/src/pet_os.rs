#![no_std]
#![no_main]
#![crate_name = "kernel"]
#![feature(let_chains)]
#![feature(const_trait_impl)]
#![feature(abi_x86_interrupt)]
#![feature(allocator_api)]
#![feature(ascii_char)]
// really raw features
#![feature(maybe_uninit_uninit_array_transpose)]
#![feature(maybe_uninit_array_assume_init)]
#![feature(hasher_prefixfree_extras)]
#![feature(naked_functions)]

extern crate alloc;
extern crate fallible_collections;
extern crate num_enum;
extern crate spin;
extern crate static_assertions;

extern crate multiboot2;

use core::arch::asm;
use core::ptr;

use common::logging;
use memory::PagingProperties;

use crate::task::TaskPriority;

#[cfg(not(target_arch = "x86"))]
compile_error!("Operation system is suitable for x86 CPU only");

mod boot;
mod drivers;
#[allow(dead_code)]
mod fs;
#[allow(dead_code)]
mod interrupts;
#[allow(dead_code)]
mod memory;

#[allow(dead_code)]
mod common;
mod object;
mod task;

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

pub fn rust_main(properties: &mut PagingProperties) {
    logging::init();

    let directory = properties.page_directory();
    let heap_offset = properties.heap_offset();

    let allocator = properties.boot_allocator();

    memory::init_kernel_space(allocator, directory, heap_offset);
    log::info!("memory is initialized");

    interrupts::init();
    log::info!("interrupts are initialized");

    let gdt = unsafe { properties.gdt().as_mut() };
    memory::enable_task_switching(gdt);

    log::info!("Task switching is enabled");

    let thread_1 =
        task::new_task(task1, ptr::null_mut(), TaskPriority::Module(0));

    let thread_2 = task::new_task(task2, ptr::null_mut(), TaskPriority::Kernel);

    task::submit_task(thread_1);
    task::submit_task(thread_2);

    task::run();
}

extern "C" fn task1() {
    log::info!("task 1 started");

    log::info!("Task 1 priority: {}", current_task!().priority);

    loop {
        task::sleep(300);
        log!("task 1 awaken");
    }
}

extern "C" fn task2() {
    log::info!("task 2 started");

    log::info!("Task 2 priority: {}", current_task!().priority);

    loop {
        task::sleep(400);
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
