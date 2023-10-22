use core::sync::atomic::AtomicBool;
#[macro_export]
macro_rules! bitflags {
    ($vis:vis $s:ident($t:ty), $($name:ident = $value:expr),* $(,)?) => {
        #[derive(Clone, Copy)]
        $vis struct $s($t);

        impl From<$t> for $s {
            fn from(item: $t) -> Self {
                $s(item)
            }
        }

        impl Into<$t> for $s {
            fn into(self) -> $t {
                self.0
            }
        }
        impl $s {
         $(
            $vis const $name: $t = $value;
        )*
            pub const fn wrap(value: $t) -> Self {
                Self(value)
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

impl<T> ZeroedMemory<T> {
    pub const fn init() -> Self {
        unsafe { core::mem::MaybeUninit::<ZeroedMemory<T>>::zeroed().assume_init() }
    }
}
#[macro_export]
macro_rules! unwrap_err_unchecked {
    ($expr: expr) => {
        unsafe { $expr.unwrap_err_unchecked() }
    };
}
