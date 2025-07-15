use alloc::vec::Vec;
use kernel_types::{io::MemBuf, object::RawHandle, syscall};

use super::KernelBuf;

#[derive(Debug)]
pub struct UserBuf {
    buf: alloc::vec::Vec<u8>,
}

#[derive(Debug)]
#[repr(C)]
pub struct UserBufMut {
    k_buf_capacity: usize,
    pushed_count: usize,
    buf: alloc::vec::Vec<u8>,
    handle: RawHandle,
}

impl UserBufMut {
    /// the capacity available to be filled
    pub fn remaining_capacity(&self) -> usize {
        self.k_buf_capacity - self.pushed_count
    }

    pub fn has_remaining_capacity(&self) -> bool {
        self.remaining_capacity() > 0
    }

    pub fn push(&mut self, v: u8) {
        self.pushed_count += 1;
        self.buf.push(v);

        log::debug!("Pushed");
    }

    pub fn flush(&mut self) -> syscall::Result<()> {
        assert!(self.pushed_count <= self.k_buf_capacity);

        if self.buf.is_empty() {
            return Ok(());
        }

        log::debug!("Flushed");

        let mem_buf = MemBuf {
            ptr: self.buf.as_ptr() as *mut u8,
            len: self.buf.len(),
            capacity: 0,
        };

        unsafe {
            syscall! {
                syscall::Request::UserCopy,
                ecx: &mem_buf,
                edx: self.handle.syscall()
            }?;
        }

        self.buf.clear();

        Ok(())
    }
}

impl From<RawHandle> for UserBufMut {
    fn from(value: RawHandle) -> Self {
        let kernel_buf = KernelBuf::from(value);

        Self {
            pushed_count: 0,
            k_buf_capacity: kernel_buf.capacity,
            buf: Vec::with_capacity(kernel_buf.capacity),
            handle: kernel_buf.handle,
        }
    }
}

impl UserBuf {
    pub fn new(size: usize) -> UserBuf {
        Self {
            buf: Vec::with_capacity(size),
        }
    }

    pub fn as_mut_ptr(&mut self) -> *mut u8 {
        self.buf.as_mut_ptr()
    }

    /// Sets the length of this [`UserBuf`].
    ///
    /// # Safety
    ///
    /// .
    pub unsafe fn set_len(&mut self, len: usize) {
        self.buf.set_len(len);
    }

    pub fn as_slice(&self) -> &[u8] {
        &self.buf
    }

    pub fn capacity(&self) -> usize {
        self.buf.capacity()
    }

    pub fn as_slice_mut(&mut self) -> &mut [u8] {
        &mut self.buf
    }
}
