use kernel_types::{
    io::{IoOperation, MemBuf},
    object::RawHandle,
    syscall,
};

use crate::io::IoTransaction;

use super::UserBuf;

#[derive(Debug)]
#[repr(C)]
pub struct KernelBuf {
    ptr: *mut u8,
    size: usize,

    handle: RawHandle,
}

#[derive(Debug)]
#[repr(C)]
pub struct KernelBufMut {
    ptr: *mut u8,
    size: usize,
}

impl From<RawHandle> for KernelBuf {
    fn from(value: RawHandle) -> Self {
        Self {
            size: 0,
            ptr: core::ptr::null_mut(),
            handle: value,
        }
    }
}

impl KernelBuf {
    pub fn size(&self) -> usize {
        self.size
    }

    pub fn move_bytes(&mut self, _bytes: usize) -> Result<(), ()> {
        Ok(())
    }

    pub fn len(&self) -> usize {
        todo!()
    }

    pub fn copy_to(
        &self,
        buf: &mut UserBuf,
    ) -> Result<(), syscall::SyscallError> {
        let buf_slice = buf.as_slice_mut();

        let mem_buf = MemBuf {
            len: buf_slice.len(),
            ptr: buf_slice.as_mut_ptr(),
        };

        unsafe {
            syscall! {
                syscall::Request::KernelCopy,
                ecx: &mem_buf,
                edx: self.handle.syscall(),
            }?;
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
