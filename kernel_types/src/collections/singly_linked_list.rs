use core::marker::PhantomData;
use core::mem;
use core::ops::Deref;
use core::ops::DerefMut;
use core::ptr::NonNull;

use crate::collections::{BorrowingLinkedList, ListNodeData, TinyListNodeData, UnlinkableListGuard};
use crate::collections::ListNode;

#[repr(C)]
pub struct TinyListNode<T: Sized> {
    next: Option<NonNull<TinyListNode<T>>>,
    _marker: PhantomData<T>,
}

impl<T: ListNodeData> TinyListNode<T> {
    pub fn node(&self) -> &ListNode<T> {
        unsafe { mem::transmute(self) }
    }
    pub fn node_mut(&mut self) -> &mut ListNode<T> {
        unsafe { mem::transmute(self) }
    }
}

impl<T: ListNodeData> ListNode<T> {
    pub fn tiny(&self) -> &TinyListNode<T> {
        unsafe { mem::transmute(self) }
    }
    pub fn tiny_mut(&mut self) -> &mut TinyListNode<T> {
        unsafe { mem::transmute(self) }
    }
}

impl<T: TinyListNodeData> From<*mut TinyListNode<T>> for TinyListNode<T> {
    fn from(value: *mut TinyListNode<T>) -> Self {
        let next =
            if value.is_null() {
                None
            } else {
                unsafe { Some(&mut *value) }
            };
        Self::new(next)
    }
}

impl<T: TinyListNodeData> TinyListNode<T> {
    pub const fn empty() -> Self {
        Self { next: None, _marker: PhantomData }
    }
    pub fn new(next: Option<&mut TinyListNode<T>>) -> TinyListNode<T> {
        let next = next.map(|node| NonNull::from(node));
        Self { next, _marker: PhantomData }
    }
    pub fn set_next(&mut self, next: &mut TinyListNode<T>) {
        self.next.replace(NonNull::from(next));
    }
    pub fn remove_next(&mut self) {
        self.next = None;
    }
}

impl<T: TinyListNodeData> Deref for TinyListNode<T> {
    type Target = T::Item;

    fn deref(&self) -> &Self::Target {
        unsafe { TinyListNodeData::from_node_unchecked(NonNull::from(self)).as_ref() }
    }
}

impl<T: TinyListNodeData> DerefMut for TinyListNode<T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        TinyListNodeData::from_node(self)
    }
}

pub struct TinyLinkedList<'a, T: TinyListNodeData + Sized> {
    first: Option<NonNull<TinyListNode<T>>>,
    last: Option<NonNull<TinyListNode<T>>>,
    _marker: PhantomData<&'a mut T>,
}


pub struct UnlinkableGuard<'a, T: TinyListNodeData> {
    parent: NonNull<TinyLinkedList<'a, T>>,
}


impl<'a, T: TinyListNodeData> UnlinkableListGuard<'a, TinyLinkedList<'a, T>> for UnlinkableGuard<'a, T> {
    fn parent(&self) -> NonNull<TinyLinkedList<'a, T>> {
        self.parent
    }
}

impl<'a, T: TinyListNodeData> Default for TinyLinkedList<'a, T> {
    fn default() -> Self {
        TinyLinkedList::empty()
    }
}

impl<'a, T: TinyListNodeData> BorrowingLinkedList<'a> for TinyLinkedList<'a, T> {
    type Item = TinyListNode<T>;

    fn empty() -> TinyLinkedList<'a, T> {
        TinyLinkedList::empty()
    }

    ///it's responsibility of upper level to guarantee that data will live still the whole collection
    fn push_back(&mut self, node: &'a mut TinyListNode<T>) {
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
    fn push_front(&mut self, node: &'a mut TinyListNode<T>) {
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
    fn remove(&mut self, node: &'a mut TinyListNode<T>) {
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

    fn is_empty(&self) -> bool {
        self.first.is_none()
    }
}

impl<'a, T: TinyListNodeData> TinyLinkedList<'a, T> {
    pub fn empty() -> Self {
        TinyLinkedList {
            first: None,
            last: None,
            _marker: PhantomData,
        }
    }
    pub unsafe fn clone(&self) -> Self {
        Self {
            first: self.first,
            last: self.last,
            _marker: PhantomData,
        }
    }
    pub fn iter(&self) -> ListIterator<'a, T> {
        ListIterator::new(self)
    }
    pub fn iter_mut<'b>(&'b mut self) -> MutListIterator<'a, 'b, T> {
        MutListIterator::new(self)
    }
    pub fn link_guard(&self) -> UnlinkableGuard<'a, T> {
        UnlinkableGuard {
            parent: NonNull::from(self),
        }
    }
    pub fn splice(&mut self, other: TinyLinkedList<'a, T>) {
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
    unsafe fn splice_bounds(&mut self,
                            other_first: NonNull<TinyListNode<T>>,
                            mut other_last: NonNull<TinyListNode<T>>) {
        if let Some(mut first) = self.first && let Some(_) = self.last {
            other_last.as_mut().set_next(first.as_mut());
            self.first = Some(other_first);
        } else {
            unreachable!("Splice with empty list!");
        }
    }
}

pub struct ListIterator<'a, T: TinyListNodeData> {
    next: Option<NonNull<TinyListNode<T>>>,
    _marker: PhantomData<&'a T>,
}


impl<'a, T: TinyListNodeData> ListIterator<'a, T> {
    pub fn new(list: &TinyLinkedList<T>) -> Self {
        ListIterator {
            next: list.first,
            _marker: PhantomData,
        }
    }
}

impl<'a, T: TinyListNodeData> Iterator for ListIterator<'a, T> {
    type Item = &'a TinyListNode<T>;
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

pub struct MutListIterator<'a, 'b, T: TinyListNodeData> {
    next: Option<NonNull<TinyListNode<T>>>,
    watched: Option<NonNull<TinyListNode<T>>>,
    parent: &'b mut TinyLinkedList<'a, T>,
    _marker: PhantomData<&'a mut T>,

}

impl<'a, 'b, T: TinyListNodeData> MutListIterator<'a, 'b, T> {
    pub fn new(parent: &'b mut TinyLinkedList<'a, T>) -> Self {
        MutListIterator {
            next: parent.first,
            watched: None,
            parent,
            _marker: PhantomData,
        }
    }
    pub fn unlink_watched(&mut self) -> Option<&'a mut TinyListNode<T>> {
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

impl<'a, 'b, T: TinyListNodeData> Iterator for MutListIterator<'a, 'b, T> {
    type Item = &'a mut TinyListNode<T>;
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
    use core::mem;
    use core::mem::offset_of;
    use core::ptr::NonNull;

    use crate::collections::{BorrowingLinkedList, TinyListNodeData};
    use crate::collections::{TinyLinkedList, TinyListNode};

    unsafe impl TinyListNodeData for TestStruct {
        type Item = TestStruct;
        fn from_node(node: &mut TinyListNode<Self>) -> &mut Self::Item {
            let pointer = node as *mut TinyListNode<Self>;
            let field_offset = offset_of!(TestStruct, node);
            let struct_offset = unsafe { (pointer as *mut u8).sub(field_offset) };
            let value = unsafe { mem::transmute::<*mut u8, *mut TestStruct>(struct_offset) };
            unsafe { &mut *value }
        }
    }

    pub struct TestStruct {
        node: TinyListNode<TestStruct>,
        value: usize,
    }

    impl PartialEq for TestStruct {
        fn eq(&self, other: &Self) -> bool {
            self.value == other.value
        }
    }

    impl TestStruct {
        pub fn new(value: usize) -> Self {
            Self { node: TinyListNode::empty(), value }
        }
        pub fn as_node(&mut self) -> &mut TinyListNode<TestStruct> {
            &mut self.node
        }
    }

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

    //this macro assume that struct has field naming node
    macro_rules! fetch_unchecked {
        ($array: ident, $index: expr) => ({
            let value = $array.get_unchecked($index);
            let mut raw_node = NonNull::from(value);
            raw_node.as_mut().as_node()
        });
    }
    #[test]
    fn splice_test() {
        let mut list = TinyLinkedList::<TestStruct>::empty();
        unsafe {
            let numbers: Vec<TestStruct> = vec!(
                TestStruct::new(10),
                TestStruct::new(11),
                TestStruct::new(12),
                TestStruct::new(13),
                TestStruct::new(14),
            );
            for number in numbers[0..3].iter() {
                let mut raw_node = NonNull::from(number);
                list.push_back(raw_node.as_mut().as_node())
            }
            let mut other_list = TinyLinkedList::<TestStruct>::empty();
            other_list.push_back(fetch_unchecked!(numbers, 3));
            other_list.push_back(fetch_unchecked!(numbers, 4));
            list.splice(other_list);
            assert!(
                list.first.unwrap().eq(&NonNull::from(fetch_unchecked!(numbers, 3))) &&
                    NonNull::from(fetch_unchecked!(numbers, 4)).eq(&NonNull::from(fetch_unchecked!(numbers, 0)))
            );
            list.remove(fetch_unchecked!(numbers, 3));
            assert_eq!(list.first, Some(NonNull::from(fetch_unchecked!(numbers, 4))));
            list.remove(fetch_unchecked!(numbers, 1));
        }
    }
}
