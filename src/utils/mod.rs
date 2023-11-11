mod vga;
pub mod logging;
pub mod io;
mod doubly_linked_list;
mod singly_linked_list;

use core::cmp;
pub use doubly_linked_list::{LinkedList, ListNode};
pub use singly_linked_list::{SimpleList, SimpleListNode};
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
        impl $s {
         $(
            $vis const $name: $t = $value;
        )*
            const BITS_COUNT: usize = core::mem::size_of::<$t>() * 8;
            pub const fn wrap(value: $t) -> Self {
                Self(value)
         }
           pub const fn value(&self) -> $t {
             self.0
         }
            pub const fn contains_with_mask(&self, mask: $t, flag: $t) -> bool {
             self.0 & mask == flag
         }
            pub const fn contains(&self, bit: $t) -> bool {
             self.0 & bit == bit
         }
        }
    };
}
#[macro_export]
macro_rules! declare_constants {
    ($vis: vis $t:ty, $($name:ident = $value:expr $(, $comment:expr)?);* $(;)?) => {
        $(
            $(#[doc = $comment])?
            $vis const $name: $t = $value;
        )*
    };
}

pub struct ZeroedMemory<T> {
    value: T,
}

#[derive(Clone, Copy)]
pub struct MinMax<T: Sized + Ord> {
    min: T,
    max: T,
}

impl<T> ZeroedMemory<T> {
    pub const fn init() -> Self {
        unsafe { core::mem::MaybeUninit::<ZeroedMemory<T>>::zeroed().assume_init() }
    }
}

pub fn min_max<T: Sized + Ord>(first: T, second: T) -> MinMax<T> {
    if first.le(&second) {
        MinMax { min: first, max: second }
    } else {
        MinMax { min: second, max: first }
    }
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
