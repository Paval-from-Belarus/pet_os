use kernel_types::{string::MutString, syscall};

pub fn init() -> Result<(), log::SetLoggerError> {
    log::set_logger(&LOGGER_INSTANCE)?;
    log::set_max_level(log::LevelFilter::Info);

    Ok(())
}

pub struct BufferedLogger {
    buf: heapless::String<255>,
}

static LOGGER_INSTANCE: BufferedLogger = BufferedLogger::new();

macro_rules! log {
	( $($arg:tt)* ) => ({
		use core::fmt::Write;

                let mut logger = $crate::logging::BufferedLogger::new();
	        let _ = write!(logger, $($arg)*);
                logger.commit();
	})
}

impl log::Log for BufferedLogger {
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

impl BufferedLogger {
    pub const fn new() -> Self {
        Self {
            buf: heapless::String::new(),
        }
    }

    pub fn commit(&mut self) {
        let value: MutString = self.buf.as_str().into();
        let _ = unsafe { syscall!(syscall::Request::PrintK, edx: &value) };
    }
}

impl Default for BufferedLogger {
    fn default() -> Self {
        Self::new()
    }
}

impl core::fmt::Write for BufferedLogger {
    fn write_str(&mut self, line: &str) -> core::fmt::Result {
        self.buf.push_str(line).map_err(|_| core::fmt::Error)?;

        Ok(())
    }
}
