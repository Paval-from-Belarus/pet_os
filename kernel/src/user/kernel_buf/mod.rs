use alloc::vec::Vec;
use kernel_types::syscall::SyscallError;

use crate::{impl_container, memory::AllocError, task::Mutex};

use crate::object::{alloc_root_object, Handle, Object, ObjectContainer};

#[derive(Debug)]
pub struct KernelBuf {
    object: Object,
    capacity: usize,
    buf: Mutex<Vec<u8>>,
}

#[derive(Debug, thiserror_no_std::Error)]
pub enum CopyError {
    #[error("Buffer has no more space")]
    NoSpaceAvailable,
    #[error("Kernel alloc failed")]
    Alloc(#[from] AllocError),
}

impl KernelBuf {
    pub fn new(size: usize) -> Result<Handle<KernelBuf>, AllocError> {
        let buf = Vec::try_with_capacity(size)?;

        let handle = alloc_root_object(Self {
            capacity: size,
            buf: Mutex::new(buf)?,
            object: Self::new_root_object(),
        })?;

        Ok(handle)
    }

    pub fn is_empty(&self) -> bool {
        self.buf.lock().is_empty()
    }

    pub fn len(&self) -> usize {
        self.buf.lock().len()
    }

    pub fn remaining_capacity(&self) -> usize {
        let buf = self.buf.lock();

        buf.capacity() - buf.len()
    }

    pub fn capacity(&self) -> usize {
        self.capacity
    }

    pub fn as_slice<'a>(
        &'a self,
    ) -> impl core::ops::Deref<Target = Vec<u8>> + 'a {
        self.buf.lock()
    }

    pub fn as_slice_mut<'a>(
        &'a self,
    ) -> impl core::ops::DerefMut<Target = Vec<u8>> + 'a {
        self.buf.lock()
    }

    pub fn fill_with(&self, v: u8) {
        let remaining = self.remaining_capacity();

        let mut buf = self.buf.lock();

        for _ in 0..remaining {
            buf.push(v);
        }
    }

    pub fn copy_to(&self, bytes: &mut [u8]) -> Result<(), CopyError> {
        if bytes.len() != self.len() {
            return Err(CopyError::NoSpaceAvailable);
        }

        bytes.copy_from_slice(self.buf.lock().as_slice());

        Ok(())
    }

    pub fn copy_from(&self, bytes: &[u8]) -> Result<(), CopyError> {
        if bytes.is_empty() {
            return Ok(());
        }

        let mut buf = self.buf.lock();

        if buf.capacity() - buf.len() >= bytes.len() {
            buf.extend_from_slice(bytes);
            Ok(())
        } else {
            Err(CopyError::NoSpaceAvailable)
        }
    }

    pub fn reset(&self) {
        self.buf.lock().clear();
    }
}

impl<'a> TryFrom<&'a str> for Handle<KernelBuf> {
    type Error = CopyError;

    fn try_from(value: &'a str) -> Result<Self, Self::Error> {
        let buf = KernelBuf::new(value.len())?;

        buf.copy_from(value.as_bytes()).unwrap();

        Ok(buf)
    }
}

impl From<CopyError> for SyscallError {
    fn from(value: CopyError) -> Self {
        match value {
            CopyError::NoSpaceAvailable => SyscallError::NoSpaceInBuffer,
            CopyError::Alloc(cause) => {
                log::warn!("{cause}");
                SyscallError::NoMemory
            }
        }
    }
}

impl_container! {
    KernelBuf,
    obj_kind: KernelBuf,
    slab: "kernel_buf"
}
