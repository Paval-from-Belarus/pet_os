use core::ptr;
pub struct PString {
    size: u16,
    data: *mut u8,
}

impl PString {
    pub fn empty(capacity: u16) -> Self {
        Self { size: capacity, data: ptr::null_mut() }
    }
}