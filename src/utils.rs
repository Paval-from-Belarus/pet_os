#[macro_export]
macro_rules! bitflags {
    ($vis:vis $s:ident($t:ty), $($name:ident = $value:expr),*) => {
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
            pub fn contains(&self, bit: $t) -> bool {
             self.0 & bit == bit
         }
        }
    };
}
#[macro_export]
macro_rules! unwrap_err_unchecked {
    ($expr: expr) => {
        unsafe {
            $expr.unwrap_err_unchecked()
        }
    };
}