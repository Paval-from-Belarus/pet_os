use kernel_macro::export_symbolic;

use crate::declare_constants;
use crate::memory::VirtualAddress;

mod vga;
mod keyboard;
///this macro is used to
#[macro_export]
macro_rules! export_symbol {
    ($name: ident) => {
        #[no_mangle]
        #[link_section = ".symbol_table"]
        paste::paste!{
            static [<SYMTAB_ $name>]: &str = stringify!($name);
        }
    };
}
// export_symbol!(register_display_driver);
#[export_symbolic]
pub fn register_display_driver() {}

#[repr(C)]
pub struct KernelSymbol {
    #[doc = "Offset of function to be exported"]
    offset: VirtualAddress,
    #[doc = "Offset of string to be checked"]
    value: &'static str,
}

impl PartialEq for KernelSymbol {
    fn eq(&self, other: &Self) -> bool {
        self.value.eq(other.value)
    }
}

impl KernelSymbol {
    pub fn offset_raw(&self) -> VirtualAddress {
        self.offset
    }
}

#[repr(transparent)]
#[derive(Clone, Copy, PartialEq)]
pub struct Handle(VirtualAddress);

impl Handle {
    declare_constants!(
        pub Handle,
        KERNEL = Handle(0);
    );
}