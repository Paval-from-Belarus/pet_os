use core::ptr::NonNull;
use core::marker::PhantomData;
use core::ops::Deref;
use core::ops::DerefMut;

pub struct SimpleListNode<T> {
    next: Option<NonNull<SimpleListNode<T>>>,
    data: T,
}

impl<T> SimpleListNode<T> {
    pub fn wrap_date(data: T) -> Self {
        Self {
            next: None,
            data,
        }
    }
    pub fn set_next(&mut self, next: NonNull<SimpleListNode<T>>) {
        self.next = Some(next);
    }
}

impl<T> Deref for SimpleListNode<T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        &self.data
    }
}

impl<T> DerefMut for SimpleListNode<T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.data
    }
}

pub struct SimpleList<T: Sized> {
    first: Option<NonNull<SimpleListNode<T>>>,
}

impl<T> SimpleList<T> {
    pub fn empty() -> Self {
        SimpleList {
            first: None
        }
    }
    pub fn is_empty(&self) -> bool {
        self.first.is_some()
    }
    pub fn iter(&self) -> ListIterator<'_, T> {
        ListIterator::new(self)
    }
    pub fn iter_mut(&mut self) -> MutListIterator<'_, T> {
        MutListIterator::new(self)
    }
    pub fn push_front(&mut self, mut node: NonNull<SimpleListNode<T>>) {
        unsafe { node.as_mut().next = self.first };
        self.first = Some(node);
    }
}

pub struct ListIterator<'a, T> {
    next: Option<NonNull<SimpleListNode<T>>>,
    _marker: PhantomData<&'a T>,
}

impl<'a, T> ListIterator<'a, T> {
    pub fn new(list: &'a SimpleList<T>) -> Self {
        ListIterator {
            next: list.first,
            _marker: PhantomData,
        }
    }
}

impl<'a, T> Iterator for ListIterator<'a, T> {
    type Item = &'a T;
    #[inline]
    fn next(&mut self) -> Option<Self::Item> {
        match self.next {
            None => None,
            Some(pointer) => {
                let current = unsafe { pointer.as_ref() };
                self.next = current.next;
                Some(current)
            }
        }
    }
}

pub struct MutListIterator<'a, T> {
    next: Option<NonNull<SimpleListNode<T>>>,
    _marker: PhantomData<&'a mut T>,
}

impl<'a, T> MutListIterator<'a, T> {
    pub fn new(list: &'a mut SimpleList<T>) -> Self {
        MutListIterator {
            next: list.first,
            _marker: PhantomData,
        }
    }
}

impl<'a, T> Iterator for MutListIterator<'a, T> {
    type Item = &'a mut T;
    fn next(&mut self) -> Option<Self::Item> {
        match self.next {
            None => None,
            Some(mut pointer) => {
                let current = unsafe { pointer.as_mut() };
                self.next = current.next;
                Some(current)
            }
        }
    }
}
#[cfg(test)]
mod tests {
    extern crate std;
    extern crate alloc;
    #[test]
    fn iteration_test() {

    }

}