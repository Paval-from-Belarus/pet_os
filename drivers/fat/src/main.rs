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

// extern crate alloc;
extern crate core;

#[cfg(not(test))]
#[panic_handler]
pub fn panic(_info: &core::panic::PanicInfo) -> ! {
    unsafe { core::arch::asm!("hlt", options(noreturn)) }
}

#[no_mangle]
unsafe extern "C" fn _start() {
    core::arch::asm! {
        "mov eax, 0x21",
        "int 80h"
    }
}
