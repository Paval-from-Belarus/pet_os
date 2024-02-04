use core::marker::Tuple;
use core::mem;
use core::ptr::NonNull;

///Currently, KernelSymbol holds size_of(usize) * 3 bytes
///Consider to remove
#[repr(C)]
pub struct KernelSymbol {
    #[doc = "Offset of function to be exported"]
    offset: NonNull<()>,
    #[doc = "Offset of string to be checked"]
    value: &'static [u8],
}

unsafe impl Send for KernelSymbol {}

unsafe impl Sync for KernelSymbol {}

impl PartialEq for KernelSymbol {
    fn eq(&self, other: &Self) -> bool {
        self.value.eq(other.value)
    }
}

impl KernelSymbol {
    pub const fn new<Args: Tuple, T: Fn<Args>>(function: &'static T, value: &'static [u8]) -> Self {
        let offset: NonNull<()> = unsafe { mem::transmute(function) };
        Self {
            offset,
            value,
        }
    }
    pub fn has_same_name(&self, name: &str) -> bool {
        let value = unsafe { core::str::from_utf8_unchecked(self.value) };
        value.eq(name)
    }
    pub fn offset(&self) -> usize {
        self.offset.as_ptr() as usize
    }
}

/// the representation of any device in system
#[derive(Copy, Clone, PartialEq, PartialOrd)]
#[repr(transparent)]
pub struct Device(usize);

impl Device {
    pub const fn new(number: usize) -> Self {
        Self(number)
    }
}
