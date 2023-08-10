use core::ptr;

pub struct AtomicCell<T>  {
    // value: UnsafeCell<T>,
    value: T,
    lock: bool
}

impl<T: Clone + Copy> AtomicCell<T> {
    pub fn wrap(value: T) -> AtomicCell<T> {
        AtomicCell {
            value,
            lock: false
        }
    }
    pub fn set(&mut self, value: T) {
        self.value = value;
        todo!("Replace with asm code")
    }
    pub fn get(&self) -> T {
        return self.value.clone();
    }
    pub fn replace(&mut self, value: T) -> T {
        let old = self.value;
        self.value = value;
        return old;
    }
}