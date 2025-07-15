use core::{marker::PhantomData, mem::MaybeUninit};

use crate::syscall;

use super::{KernelObject, RawHandle};

#[repr(transparent)]
pub struct Queue<T> {
    handle: RawHandle,
    _marker: PhantomData<T>,
}

impl<T> From<RawHandle> for Queue<T> {
    fn from(handle: RawHandle) -> Self {
        Self {
            handle,
            _marker: PhantomData,
        }
    }
}

impl<T> KernelObject for Queue<T> {}

impl<T> Queue<T> {
    pub fn blocking_recv(&self) -> Option<T> {
        let mut object = MaybeUninit::<T>::uninit();

        unsafe {
            syscall! {
                syscall::Request::QueueBlockingGet,
                ecx: self.handle.syscall(),
                edx: object.as_mut_ptr(),
            }
            .inspect_err(|cause| {
                log::error!("Failed to access queue data: {cause:?}");
            })
            .ok()?;

            object.assume_init().into()
        }
    }

    pub fn try_clone(&self) -> Result<Self, syscall::SyscallError> {
        Ok(Self {
            handle: self.handle.try_clone()?,
            _marker: self._marker,
        })
    }
}
