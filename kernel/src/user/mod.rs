pub mod channel;
pub mod queue;
mod exchange;

#[allow(unused)]
pub fn exec<PATH: AsRef<str>>(_path: PATH) -> Result<(), ()> {
    Ok(())
}

