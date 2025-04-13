#![no_std]
#![no_main]

#[cfg(not(test))]
#[panic_handler]
pub fn panic(_info: &core::panic::PanicInfo) -> ! {
    unsafe { core::arch::asm!("hlt", options(noreturn)) }
}

#[no_mangle]
unsafe extern "C" fn init() {
    kernel_lib::log::init().unwrap();

    log::info!("Log from ata driver");
}

#[no_mangle]
unsafe extern "C" fn terminate() {
    log::info!("Ata driver is terminated");
}
