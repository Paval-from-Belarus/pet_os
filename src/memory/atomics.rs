use core::sync::atomic::{AtomicBool, Ordering};

pub struct AtomicCell<T> {
    // value: UnsafeCell<T>,
    value: T,
    lock: bool,
}

impl<T: Clone + Copy> AtomicCell<T> {
    pub fn wrap(value: T) -> AtomicCell<T> {
        AtomicCell { value, lock: false }
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

pub struct SpinLock {
    lock: AtomicBool,
}

impl SpinLock {
    pub const fn new() -> Self {
        SpinLock { lock: AtomicBool::new(false) }
    }
    pub fn acquire(&mut self) {
        loop {
            let is_acquired = self.lock.compare_exchange(
                false,
                true,
                Ordering::Acquire,
                Ordering::Relaxed);
            if is_acquired.is_ok() {
                break;
            }
        }
    }
    pub fn release(&mut self) {
        self.lock.store(false, Ordering::Release);
    }
}
