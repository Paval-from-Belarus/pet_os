use core::ptr::NonNull;
use core::marker::PhantomData;
use core::mem;
use core::ops::Deref;
use core::ops::DerefMut;
use crate::memory::VirtualAddress;
use crate::utils::ListNode;

#[repr(C)]
pub struct SimpleListNode<T> {
    next: Option<NonNull<SimpleListNode<T>>>,
    data: T,
}

pub trait ToSimpleListNode<T> {
    fn as_simple(&mut self) -> &mut SimpleListNode<ListNodeWrapper<T>>;
}

#[repr(C)]
pub struct ListNodeWrapper<T> {
    _reserved: NonNull<ListNode<T>>,
    data: T,
}

impl<T> Deref for ListNodeWrapper<T> {
    type Target = T;
    fn deref(&self) -> &Self::Target {
        &self.data
    }
}

impl<T> ToSimpleListNode<T> for ListNode<T> {
    fn as_simple(&mut self) -> &mut SimpleListNode<ListNodeWrapper<T>> {
        unsafe {
            mem::transmute::<&mut ListNode<T>, &mut SimpleListNode<ListNodeWrapper<T>>>(self)
        }
    }
}

impl<T> SimpleListNode<ListNodeWrapper<T>> {
    pub fn as_node(&mut self) -> &mut ListNode<T> {
        unsafe {
            mem::transmute::<&mut SimpleListNode<ListNodeWrapper<T>>, &mut ListNode<T>>(self)
        }
    }
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
    pub fn data(&self) -> &T {
        &self.data
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
    last: Option<NonNull<SimpleListNode<T>>>,
    _marker: PhantomData<&'a mut T>,
}

impl<'a, T> SimpleList<'a, T> {
    pub fn empty() -> SimpleList<'a, T> {
        SimpleList {
            first: None,
            last: None,
            _marker: PhantomData,
        }
    }
    pub fn is_empty(&self) -> bool {
        self.first.is_none()
    }
    pub fn iter(&self) -> ListIterator<'a, T> {
        ListIterator::new(self)
    }
    pub fn iter_mut<'b>(&'b mut self) -> MutListIterator<'a, 'b, T> {
        MutListIterator::new(self)
    }
    pub fn splice(&mut self, other: SimpleList<'a, T>) {
        if self.is_empty() {
            self.first = other.first;
            self.last = other.last;
            return;
        }
        if let Some(first) = other.first && let Some(last) = other.last {
            unsafe { self.splice_bounds(first, last) };
        } else {
            assert!(other.is_empty());
        }
    }
    pub fn size(&self) -> usize {
        self.iter()
            .count()
    }
    pub fn push_front(&mut self, node: &'a mut SimpleListNode<T>) {
        node.next = self.first;
        let mut raw_node = NonNull::from(node);
        unsafe {
            if let Some(mut old_first) = self.first {
                raw_node.as_mut().set_next(old_first.as_mut());
            } else {
                self.last = Some(raw_node);
            }
        }
        self.first = Some(raw_node);
    }
    ///it's responsibility of upper level to guarantee that data will live still the whole collection
    pub fn push_back(&mut self, node: &'a mut SimpleListNode<T>) {
        unsafe {
            let mut raw_node = NonNull::from(node);
            if let Some(mut old_last) = self.last {
                old_last.as_mut().set_next(raw_node.as_mut());
            } else {
                assert!(self.first.is_none(), "The empty last means empty first");
                self.first = Some(raw_node);
            }
            self.last = Some(raw_node);
        }
    }
    pub fn remove(&mut self, node: &'a mut SimpleListNode<T>) {
        assert!(!self.is_empty());
        let mut raw_node = NonNull::from(node);
        if let Some(raw_first) = self.first && let Some(raw_last) = self.last {
            if raw_first.eq(&raw_node) {
                self.first = unsafe { raw_node.as_mut().next };
                if raw_last.eq(&raw_node) {
                    assert!(self.first.is_none());
                    self.last = None;
                }
                return;
            }
            let before_option = self.iter_mut()
                .find(|node| -> bool {
                    if let Some(next) = node.next {
                        next.eq(&raw_node)
                    } else {
                        false
                    }
                });
            assert!(self.is_empty() && before_option.is_none() || !self.is_empty() && before_option.is_some());
            if let Some(before) = before_option {
                before.next = unsafe { raw_node.as_mut().next };
                if raw_last.eq(&raw_node) {
                    self.last = Some(NonNull::from(before));
                }
            }
        } else {
            unreachable!("Remove from empty single list");
        }
    }
    unsafe fn splice_bounds(&mut self,
                            other_first: NonNull<SimpleListNode<T>>,
                            mut other_last: NonNull<SimpleListNode<T>>) {
        if let Some(mut first) = self.first && let Some(_) = self.last {
            other_last.as_mut().set_next(first.as_mut());
            self.first = Some(other_first);
        } else {
            unreachable!("Splice with empty list!");
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
    type Item = &'a SimpleListNode<T>;
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
    watched: Option<NonNull<SimpleListNode<T>>>,
    parent: &'b mut SimpleList<'a, T>,
    _marker: PhantomData<&'a mut T>,

}

impl<'a, 'b, T> MutListIterator<'a, 'b, T> {
    pub fn new(parent: &'b mut SimpleList<'a, T>) -> Self {
        MutListIterator {
            next: parent.first,
            watched: None,
            parent,
            _marker: PhantomData,
        }
    }
    pub fn unlink_watched(&mut self) -> Option<&'a mut SimpleListNode<T>> {
        let unlinked = match self.watched {
            None => None,
            Some(mut watched) => unsafe {
                self.parent.remove(watched.as_mut());
                Some(watched.as_mut())
            }
        };
        self.watched = None;
        unlinked
    }
}

impl<'a, 'b, T> Iterator for MutListIterator<'a, 'b, T> {
    type Item = &'a mut SimpleListNode<T>;
    fn next(&mut self) -> Option<Self::Item> {
        match self.next {
            None => None,
            Some(mut pointer) => {
                self.watched = Some(pointer);
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
    use core::ptr::NonNull;
    use crate::utils::{SimpleList, SimpleListNode};


    #[test]
    fn iteration_test() {
        let mut numbers = [1, 2, 3, 4, 5, 6];
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
    #[test]
    fn splice_test() {
        let mut list = SimpleList::<usize>::empty();
        unsafe {
            let numbers: Vec<SimpleListNode<usize>> = vec!(
                SimpleListNode::wrap_data(10),
                SimpleListNode::wrap_data(11),
                SimpleListNode::wrap_data(12),
                SimpleListNode::wrap_data(13),
                SimpleListNode::wrap_data(14),
            );
            for number in numbers[0..3].iter() {
                list.push_back(NonNull::from(number).as_mut());
            }
            let mut other_list = SimpleList::<usize>::empty();
            other_list.push_back(NonNull::from(numbers.get_unchecked(3)).as_mut());
            other_list.push_back(NonNull::from(numbers.get_unchecked(4)).as_mut());
            list.splice(other_list);
            assert!(
                list.first.unwrap().as_ref().eq(numbers.get_unchecked(3)) &&
                    numbers.get_unchecked(4).next.unwrap().as_ref().eq(numbers.get_unchecked(0)));
            list.remove(NonNull::from(numbers.get_unchecked(3)).as_mut());
            assert_eq!(list.first, Some(NonNull::from(numbers.get_unchecked(4))));
            list.remove(NonNull::from(numbers.get_unchecked(1)).as_mut());
            assert!(
                numbers.get_unchecked(0).next.unwrap().as_ref().eq(&numbers.get_unchecked(2))
            );
        }
    }
}