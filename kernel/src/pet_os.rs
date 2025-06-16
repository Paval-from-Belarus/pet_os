#![no_std]
#![no_main]
#![crate_name = "kernel"]
#![feature(const_trait_impl)]
#![feature(abi_x86_interrupt)]
#![feature(allocator_api)]
#![feature(ascii_char)]
// really raw features
#![feature(maybe_uninit_uninit_array_transpose)]
#![feature(maybe_uninit_array_assume_init)]
#![feature(hasher_prefixfree_extras)]
#![feature(naked_functions)]
#![feature(try_with_capacity)]

extern crate alloc;
extern crate fallible_collections;
extern crate num_enum;
extern crate spin;
extern crate static_assertions;

extern crate multiboot2;

use crate::task::TaskPriority;
use alloc::sync::Arc;
use common::logging;
use kernel_types::get_eax;
use memory::PagingProperties;
use task::Mutex;
use user::kernel_buf::KernelBuf;

#[cfg(not(target_arch = "x86"))]
compile_error!("Operation system is suitable for x86 CPU only");

mod boot;
mod drivers;
#[allow(dead_code)]
mod fs;
#[allow(dead_code)]
mod io;
#[allow(dead_code)]
mod memory;

#[allow(dead_code)]
mod common;
pub mod error;
mod object;
mod task;
mod user;

#[cfg(not(test))]
#[panic_handler]
pub fn panic(info: &core::panic::PanicInfo) -> ! {
    unsafe { io::disable() };
    log::error!("kernel panics={}", info);
    unsafe { core::arch::asm!("hlt", options(noreturn)) }
}

#[no_mangle]
pub fn main() {
    let properties: &mut PagingProperties = unsafe {
        let raw_properies: *mut PagingProperties = get_eax!();
        &mut *raw_properies
    };

    logging::init();

    unsafe {
        io::disable();
    }

    // drivers::vga::init();

    memory::init_kernel_space(properties);
    log::info!("memory is initialized");

    io::init();
    log::info!("interrupts are initialized");

    fs::init();

    memory::enable_task_switching();

    log::info!("Task switching is enabled");

    drivers::init();

    // let mutex = Arc::new(Mutex::new(3usize).unwrap());
    //
    // let mutex_1 = mutex.clone();
    //
    // let thread_1 = task::new_task(
    //     mutex_task,
    //     Arc::into_raw(mutex) as _,
    //     TaskPriority::Kernel,
    // )
    // .unwrap();
    //
    // let thread_2 = task::new_task(
    //     mutex_task,
    //     Arc::into_raw(mutex_1) as _,
    //     TaskPriority::Module(0),
    // )
    // .unwrap();
    //
    // let thread_3 =
    //     task::new_task(task3, core::ptr::null_mut(), TaskPriority::User(10))
    //         .unwrap();
    //
    // let thread_4 =
    //     task::new_task(task3, core::ptr::null_mut(), TaskPriority::User(5))
    //         .unwrap();
    //
    // task::submit_task(thread_1);
    // task::submit_task(thread_2);
    // task::submit_task(thread_3);
    // task::submit_task(thread_4);

    let init_task =
        task::new_task(init_task, core::ptr::null_mut(), TaskPriority::Kernel)
            .unwrap();

    task::submit_task(init_task);

    task::run();
}

extern "C" fn init_task(_args: *const ()) {
    log::debug!("Init task#{} is started", current_task!().id);

    unsafe { fs::mount_dev_fs() }.expect("Failed to mount dev-fs");

    let output = fs::open("/dev/vga").unwrap();

    let input = fs::open("/dev/keybrd").unwrap();

    let disk = fs::open("/dev/ata").unwrap();

    let input = fs::resolve(input).expect("Failed to resolve keyboard");
    let output = fs::resolve(output).expect("Failed to resolve vga");

    let disk = fs::resolve(disk).expect("Failed to open disk");

    let buf = KernelBuf::new(512).unwrap();

    let work = fs::read(disk, buf.clone()).unwrap();
    work.wait().unwrap().status().unwrap();

    log::debug!("Read from file: {:x?}", *buf.as_slice());
    let show_work = fs::write(output, buf.clone()).unwrap();
    show_work.wait().unwrap().status().unwrap();

    let buf = KernelBuf::new(1).unwrap();

    loop {
        buf.reset();

        let read_work = fs::read(input, buf.clone()).unwrap();
        read_work.wait().unwrap().status().unwrap();

        let write_work = fs::write(output, buf.clone()).unwrap();
        write_work.wait().unwrap().status().unwrap();
    }

    // let response = work.wait().unwrap();
    //
    // log::debug!("work response: {response:?}");
    //
    // let buf2 = "Another line\n".try_into().unwrap();
    // let work = fs::write(file, buf2).unwrap();
    //
    // let response = work.wait().unwrap();
    // log::debug!("work response: {response:?}");

    // user::exec("/usr/sbin/init");
}

#[allow(unused)]
extern "C" fn task3() {
    log::info!("task 3 started");

    let task_id = current_task!().id;
    loop {
        for i in 0..100 {
            log::info!("Task {task_id} #{i}");
        }

        task::sleep(10);
    }
}

#[allow(unused)]
extern "C" fn mutex_task() {
    let mutex = unsafe {
        let ptr: *const Mutex<usize> = get_eax!();

        log::debug!("Mutex: {ptr:?}");

        Arc::from_raw(ptr)
    };

    let id = current_task!().id;

    log::info!("task {id} started");

    log::info!("Task {id} priority: {}", current_task!().priority);

    for _ in 0..100_000 {
        log::debug!("Before mutex taken task#{id}");

        let mut lock = mutex.lock();

        log::debug!("Value taken: {} in task#{id}", *lock);
        *lock += 1;
    }

    loop {
        task::sleep(10);
        log::info!("Task#{id} is awaken");
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
