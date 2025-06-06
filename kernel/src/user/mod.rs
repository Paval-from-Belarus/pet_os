use crate::memory::ProcessId;

pub mod channel;
mod exchange;
pub mod queue;
pub mod syscall;

#[allow(unused)]
pub fn exec<PATH: AsRef<str>>(_path: PATH) -> Result<(), ()> {
    Ok(())
}

pub fn terminate(_id: ProcessId) -> ! {
    todo!()
}
