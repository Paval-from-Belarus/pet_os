#[repr(C)]
pub struct MemBuf {
    pub ptr: *mut u8,
    pub len: usize,
}
