use crate::syscall;

pub trait KernelObject: From<RawHandle> {}

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

#[derive(Debug, PartialEq, Eq, PartialOrd, Ord, Hash)]
#[repr(C)]
pub struct RawHandle(usize);

impl RawHandle {
    pub const fn null() -> Self {
        Self(0)
    }

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

        if handle == 0 {
            return;
        }

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
