use alloc::vec::Vec;

#[derive(Debug)]
pub struct UserBuf {
    buf: alloc::vec::Vec<u8>,
}

#[derive(Debug)]
#[repr(C)]
pub struct UserBufMut {
    ptr: *mut u8,
    size: usize,
}

impl UserBufMut {
    /// the capacity available to be filled
    pub fn remaining_capacity(&self) -> usize {
        self.size
    }

    pub fn has_remaining_capacity(&self) -> bool {
        self.remaining_capacity() != 0
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
