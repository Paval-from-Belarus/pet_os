use core::mem::MaybeUninit;

use kernel_types::{io::MemBuf, object::RawHandle, syscall};

use super::UserBuf;

#[derive(Debug)]
#[repr(C)]
pub struct KernelBuf {
    size: usize,
    handle: RawHandle,
}

#[derive(Debug)]
#[repr(C)]
pub struct KernelBufMut {
    size: usize,
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
            size: buf_info.len,
            handle: value,
        }
    }
}

impl KernelBuf {
    pub fn len(&self) -> usize {
        self.size
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
            len: buf.capacity(),
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

    pub fn handle_cloned(&self) -> Result<RawHandle, syscall::SyscallError> {
        unsafe {
            syscall! {
                syscall::Request::CloneHandle,
                edx:
                    self.handle.syscall()
            }?;
        }

        Ok(unsafe { RawHandle::new_unchecked(self.handle.syscall()) })
    }
}

impl KernelBufMut {
    pub fn remaining_capacity(&self) -> usize {
        self.size
    }
}
