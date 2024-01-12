use core::marker::Tuple;
use core::mem;
use core::ptr::NonNull;

#[repr(C)]
pub struct KernelSymbol {
    #[doc = "Offset of function to be exported"]
    offset: NonNull<()>,
    #[doc = "Offset of string to be checked"]
    value: &'static str,
}

unsafe impl Send for KernelSymbol {}

unsafe impl Sync for KernelSymbol {}

impl PartialEq for KernelSymbol {
    fn eq(&self, other: &Self) -> bool {
        self.value.eq(other.value)
    }
}

impl KernelSymbol {
    pub const fn new<Args: Tuple, T: Fn<Args>>(function: &'static T, value: &'static str) -> Self {
        let offset: NonNull<()> = unsafe { mem::transmute(function) };
        Self {
            offset,
            value,
        }
    }
    pub fn has_same_name(&self, name: &str) -> bool {
        self.value.eq(name)
    }
    pub fn offset_raw(&self) -> usize {
        self.offset.as_ptr() as usize
    }
}

