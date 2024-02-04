pub use spin_box::SpinBox;

pub mod logging;
pub mod io;
pub mod atomics;
mod spin_box;
pub mod time;



pub fn unreachable() -> ! {
    unsafe { core::intrinsics::unreachable() }
}
#[macro_export]
macro_rules! unwrap_err_unchecked {
    ($expr: expr) => {
        unsafe { $expr.unwrap_err_unchecked() }
    };
}
