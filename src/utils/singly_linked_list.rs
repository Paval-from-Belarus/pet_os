use core::ptr::NonNull;
use core::marker::PhantomData;
use core::ops::Deref;
use core::ops::DerefMut;

pub struct SimpleListNode<T> {
    next: Option<NonNull<SimpleListNode<T>>>,
    data: T,
}

impl<T> SimpleListNode<T> {
    pub const fn wrap_data(data: T) -> Self {
        Self {
            next: None,
            data,
        }
    }
    pub fn new(data: T, next_ptr: *mut SimpleListNode<T>) -> Self {
        let next = if next_ptr.is_null() {
            None
        } else {
            let next_ref = unsafe { &mut *next_ptr };
            Some(NonNull::from(next_ref))
        };
        Self {
            next,
            data,
        }
    }
    pub fn set_next(&mut self, next: &mut SimpleListNode<T>) {
        self.next = Some(NonNull::from(next));
    }
    pub fn remove_next(&mut self) {
        self.next = None;
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

pub struct SimpleList<'a, T: Sized> {
    first: Option<NonNull<SimpleListNode<T>>>,
    tail: Option<NonNull<SimpleListNode<T>>>,
    _marker: PhantomData<&'a mut T>,
}

impl<'a, T> SimpleList<'a, T> {
    pub fn empty() -> SimpleList<'a, T> {
        SimpleList {
            first: None,
            tail: None,
            _marker: PhantomData,
        }
    }
    pub fn is_empty(&self) -> bool {
        self.first.is_some()
    }
    pub fn iter(&self) -> ListIterator<'a, T> {
        ListIterator::new(self)
    }
    pub fn iter_mut<'b>(&'b mut self) -> MutListIterator<'a, 'b, T> {
        MutListIterator::new(self)
    }
    pub fn splice(&mut self, other: &mut SimpleList<'a, T>) {
        todo!()
    }
    pub fn size(&self) -> usize {
        self.iter()
            .count()
    }
    pub fn push_front(&mut self, node: &'a mut SimpleListNode<T>) {
        node.next = self.first;
        let raw_node = NonNull::from(node);
        self.first = Some(raw_node);
    }
    ///it's responsibility of upper level to guarantee that data will live still the whole collection
    pub fn push_back(&mut self, node: &'a mut SimpleListNode<T>) {
        unsafe {
            let mut node = NonNull::from(node);
            if let Some(old_tail) = self.tail.map(|mut tail| tail.as_mut()) {
                old_tail.set_next(node.as_mut());
            } else {
                debug_assert!(self.first.is_none(), "The empty last means empty first");
                self.first = Some(node);
            }
            self.tail = Some(node);
        }
    }
}

pub struct ListIterator<'a, T> {
    next: Option<NonNull<SimpleListNode<T>>>,
    _marker: PhantomData<&'a T>,
}


impl<'a, T> ListIterator<'a, T> {
    pub fn new(list: &SimpleList<T>) -> Self {
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

pub struct MutListIterator<'a, 'b, T> {
    next: Option<NonNull<SimpleListNode<T>>>,
    _marker: PhantomData<&'a mut T>,
    _parent: PhantomData<&'b mut T>,
}

impl<'a, 'b, T> MutListIterator<'a, 'b, T> {
    pub fn new(list: &'b mut SimpleList<T>) -> Self {
        MutListIterator {
            next: list.first,
            _marker: PhantomData,
            _parent: PhantomData,
        }
    }
    pub fn unlink_watched(&mut self) -> Option<&'a mut SimpleListNode<T>> {
        todo!()
    }
}

impl<'a, 'b, T> Iterator for MutListIterator<'a, 'b, T> {
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

    use alloc::vec;
    use alloc::vec::Vec;

    #[test]
    fn iteration_test() {
        let mut numbers = vec![1, 2, 3, 4, 5, 6];
        let mut number_iter = numbers.iter_mut();
        let _ = number_iter.by_ref()
            .take(2)
            .count();
        assert_eq!(number_iter.next(), Some(&mut 3));
        // assert_eq!(iter.next(), Some(&mut 6));
        std::println!("Hello");
        // assert_eq!(skipped, 1);
        assert_eq!(number_iter.next(), Some(&mut 4));
    }
}