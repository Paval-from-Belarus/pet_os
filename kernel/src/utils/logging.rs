use core::fmt;
use core::fmt::Write;
use kernel_types::declare_constants;

use crate::utils::atomics::SpinLock;
use crate::utils::io;

#[macro_export]
macro_rules! log {
	( $($arg:tt)* ) => ({
		use core::fmt::Write;
		let _ = write!(&mut $crate::utils::logging::Logger::get(module_path!()), $($arg)*);
	})
}

declare_constants!(
    pub u16,
    BOCHS_HACK_PORT = 0xe9, "Reserved on real hardware, but used in bochs";
    COM_1 = 0x3f8
);

pub unsafe fn put_in_serial(line: &str) {
    for byte in line.bytes() {
        put_byte_in_serial(byte);
    }
}

pub unsafe fn put_byte_in_serial(byte: u8) {
    loop {
        if io::inb(COM_1 + 5) & 0x20 != 0 {
            break;
        }
    }
    io::outb(COM_1, byte);
    io::outb(BOCHS_HACK_PORT, byte);
}

static LOGGER_LOCK: SpinLock = SpinLock::new();

#[repr(transparent)]
pub struct Logger;

pub fn init() {
    const TEST_BYTE: u8 = 0x42;
    unsafe {
        io::outb(COM_1 + 1, 0x00);
        io::outb(COM_1 + 3, 0x80);
        io::outb(COM_1, 0x03);
        io::outb(COM_1 + 1, 0x00);
        io::outb(COM_1 + 3, 0x03);
        io::outb(COM_1 + 2, 0xC7);
        io::outb(COM_1 + 4, 0x0B);
        io::outb(COM_1 + 4, 0x1E);
        //testing
        io::outb(COM_1, TEST_BYTE);
        if io::inb(COM_1) != TEST_BYTE {
            //logging is not working, because port is broken
        }
        io::outb(COM_1 + 4, 0x0F);
    }
}

impl Logger {
    pub fn get(module: &str) -> Logger {
        let mut instance = Logger;
        LOGGER_LOCK.acquire();
        let _ = write!(instance, "[{}] ", module); //the result is ignored by anyone because write is always true
        instance
    }
}

impl Drop for Logger {
    fn drop(&mut self) {
        let _ = write!(self, "\n");
        LOGGER_LOCK.release();
    }
}

impl Write for Logger {
    fn write_str(&mut self, line: &str) -> fmt::Result {
        unsafe { put_in_serial(line) };
        Ok(())
    }
}
