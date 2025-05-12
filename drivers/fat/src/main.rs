#![no_std]
#![no_main]

// mod boot_sector;
// mod fs;
// mod time;
// mod dir_entry;
// mod file;
// mod byteorder_core_io;
// mod dir;
// mod table;

use kernel_lib::fs::{self, FileSystemKind};

// extern crate alloc;
extern crate core;

#[cfg(not(test))]
#[panic_handler]
pub fn panic(_info: &core::panic::PanicInfo) -> ! {
    unsafe { core::arch::asm!("hlt", options(noreturn)) }
}

pub fn handle_work(work: ()) {
    //мы знаем, что система смонтирована
}

#[no_mangle]
unsafe extern "C" fn init() {
    kernel_lib::log::init().unwrap();

    log::info!("log from fat driver");

    let Ok(fs_id) = fs::register(FileSystem {
        name: "fat".into(),
        kind: FileSystemKind::READ_ONLY,
        max_file_size: None,
    }) else {
        return;
    };
}

#[no_mangle]
unsafe extern "C" fn terminate() {}
