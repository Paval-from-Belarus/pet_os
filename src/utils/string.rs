use core::slice;

#[derive(Debug)]
pub struct PString {
    len: usize,
    capacity: usize,
    data: *mut u8,
}

impl PString {
    pub fn with_capacity(capacity: usize, data: *mut u8) -> Self {
        let len = 0;
        Self {
            capacity,
            len,
            data,
        }
    }
    //create the
    pub fn new(len: usize, data: *mut u8) -> Self {
        let capacity = len;
        Self { len, capacity, data }
    }
    pub fn as_bytes(&self) -> &[u8] {
        unsafe { slice::from_raw_parts(self.data, self.len()) }
    }
    ///return the length of PString in bytes (no codepoints are used)
    pub fn len(&self) -> usize {
        self.len
    }
    ///return the common capacity of PString in bytes
    pub fn capacity(&self) -> usize {
        self.capacity
    }
    ///change the current length of PString
    ///If length exceeds the capacity, method will panic
    pub unsafe fn set_length(&mut self, length: usize) {
        assert!(length <= self.len(), "New length of PString cannot exceed previous");
        self.len = length;
    }
    ///If letter cannot be pushed without increasing the capacity, the method will return Err
    ///Otherwise it will return ok
    ///try to append letter to given capacity
    ///no additional allocation is used
    pub fn push(&mut self, letter: char) -> Result<(), ()> {
        if self.len() + letter.len_utf8() > self.capacity() {
            return Err(());
        }
        unsafe { self.push_unchecked(letter) }
        Ok(())
    }
    pub unsafe fn push_unchecked(&mut self, letter: char) {
        match letter.len_utf8() {
            1 => { self.push_byte_unchecked(letter as u8) }
            _ => {
                letter.encode_utf8(&mut [0; 4]).as_bytes()
                    .iter()
                    .for_each(|byte| self.push_byte_unchecked(*byte))
            }
        }
    }
    pub unsafe fn push_byte_unchecked(&mut self, byte: u8) {
        assert!(self.len < self.capacity);
        let next_byte = self.data.add(self.len());
        next_byte.write(byte);
        self.len += 1;
    }
}

impl From<&mut str> for PString {
    fn from(value: &mut str) -> Self {
        Self::new(value.len(), value.as_mut_ptr())
    }
}

impl From<&mut [u8]> for PString {
    fn from(value: &mut [u8]) -> Self {
        Self::new(value.len(), value.as_mut_ptr())
    }
}

impl PartialEq for PString {
    fn eq(&self, other: &Self) -> bool {
        self.as_bytes().eq(other.as_bytes())
    }
}

#[cfg(test)]
mod tests {
    use crate::utils::PString;

    #[test]
    pub fn test() {
        let mut mutable = [0u8; 5];
        let mut immutable = [0u8; 5];
        for (index, byte) in "aboba".as_bytes().iter().enumerate() {
            mutable[index] = *byte;
        }
        for (index, byte) in "aabba".as_bytes().iter().enumerate() {
            immutable[index] = *byte;
        }
        let mut value = PString::from(mutable.as_mut_slice());
        unsafe { value.set_length(0) };
        let template = PString::from(immutable.as_mut_slice());
        template.as_bytes().iter()
            .for_each(|byte| unsafe { value.push_byte_unchecked(*byte) });
        assert_eq!(value, template);
    }
}