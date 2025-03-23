use core::fmt;
use core::fmt::Write;
use kernel_types::declare_constants;

use crate::utils::io;

#[macro_export]
macro_rules! log {
	( $($arg:tt)* ) => ({
		use core::fmt::Write;

                if let Some(logger) = &mut $crate::utils::logging::LOGGER_LOCK.try_lock().as_mut() {
		    let _ = write!(logger, $($arg)*);
                }
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

pub static LOGGER_LOCK: spin::Mutex<Logger> = spin::Mutex::new(Logger);
static LOGGER_INSTANCE: Logger = Logger;

#[repr(transparent)]
pub struct Logger;

impl log::Log for Logger {
    fn enabled(&self, _metadata: &log::Metadata) -> bool {
        true
    }

    fn log(&self, record: &log::Record) {
        if !self.enabled(record.metadata()) {
            return;
        }

        log!(
            "[{}][{}] {}\n",
            record.level(),
            record.target(),
            record.args()
        );
    }

    fn flush(&self) {}
}

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

    log::set_logger(&LOGGER_INSTANCE).expect("Failed to set logger");
    log::set_max_level(log::LevelFilter::Debug);
}

impl Write for Logger {
    fn write_str(&mut self, line: &str) -> fmt::Result {
        unsafe { put_in_serial(line) };
        Ok(())
    }
}
