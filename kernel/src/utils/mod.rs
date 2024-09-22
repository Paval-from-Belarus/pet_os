pub use spin_box::SpinBox;

pub mod atomics;
pub mod io;
pub mod logging;
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
