#![no_std]
#![feature(fn_ptr_trait)]
#![feature(tuple_trait)]
#![feature(let_chains)]
#![feature(offset_of)]
#![feature(unboxed_closures)]
#![feature(maybe_uninit_uninit_array)]
#![feature(hasher_prefixfree_extras)]


pub mod drivers;
pub mod collections;
pub mod string;


#[derive(Default, Clone, Copy)]
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
            MinMax { min: first, max: second }
        } else {
            MinMax { min: second, max: first }
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
