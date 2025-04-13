use core::marker::PhantomData;

use crate::declare_constants;

declare_constants! {
    pub u32,
    RESERVED = 0xFFFF_FFFF, "No function to zero can be used; this function used to test system initialization";
    PRINTK = 0x1;
    SET_IRQ = 0x2;
}

//wrapper type for data ready to be passed
//to the kernel
pub struct SystemCall<'a> {
    _marker: PhantomData<&'a u8>,
}

impl<'a> SystemCall<'a> {
    pub fn call(self) {}
}

#[macro_export]
macro_rules! syscall {
    ($id:expr $(, ecx: $ecx:expr)? $(, edx: $edx:expr)?) => ({
        core::arch::asm!(
          "int 80h",
           in("eax") $id
           $(,in("ecx") $ecx)?
           $(,in("edx") $edx)?
        );
    });
}

