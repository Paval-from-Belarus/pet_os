use core::marker::PhantomData;

pub use spin_box::SpinBox;

pub mod atomics;
pub mod io;
pub mod logging;
mod spin_box;
pub mod time;

#[macro_export]
macro_rules! unwrap_err_unchecked {
    ($expr: expr) => {
        unsafe { $expr.unwrap_err_unchecked() }
    };
}

//wrapper type for data ready to be passed
//to the kernel
pub struct SystemCall<'a> {
    _marker: PhantomData<&'a u8>,
}

impl<'a> SystemCall<'a> {
    pub fn call(self) {}
}
