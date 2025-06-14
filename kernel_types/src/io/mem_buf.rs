#[repr(C)]
pub struct MemBuf {
    pub ptr: *mut u8,
    //current buffer len
    pub len: usize,
    //total capacity
    pub capacity: usize,
}
