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
use alloc::{
    string::{String, ToString},
    sync::Arc,
    vec::Vec,
};
use common::logging;
use kernel_types::{fs::DirEntriesInfo, get_eax};
use memory::PagingProperties;
use object::Handle;
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

    let input = fs::resolve(input).expect("Failed to resolve keyboard");
    let output = fs::resolve(output).expect("Failed to resolve vga");

    // let disk = fs::open("/dev/ata").unwrap();
    // let disk = fs::resolve(disk).expect("Failed to open disk");
    //
    // let buf = KernelBuf::new(512).unwrap();

    // let work = fs::read(disk, buf.clone()).unwrap();
    // work.wait().unwrap().status().unwrap();

    // log::debug!("Read from file: {:x?}", *buf.as_slice());
    // let show_work = fs::write(output, buf.clone()).unwrap();
    // show_work.wait().unwrap().status().unwrap();

    // let work = fs::dir_entries("/dev/").unwrap();
    // let entries = work.wait().unwrap().dir_entries().unwrap();

    // let new_line: Handle<KernelBuf> = "\n".try_into().unwrap();

    // for entry in entries.entries {
    //     let buf = entry.as_str().try_into().unwrap();
    //     let _work = fs::write(output, buf).unwrap();
    //     let _work = fs::write(output, new_line.clone());
    // }

    let mut cur_dir = "/".to_string();

    let buf = KernelBuf::new(1).unwrap();

    let mut parser = CommandParser::new();

    let modinfo_title: Handle<KernelBuf> =
        "Name:    Status:  \n".try_into().unwrap();

    let modinfo_content = KernelBuf::new(100).unwrap();
    let name: Handle<KernelBuf> = "\nuser$".try_into().unwrap();

    let mut should_print_name = true;
    loop {
        buf.reset();

        if should_print_name {
            let _work = fs::write(output, name.clone()).unwrap();
            should_print_name = false;
        }

        let read_work = fs::read(input, buf.clone()).unwrap();
        read_work.wait().unwrap().status().unwrap();

        let byte = buf.as_slice()[0];

        let write_work = fs::write(output, buf.clone()).unwrap();
        let _status = write_work.wait().unwrap();

        let Some(cmd) = parser.process_byte(byte) else {
            continue;
        };

        should_print_name = true;

        match cmd {
            Command::Cd(new_path) => {
                cur_dir = normalize_path(&cur_dir, &new_path);
            }
            Command::Modinfo => {
                let modules = drivers::modules();
                let _work = fs::write(output, modinfo_title.clone())
                    .unwrap()
                    .wait()
                    .unwrap();

                for module in modules {
                    modinfo_content.reset();
                    modinfo_content.copy_from(module.name.as_bytes()).unwrap();
                    modinfo_content.copy_from("    ".as_bytes()).unwrap();
                    modinfo_content
                        .copy_from(module.status.as_bytes())
                        .unwrap();

                    modinfo_content.copy_from(&[10]).unwrap();

                    let work =
                        fs::write(output, modinfo_content.clone()).unwrap();
                    let _status = work.wait().unwrap();
                }
            }
            Command::Pwd => {
                modinfo_content.reset();
                let _work =
                    fs::write(output, cur_dir.as_str().try_into().unwrap())
                        .unwrap();
            }
            Command::Ls => todo!(),
            Command::Echo(_, _) => todo!(),
            Command::Cat(_) => {}
            Command::Invalid => {
                continue;
            }
            Command::Files => todo!(),
        }
    }
}

fn print_ls(output: usize, entries: &DirEntriesInfo) {
    let new_line: Handle<KernelBuf> = "\n".try_into().unwrap();

    for entry in &entries.entries {
        let _work =
            fs::write(output, entry.as_str().try_into().unwrap()).unwrap();

        let _work = fs::write(output, new_line.clone()).unwrap();
    }
}

pub fn normalize_path(current_dir: &str, new_path: &str) -> String {
    // Handle empty inputs
    if new_path.is_empty() {
        return if current_dir.is_empty() {
            String::from("/")
        } else {
            normalize_components(current_dir)
        };
    }

    // Determine the base path
    let base = if new_path.starts_with('/') {
        // Absolute path: ignore current_dir
        String::new()
    } else {
        // Relative path: start with current_dir
        if current_dir.is_empty() || current_dir == "/" {
            String::from("/")
        } else {
            normalize_components(current_dir)
        }
    };

    // Combine base and new_path
    let combined = if base == "/" || base.is_empty() {
        String::from(new_path)
    } else {
        alloc::format!("{}/{}", base, new_path)
    };

    // Normalize the combined path
    normalize_components(&combined)
}

/// Helper function to normalize path components (slashes, ., ..)
fn normalize_components(path: &str) -> String {
    // Split path into components, ignoring empty or redundant slashes
    let components: Vec<&str> = path
        .split('/')
        .filter(|&c| !c.is_empty() && c != ".")
        .collect();

    // Process components, handling ..
    let mut result: Vec<&str> = Vec::new();
    for component in components {
        if component == ".." {
            result.pop(); // Remove last component (go up one dir)
        } else {
            result.push(component);
        }
    }

    // Construct normalized path
    if result.is_empty() {
        String::from("/")
    } else {
        let mut normalized = String::from("/");
        for (i, component) in result.iter().enumerate() {
            normalized.push_str(component);
            if i < result.len() - 1 {
                normalized.push('/');
            }
        }
        normalized
    }
}

#[derive(Debug, PartialEq)]
pub enum Command {
    Pwd,
    Cd(String),                   // cd <path>
    Modinfo,                      // modinfo
    Ls,                           // ls
    Echo(String, Option<String>), // echo "Text" <optional_file_name>
    Cat(String),                  // cat <file_name>
    Invalid,
    Files,
}

// Parser state for collecting bytes
#[derive(Debug)]
pub struct CommandParser {
    buffer: String, // Collects incoming bytes
}

impl CommandParser {
    // Create a new parser
    pub fn new() -> Self {
        CommandParser {
            buffer: String::new(),
        }
    }

    pub fn remove_byte(&mut self) {
        let _ = self.buffer.pop();
    }

    // Process a single byte, returning a command if complete
    pub fn process_byte(&mut self, byte: u8) -> Option<Command> {
        // Handle newline as command terminator
        if byte == b'\n' {
            let command = self.parse_command();
            self.buffer.clear();
            return Some(command);
        } else if byte == 13 {
            let _ = self.buffer.pop();
            return None;
        }

        // Append ASCII byte to buffer (ignore non-ASCII for simplicity)
        if byte.is_ascii() {
            self.buffer.push(byte as char);
        }

        None
    }

    // Parse the collected buffer into a Command
    fn parse_command(&self) -> Command {
        let input = self.buffer.trim();
        if input.is_empty() {
            return Command::Invalid;
        }

        // Split into tokens (simple space-based splitting)
        let tokens: Vec<&str> = input.split_whitespace().collect();

        if tokens.is_empty() {
            return Command::Invalid;
        }

        match tokens[0].to_lowercase().as_str() {
            "cd" => {
                if tokens.len() == 2 {
                    Command::Cd(String::from(tokens[1]))
                } else {
                    Command::Invalid
                }
            }

            "pwd" => Command::Pwd,
            "files" => Command::Files,
            "modinfo" => {
                if tokens.len() == 1 {
                    Command::Modinfo
                } else {
                    Command::Invalid
                }
            }
            "ls" => {
                if tokens.len() == 1 {
                    Command::Ls
                } else {
                    Command::Invalid
                }
            }
            "echo" => {
                if tokens.len() < 2 {
                    return Command::Invalid;
                }

                // Expect quoted text for echo
                let text = self.parse_quoted_text(input);
                if text.is_empty() {
                    return Command::Invalid;
                }

                // Check for optional file name (after quoted text)
                let file_name = if tokens.len() > 2 && input.contains('"') {
                    let after_quote = input
                        .split_once('"')
                        .map(|x| x.1)
                        .map(|s| s.trim_start_matches('"').trim())
                        .filter(|s| !s.is_empty());

                    after_quote.map(String::from)
                } else {
                    None
                };

                Command::Echo(String::from(text), file_name)
            }
            "cat" => {
                if tokens.len() == 2 {
                    Command::Cat(String::from(tokens[1]))
                } else {
                    Command::Invalid
                }
            }
            _ => Command::Invalid,
        }
    }

    // Helper to extract quoted text for echo (e.g., "Text" -> Text)
    fn parse_quoted_text<'a>(&self, input: &'a str) -> &'a str {
        let parts: Vec<&str> = input.splitn(2, '"').collect();

        if parts.len() < 2 {
            return "";
        }

        parts[1].split('"').next().unwrap_or("").trim()
    }
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
