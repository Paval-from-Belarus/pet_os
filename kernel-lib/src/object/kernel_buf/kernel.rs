use core::mem::MaybeUninit;

use kernel_types::{io::MemBuf, object::RawHandle, syscall};

use super::UserBuf;

#[derive(Debug)]
#[repr(C)]
pub struct KernelBuf {
    pub len: usize,
    pub capacity: usize,
    pub handle: RawHandle,
}

#[derive(Debug)]
#[repr(C)]
pub struct KernelBufMut {
    pub len: usize,
    pub capacity: usize,
    pub handle: RawHandle,
}

impl From<RawHandle> for KernelBuf {
    fn from(value: RawHandle) -> Self {
        let mut buf_info = MaybeUninit::<MemBuf>::uninit();

        unsafe {
            syscall!(
                syscall::Request::GetObjectInfo,
                ecx: buf_info.as_mut_ptr(),
                edx: value.syscall(),
            )
            .unwrap();
        }

        let buf_info = unsafe { buf_info.assume_init() };

        Self {
            len: buf_info.len,
            capacity: buf_info.capacity,
            handle: value,
        }
    }
}

impl KernelBuf {
    pub fn len(&self) -> usize {
        self.len
    }

    pub fn capacity(&self) -> usize {
        self.capacity
    }

    #[must_use]
    pub fn is_empty(&self) -> bool {
        self.len() == 0
    }

    pub fn copy_to(
        &self,
        buf: &mut UserBuf,
    ) -> Result<(), syscall::SyscallError> {
        let mem_buf = MemBuf {
            len: 0,
            capacity: buf.capacity(),
            ptr: buf.as_mut_ptr(),
        };

        unsafe {
            syscall! {
                syscall::Request::KernelCopy,
                ecx: &mem_buf,
                edx: self.handle.syscall(),
            }?;

            buf.set_len(buf.capacity());
        }

        Ok(())
    }
}

impl From<RawHandle> for KernelBufMut {
    fn from(value: RawHandle) -> Self {
        let buf = KernelBuf::from(value);

        Self {
            len: buf.len,
            capacity: buf.capacity,
            handle: buf.handle,
        }
    }
}

impl KernelBufMut {
    pub fn remaining_capacity(&self) -> usize {
        self.capacity
    }

    pub fn handle(&self) -> &RawHandle {
        &self.handle
    }

    pub fn write(&mut self, bytes: &[u8]) -> Result<(), syscall::SyscallError> {
        assert!(bytes.len() <= self.remaining_capacity());

        let buf = MemBuf {
            len: bytes.len(),
            capacity: bytes.len(),
            ptr: bytes.as_ptr() as *mut u8,
        };

        unsafe {
            syscall! {
                syscall::Request::UserCopy,
                ecx: &buf,
                edx: self.handle.syscall()
            }?;
        }

        self.len -= bytes.len();

        Ok(())
    }
}
