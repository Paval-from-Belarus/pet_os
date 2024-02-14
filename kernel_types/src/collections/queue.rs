use core::marker::PhantomData;

pub struct Queue<T> {
    _marker: PhantomData<T>
}
