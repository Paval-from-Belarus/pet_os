pub mod channel;
pub mod kernel_buf;
pub mod queue;
pub mod syscall;

#[allow(unused)]
pub fn exec<PATH: AsRef<str>>(_path: PATH) -> Result<(), ()> {
    Ok(())
}

pub fn exit(_code: i32) -> ! {
    todo!()
}
