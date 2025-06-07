use core::marker::PhantomData;

use crate::syscall;

pub trait KernelObject: From<RawHandle> {}

#[derive(Debug)]
#[repr(C)]
pub struct Handle<T: KernelObject>(RawHandle, PhantomData<T>);

impl RawHandle {
    /// .
    ///
    /// # Safety
    ///
    /// .
    pub unsafe fn new_unchecked(handle: usize) -> Self {
        Self(handle)
    }

    /// .
    ///
    /// # Safety
    ///
    /// .
    pub unsafe fn cast<T: KernelObject>(self) -> T {
        self.into()
    }
}

#[derive(Debug)]
#[repr(C)]
pub struct RawHandle(usize);

impl RawHandle {
    /// Returns the syscall of this [`RawHandle`].
    ///
    /// # Safety
    ///
    /// .
    //value for syscall
    pub unsafe fn syscall(&self) -> usize {
        self.0
    }
}

impl Drop for RawHandle {
    fn drop(&mut self) {
        let handle = self.0;

        unsafe {
            let _ = syscall!(
                syscall::Request::FreeKernelObject,
                edx: handle
            )
            .inspect_err(|cause| {
                log::error!("Failed to release kernel object: {cause:?}");
            });
        }
    }
}
