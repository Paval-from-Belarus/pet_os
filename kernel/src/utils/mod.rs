pub use spin_box::SpinBox;

pub mod logging;
pub mod io;
pub mod atomics;
mod spin_box;
pub mod time;

#[macro_export]
macro_rules! declare_constants {
    ($vis: vis $t:ty, $($name:ident = $value:expr $(, $comment:expr)?);* $(;)?) => {
        $(
            $(#[doc = $comment])?
            $vis const $name: $t = $value;
        )*
    };
}
#[macro_export]
macro_rules! bitflags {
    ($vis:vis $s:ident($t:ty), $($name:ident = $value:expr),* $(,)?) => {
        #[derive(Clone, Copy)]
        #[repr(transparent)]
        $vis struct $s($t);

        impl From<$t> for $s {
            fn from(item: $t) -> Self {
                $s(item)
            }
        }
        impl From<$s> for $t {
            fn from(item: $s) -> Self {
                item.0
            }
        }
        impl $s {
         $(
            $vis const $name: $t = $value;
        )*
            const BITS_COUNT: usize = core::mem::size_of::<$t>() * 8;
            pub const fn wrap(value: $t) -> Self {
                Self(value)
         }
           pub const fn bits(&self) -> $t {
             self.0
         }
            pub const fn contains_with_mask(&self, mask: $t, flag: $t) -> bool {
             self.0 & mask == flag
         }
            pub const fn test_with(&self, bit: $t) -> bool {
             self.0 & bit == bit
         }
        }
    };
}


pub fn unreachable() -> ! {
    unsafe { core::intrinsics::unreachable() }
}
#[macro_export]
macro_rules! unwrap_err_unchecked {
    ($expr: expr) => {
        unsafe { $expr.unwrap_err_unchecked() }
    };
}
