use kernel_types::{object::RawHandle, syscall};

pub struct Event {
    handle: RawHandle,
}

impl Event {
    pub fn new() -> syscall::Result<Self> {
        let mut handle: usize = 0;

        unsafe {
            syscall! {
                syscall::Request::EventNew,
                edx: &mut handle,
            }?;

            log::debug!("event handle: 0x{handle:X?}");

            Ok(RawHandle::new_unchecked(handle).into())
        }
    }

    pub fn wait(&self) -> syscall::Result<()> {
        unsafe {
            syscall! {
                syscall::Request::EventBlock,
                edx: self.handle.syscall()
            }
        }
    }

    pub fn notify_one(&self) -> syscall::Result<()> {
        unsafe {
            syscall! {
                syscall::Request::EventNotifyOne,
                edx: self.handle.syscall()
            }
        }
    }

    pub fn notify_all(&self) -> syscall::Result<()> {
        unsafe {
            syscall! {
                syscall::Request::EventNotifyAll,
                edx: self.handle.syscall()
            }
        }
    }

    pub fn try_clone(&self) -> syscall::Result<Self> {
        Ok(Self {
            handle: self.handle.try_clone()?,
        })
    }
}

impl From<RawHandle> for Event {
    fn from(value: RawHandle) -> Self {
        Self { handle: value }
    }
}
