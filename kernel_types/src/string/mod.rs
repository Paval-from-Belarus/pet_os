use core::hash::{Hash, Hasher};
use core::marker::PhantomData;

use core::str::from_utf8_unchecked;
use core::{ptr, slice};

use crate::collections::{FastHasher, HashCode, HashKey, PolynomialHasher};

//alternative to linux qstr
#[derive(PartialEq, Eq, Clone)]
#[repr(C)]
pub struct QuickString<'a> {
    hash_code: HashCode,
    data: &'a str,
}

impl<'a> QuickString<'a> {
    ///Save instance of string and manually set HashCode
    pub fn new(data: &'a str, hash_code: HashCode) -> Self {
        // let data = NonNull::from(data);
        Self { data, hash_code }
    }

    ///recalculate the HashCode via data
    pub fn rehash<T: FastHasher>(&mut self, state: &mut T) {
        self.data.hash(state);
        self.hash_code = state.fast_hash();
    }

    pub fn as_str(&self) -> &str {
        self.data
        // unsafe { self.data.as_ref() }
    }

    pub fn len(&self) -> usize {
        self.as_str().len()
    }

    pub fn is_empty(&self) -> bool {
        self.data.is_empty()
    }
}

pub struct QuickStringKey;

impl<'a> HashKey for QuickString<'a> {
    // type Item = QuickStringKey;

    fn hash_code(&self) -> HashCode {
        self.hash_code
    }
}

impl<'a> From<&'a str> for QuickString<'a> {
    fn from(value: &'a str) -> Self {
        const DEFAULT_BASE: usize = 32;
        let mut hasher = PolynomialHasher::<DEFAULT_BASE>::new();
        hasher.write_str(value);
        Self::new(value, hasher.fast_hash())
    }
}

impl AsRef<str> for QuickString<'_> {
    fn as_ref(&self) -> &str {
        self.data
    }
}

#[derive(Debug)]
#[repr(C)]
pub struct MutString<'a> {
    len: usize,
    capacity: usize,
    data: *mut u8,
    _marker: PhantomData<&'a mut u8>,
}

impl<'a> MutString<'a> {
    pub unsafe fn with_capacity(capacity: usize, data: *mut u8) -> Self {
        let len = 0;
        Self {
            capacity,
            len,
            data,
            _marker: PhantomData,
        }
    }
    //create the
    pub unsafe fn new(len: usize, capacity: usize, data: *mut u8) -> Self {
        Self {
            len,
            capacity,
            data,
            _marker: PhantomData,
        }
    }
    pub unsafe fn copy_to(&self, dest: *mut u8, capacity: usize) -> Self {
        assert!(
            !dest.is_null(),
            "failed to copy {:?} to ptr::null with {capacity}",
            self
        );
        let copy_len = usize::min(self.len(), capacity);
        ptr::copy_nonoverlapping(self.data, dest, copy_len);
        Self::new(copy_len, capacity, dest)
    }
    pub fn unwrap(self) -> *mut u8 {
        self.data
    }
    pub fn as_bytes(&self) -> &[u8] {
        unsafe { slice::from_raw_parts(self.data, self.len()) }
    }
    ///return the length of PString in bytes (no codepoints are used)
    pub fn len(&self) -> usize {
        self.len
    }

    pub fn is_empty(&self) -> bool {
        self.len == 0
    }

    ///return the common capacity of PString in bytes
    pub fn capacity(&self) -> usize {
        self.capacity
    }
    ///change the current length of PString
    ///If length exceeds the capacity, method will panic
    pub unsafe fn set_length(&mut self, length: usize) {
        assert!(
            length <= self.len(),
            "New length of PString cannot exceed previous"
        );
        self.len = length;
    }

    pub fn as_str(&self) -> &str {
        unsafe { from_utf8_unchecked(self.as_bytes()) }
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
            1 => self.push_byte_unchecked(letter as u8),
            _ => letter
                .encode_utf8(&mut [0; 4])
                .as_bytes()
                .iter()
                .for_each(|byte| self.push_byte_unchecked(*byte)),
        }
    }

    pub unsafe fn push_byte_unchecked(&mut self, byte: u8) {
        assert!(self.len < self.capacity);
        let next_byte = self.data.add(self.len());
        next_byte.write(byte);
        self.len += 1;
    }
}

impl<'a> AsRef<str> for MutString<'a> {
    fn as_ref(&self) -> &str {
        self.as_str()
    }
}

impl<'a> From<&'a str> for MutString<'a> {
    fn from(value: &str) -> Self {
        let ptr = value.as_ptr() as *mut u8;

        unsafe { Self::new(value.len(), value.len(), ptr) }
    }
}

impl<'a> From<&'a mut str> for MutString<'a> {
    fn from(value: &mut str) -> Self {
        let ptr = value.as_ptr() as *mut u8;

        unsafe { Self::new(value.len(), value.len(), ptr) }
    }
}

impl<'a> From<&'a [u8]> for MutString<'a> {
    fn from(value: &[u8]) -> Self {
        let ptr = value.as_ptr() as *mut u8;
        unsafe { Self::new(value.len(), value.len(), ptr) }
    }
}

impl<'a> From<&'a mut [u8]> for MutString<'a> {
    fn from(value: &mut [u8]) -> Self {
        let ptr = value.as_ptr() as *mut u8;
        unsafe { Self::new(value.len(), value.len(), ptr) }
    }
}

impl<'a> core::fmt::Display for MutString<'a> {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        write!(f, "{}", self.as_str())
    }
}

impl PartialEq for MutString<'_> {
    fn eq(&self, other: &Self) -> bool {
        self.as_bytes().eq(other.as_bytes())
    }
}

#[cfg(test)]
mod tests {
    extern crate alloc;
    extern crate std;

    use alloc::borrow::ToOwned;
    use alloc::vec::Vec;

    use fallible_collections::FallibleVec;

    use crate::string::{MutString, QuickString};

    #[test]
    fn lifetime_test() {
        fn get_q_string<'a>() -> QuickString<'a> {
            let quick_str = {
                let string = "value".to_owned();
                QuickString::new(string.leak(), 42)
            };
            quick_str
        }
        assert_eq!(get_q_string().as_str(), "value");
    }

    fn new_string(value: &str) -> MutString {
        let string = value.to_owned();
        let bytes = unsafe { string.leak().as_bytes_mut() };
        MutString::from(bytes)
    }

    #[test]
    pub fn replacing_test() {
        let mut mutable = [0u8; 5];
        let mut immutable = [0u8; 5];
        for (index, byte) in "aboba".as_bytes().iter().enumerate() {
            mutable[index] = *byte;
        }
        for (index, byte) in "aabba".as_bytes().iter().enumerate() {
            immutable[index] = *byte;
        }
        let mut value = MutString::from(mutable.as_mut_slice());
        unsafe { value.set_length(0) };
        let template = MutString::from(immutable.as_mut_slice());
        template
            .as_bytes()
            .iter()
            .for_each(|byte| unsafe { value.push_byte_unchecked(*byte) });
        assert_eq!(value, template);
    }

    #[test]
    pub fn splitting_test() {
        let p_string = new_string("/the/long/sentence");
        let mut parts: Vec<&str> = Vec::try_with_capacity(1).unwrap();
        for entry in p_string.as_str().split('/') {
            parts.try_push(entry).unwrap();
        }
        assert_eq!(parts, ["", "the", "long", "sentence"]);
    }
}
