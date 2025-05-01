#![no_std]
#![feature(fn_ptr_trait)]
#![feature(tuple_trait)]
#![feature(let_chains)]
#![feature(unboxed_closures)]
#![feature(maybe_uninit_uninit_array_transpose)]
#![feature(hasher_prefixfree_extras)]

use thiserror_no_std::Error;

pub mod collections;
pub mod drivers;
pub mod fs;
pub mod string;
pub mod syscall;

extern crate alloc;

#[macro_export]
macro_rules! declare_types {
    ( $vis: vis $t: ty as $method: ident, $($name: ident = $value:expr $(, $comment:expr)?);* $(;)? ) => {
        paste::paste! {
            $(
                $(#[doc = $comment])?
                #[allow(unused_unsafe)]
                $vis const $name: $t = unsafe { $t::$method($value) };
            )*
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
#[derive(Debug, Error)]
#[error("Invalid value {0} for bitflag")]
pub struct BitflagFormatError<T: Sized>(pub T);
#[macro_export]
macro_rules! bitflags {
    ($vis:vis $s:ident($t:ty), $($name:ident = $value:expr),* $(,)?) => {
        #[derive(Clone, Copy, Debug, PartialEq, Eq)]
        #[repr(transparent)]
        $vis struct $s($vis $t);
        impl TryFrom<$t> for $s {
            type Error = $crate::BitflagFormatError<$t>;
            fn try_from(item: $t) -> Result<Self, Self::Error> {
                match item {
                    $(Self:: $name => unsafe { Ok(Self::wrap(Self::$name)) } )*
                    _ => { Err($crate::BitflagFormatError(item)) }
                }
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
            pub const unsafe fn wrap(value: $t) -> Self {
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

            impl core::ops::BitOr for $s {
                type Output = $s;

            fn bitor(self, rhs: Self) -> Self::Output {
               Self(self.0 | rhs.0)
            }
        }

    };
}

#[derive(Debug, Default, Clone, Copy)]
#[repr(transparent)]
pub struct Zeroed<T: Sized> {
    _value: T,
}

#[derive(Clone, Copy)]
pub struct MinMax<T: Sized + Ord> {
    min: T,
    max: T,
}

impl<T: Sized + Ord> MinMax<T> {
    pub fn new(first: T, second: T) -> Self {
        if first.le(&second) {
            MinMax {
                min: first,
                max: second,
            }
        } else {
            MinMax {
                min: second,
                max: first,
            }
        }
    }
    pub fn min(&self) -> &T {
        &self.min
    }
    pub fn max(&self) -> &T {
        &self.max
    }
    ///the first element is minimal. The second is maximal
    pub fn to_tuple(self) -> (T, T) {
        (self.min, self.max)
    }
}

impl<T: Sized + Ord> From<(T, T)> for MinMax<T> {
    fn from(value: (T, T)) -> Self {
        Self::new(value.0, value.1)
    }
}

impl<T: Sized + Ord + Copy> From<[T; 2]> for MinMax<T> {
    fn from(value: [T; 2]) -> Self {
        Self::new(value[0], value[1])
    }
}

#[macro_export]
macro_rules! lambda_const_assert {
    ($($list:ident : $ty:ty),* => $expr:expr) => {{
        struct Assert<$(const $list: usize,)*>;
        impl<$(const $list: $ty,)*> Assert<$($list,)*> {
            const OK: u8 = 0 - !($expr) as u8;
        }
        Assert::<$($list,)*>::OK
    }};
    ($expr:expr) => {
        const OK: u8 = 0 - !($expr) as u8;
    };
}

pub trait ReferableResource {
    fn take(&self);
    fn free(&self);
    fn is_used(&self) -> bool;
    fn is_free(&self) -> bool {
        !self.is_used()
    }
}

#[macro_export]
macro_rules! container_of {
    ($ptr: expr, $ty: ty, $field: ident) => {{
        let field_offset = core::mem::offset_of!($ty, $field);
        let struct_offset = unsafe { ($ptr as *mut u8).sub(field_offset) };
        unsafe { core::mem::transmute::<*mut u8, *mut $ty>(struct_offset) }
    }};
}

#[cfg(test)]
mod tests {
    extern crate alloc;
    extern crate std;
    bitflags! {
        pub MyBestFlag(u8),
        ONE = 0x1,
        TWO = 0x02,
    }
    #[test]
    fn bitflag_test() {
        assert!(MyBestFlag::try_from(0x00).is_err());
        assert!(MyBestFlag::try_from(MyBestFlag::ONE).is_ok());
    }
}
