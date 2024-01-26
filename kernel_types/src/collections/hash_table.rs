use core::marker::PhantomData;
use core::ptr::NonNull;

pub struct HashTable<'a, T: Sized +> {
    capacity: usize,
    table: NonNull<T>,
    _marker: PhantomData<&'a mut [T]>,
}
