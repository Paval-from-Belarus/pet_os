use kernel_types::{string::MutString, syscall};

pub fn init() -> Result<(), log::SetLoggerError> {
    log::set_logger(&LOGGER_INSTANCE)?;
    log::set_max_level(log::LevelFilter::Info);

    Ok(())
}

pub struct Logger;

static LOGGER_INSTANCE: Logger = Logger;

macro_rules! log {
	( $($arg:tt)* ) => ({
		use core::fmt::Write;

                let mut logger = $crate::log::Logger;
	        let _ = write!(logger, $($arg)*);
	})
}

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

impl core::fmt::Write for Logger {
    fn write_str(&mut self, line: &str) -> core::fmt::Result {
        let value: MutString = line.into();
        unsafe {
            syscall!(syscall::PRINTK, edx: &value);
        }

        Ok(())
    }
}
