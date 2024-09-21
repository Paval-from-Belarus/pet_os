use crate::memory::PagingProperties;

#[repr(C)]
pub struct BootModules {}

#[repr(C)]
pub struct KernelProperties {
    pub modules: BootModules,
    pub pages: PagingProperties,
}
