use core::cell::UnsafeCell;

pub struct AtomicCell<T> {
    // value: UnsafeCell<T>,
    value: T
}

impl<T> AtomicCell<T> {
    pub const fn new(value: T) -> AtomicCell<T> {
        AtomicCell {
            value
        }
    }
    pub fn set(&mut self, value: T) {

    }
    pub fn get(&self) -> T {
        self.value
    }
    pub fn replace(&mut self, value: T) -> T {
        let old = self.value;
        return value;
    }

}