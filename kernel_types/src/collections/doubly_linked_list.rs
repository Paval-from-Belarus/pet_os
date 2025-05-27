use core::marker::PhantomData;
use core::ops::{Deref, DerefMut};
use core::ptr;
use core::ptr::NonNull;

use crate::collections::{BorrowingLinkedList, ListNodeData};

#[macro_export]
macro_rules! collect_list {
    ($($source: expr $(,)?)+) => {{
        let mut list = $crate::collections::LinkedList::empty();

        $(
            let mut source = $source;
            let mut iter = source.iter_mut();

            loop {
                if iter.next().is_none() {
                    break;
                }

                let node = iter.unlink_watched().unwrap();
                list.push_back(node);
            }

        )+

        list
    }};
}

#[repr(C)]
pub struct ListNode<T: Sized + ListNodeData> {
    next: NonNull<ListNode<T>>,
    prev: NonNull<ListNode<T>>,
    _marker: PhantomData<*mut T>,
}

impl<T: Sized + ListNodeData> core::fmt::Debug for ListNode<T> {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        write!(
            f,
            "ListNode (next: {:?}, prev: {:?} )",
            self.next.as_ptr(),
            self.prev.as_ptr()
        )
    }
}

impl<T: ListNodeData + Sized> ListNode<T> {
    /// Createing new ListNode is absolutely safe
    /// as pivots cannot be accessed outside
    /// the LinkedList
    pub const fn empty() -> Self {
        Self {
            next: NonNull::dangling(),
            prev: NonNull::dangling(),
            _marker: PhantomData,
        }
    }

    fn set_next(&mut self, next: &mut ListNode<T>) {
        self.next = NonNull::from(next);
    }

    fn set_prev(&mut self, prev: &mut ListNode<T>) {
        self.prev = NonNull::from(prev);
    }

    //save old links
    fn relink(&mut self, new_next_option: Option<&mut ListNode<T>>) {
        unsafe {
            let old_next = self.next.as_mut();
            let old_prev = self.prev.as_mut();
            old_next.set_prev(self.prev.as_mut());
            old_prev.set_next(self.next.as_mut());
        }

        //self-link because node cannot be in illegal state
        self.self_link();

        //link new
        if let Some(new_next) = new_next_option {
            unsafe {
                let prev = self.prev.as_mut();
                let mut raw_self = NonNull::new_unchecked(self);
                self.prev = new_next.prev;
                self.next = NonNull::new_unchecked(new_next);
                new_next.prev = raw_self;
                prev.set_next(raw_self.as_mut());
            }
        }
    }

    //link next in circular list
    #[allow(unused)]
    fn link_next(&mut self, new_next: &mut ListNode<T>) {
        let mut raw_self = NonNull::from(self);
        unsafe {
            new_next.set_next(raw_self.as_mut());
            new_next.set_prev(raw_self.as_mut());
            raw_self.as_mut().set_next(new_next);
        }
    }

    //unsafe because can lead to memory leaks
    fn self_link(&mut self) {
        self.next = self.into();
        self.prev = self.into();
    }
}

#[allow(unused)]
pub fn is_self_linked<T: ListNodeData>(node: &ListNode<T>) -> bool {
    ptr::eq(node.next.as_ptr(), node.prev.as_ptr())
        && ptr::eq(node.next.as_ptr(), node)
}

impl<T: ListNodeData> Deref for ListNode<T> {
    type Target = T::Item;

    fn deref(&self) -> &Self::Target {
        ListNodeData::from_ref(self)
    }
}

impl<T: ListNodeData> DerefMut for ListNode<T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        ListNodeData::from_node(self)
    }
}

///The list lifetime is not about lifetime of list. But about lifetime of storing data
#[repr(C)]
#[derive(Debug)]
pub struct LinkedList<'data, T: Sized + ListNodeData> {
    first: *mut ListNode<T>,
    last: *mut ListNode<T>,
    _marker: PhantomData<&'data mut T>,
}

impl<T: Sized + ListNodeData> Default for LinkedList<'_, T> {
    fn default() -> Self {
        LinkedList::empty()
    }
}

impl<'data, T: ListNodeData> BorrowingLinkedList<'data>
    for LinkedList<'data, T>
{
    type Item = ListNode<T>;

    fn empty() -> Self {
        Self::empty()
    }

    fn push_back<K: Into<&'data mut ListNode<T>>>(&mut self, node: K) {
        self.push_back(node);
    }

    fn push_front(&mut self, node: &'data mut ListNode<T>) {
        let raw_node = NonNull::from(node);

        unsafe {
            if self.is_empty() {
                self.first_link(raw_node);
                return;
            }

            self.insert_after_last(raw_node);
        }

        self.first = raw_node.as_ptr();
    }

    fn remove(&mut self, node: &'data mut ListNode<T>) {
        assert!(!self.is_empty());

        unsafe {
            self.unlink_node(node);
            node.relink(None);
        }
    }

    fn is_empty(&self) -> bool {
        self.is_empty()
    }
}

impl<'data, T: Sized + ListNodeData> LinkedList<'data, T> {
    pub const fn empty() -> Self {
        Self {
            first: ptr::null_mut(),
            last: ptr::null_mut(),
            _marker: PhantomData,
        }
    }

    pub fn push_back<K: Into<&'data mut ListNode<T>>>(&mut self, node: K) {
        let raw_node = NonNull::from(node.into());

        unsafe {
            if self.is_empty() {
                self.first_link(raw_node);
                return;
            }

            self.insert_after_last(raw_node);
        }

        self.last = raw_node.as_ptr();
    }
    /// .
    ///
    /// # Safety
    ///
    /// .
    //this method remove links from node
    pub unsafe fn with_node(
        node: &'data mut ListNode<T>,
    ) -> LinkedList<'data, T> {
        node.self_link();
        Self::wrap(node)
    }

    fn wrap(node: &'data mut ListNode<T>) -> LinkedList<'data, T> {
        let raw_node = NonNull::from(node);

        Self {
            first: raw_node.as_ptr(),
            last: raw_node.as_ptr(),
            _marker: PhantomData,
        }
    }

    pub fn remove_by<F: FnOnce(&ListNode<T>) -> bool + Copy>(
        &mut self,
        predicate: F,
    ) -> Option<&'data mut ListNode<T>> {
        let mut iter = self.iter_mut();

        loop {
            let Some(node) = iter.next() else {
                break None;
            };

            if predicate(node) {
                let node = iter.unlink_watched().unwrap();
                break Some(node);
            }
        }
    }

    pub fn clear(&mut self) {
        todo!()
    }

    pub fn len(&self) -> usize {
        self.iter().count()
    }

    pub fn is_empty(&self) -> bool {
        let is_empty = self.first.is_null();

        if is_empty {
            assert!(self.last.is_null());
        } else {
            assert!(!self.first.is_null() && !self.last.is_null());
        }

        is_empty
    }

    pub fn cyclic_iter(&self) -> ListIterator<'data, T> {
        ListIterator::new(self)
    }

    pub fn iter(
        &self,
    ) -> LimitedIterator<'_, ListIterator<'data, T>, ListNode<T>> {
        LimitedIterator::new(self.cyclic_iter())
    }

    pub fn cyclic_iter_mut<'parent>(
        &'parent mut self,
    ) -> MutListIterator<'data, 'parent, T> {
        MutListIterator::new(self)
    }

    pub fn iter_mut<'parent>(
        &'parent mut self,
    ) -> LimitedIterator<'parent, MutListIterator<'data, 'parent, T>, ListNode<T>>
    {
        LimitedIterator::new(self.cyclic_iter_mut())
    }

    pub fn splice(&mut self, other: &mut LinkedList<'data, T>) {
        if other.is_empty() {
            return;
        }

        assert!(!other.first.is_null() && !other.last.is_null());

        if self.is_empty() {
            self.first = other.first;
            self.last = other.last;

            other.first = ptr::null_mut();
            other.last = ptr::null_mut();

            return;
        }

        unsafe {
            self.splice_bounds(other.first, other.last);
        }

        other.first = ptr::null_mut();
        other.last = ptr::null_mut();
    }
    //this function assumes the current list is not empty
    unsafe fn splice_bounds(
        &mut self,
        other_first: *mut ListNode<T>,
        other_last: *mut ListNode<T>,
    ) {
        assert!(!self.is_empty());

        (*self.first).prev = NonNull::new(other_last).unwrap();
        (*self.last).next = NonNull::new(other_first).unwrap();

        (*other_first).prev = NonNull::new(self.last).unwrap();
        (*other_last).next = NonNull::new(self.first).unwrap();

        self.first = other_first;
    }

    pub fn first(&self) -> Option<&ListNode<T>> {
        if self.first.is_null() {
            return None;
        }

        unsafe { &*self.first }.into()
    }

    pub fn first_mut(&mut self) -> Option<&mut ListNode<T>> {
        if self.first.is_null() {
            return None;
        }

        unsafe { &mut *self.first }.into()
    }

    pub fn last(&self) -> Option<&ListNode<T>> {
        if self.is_empty() {
            return None;
        }

        unsafe { &*self.last }.into()
    }

    pub fn last_mut(&mut self) -> Option<&mut ListNode<T>> {
        if self.is_empty() {
            return None;
        }

        unsafe { &mut *self.last }.into()
    }

    pub fn remove_first(&mut self) -> Option<&'data mut ListNode<T>> {
        if self.first.is_null() {
            return None;
        }

        let first = self.first;

        unsafe {
            self.remove(&mut *first);

            Some(&mut *first)
        }
    }

    unsafe fn insert_after_last(&mut self, mut raw_node: NonNull<ListNode<T>>) {
        assert!(!self.first.is_null() && !self.last.is_null());

        raw_node.as_mut().next = NonNull::new(self.first).unwrap();
        raw_node.as_mut().prev = NonNull::new(self.last).unwrap();

        (*self.last).next = raw_node;
        (*self.first).prev = raw_node;
    }
    //can cause data leaks with inappropriate using
    unsafe fn first_link(&mut self, mut raw_node: NonNull<ListNode<T>>) {
        self.first = raw_node.as_ptr();
        self.last = raw_node.as_ptr();

        raw_node.as_mut().self_link();
    }

    ///the method is used by iterator to unlinked element
    ///The method simply remove link in header element
    /// The pointer of raw_node can be changed
    unsafe fn unlink_node(&mut self, node: &ListNode<T>) {
        assert!(!self.is_empty(), "Failed to unlink from empty");

        if ptr::eq(self.first, self.last) {
            assert!(ptr::eq(self.first, node), "Unlinking not existing node");

            self.first = ptr::null_mut();
            self.last = ptr::null_mut();

            return;
        }
        //last and first are different nodes

        if ptr::eq(self.first, node) {
            self.first = node.next.as_ptr();
            (*self.last).next = NonNull::new(self.first).unwrap();
        }

        if ptr::eq(self.last, node) {
            self.last = node.prev.as_ptr();
            (*self.first).prev = NonNull::new(self.last).unwrap();
        }
    }
}

pub struct ListIterator<'a, T: ListNodeData> {
    next: NonNull<ListNode<T>>,
    prev: NonNull<ListNode<T>>,
    //the next value to be emitted by forward iterator
    is_empty: bool,
    _marker: PhantomData<&'a T>,
}

impl<'a, T: ListNodeData> ListIterator<'a, T> {
    fn new(list: &LinkedList<T>) -> Self {
        if list.is_empty() {
            ListIterator {
                next: NonNull::dangling(),
                prev: NonNull::dangling(),
                is_empty: true,
                _marker: PhantomData,
            }
        } else {
            ListIterator {
                next: NonNull::new(list.first).unwrap(),
                prev: NonNull::new(list.last).unwrap(),
                is_empty: false,
                _marker: PhantomData,
            }
        }
    }

    pub fn limit(
        self,
    ) -> LimitedIterator<'a, ListIterator<'a, T>, ListNode<T>> {
        LimitedIterator::new(self)
    }
}

//attention that iterator never stops
impl<'data, T: ListNodeData> Iterator for ListIterator<'data, T> {
    type Item = &'data ListNode<T>;

    fn next(&mut self) -> Option<Self::Item> {
        if self.is_empty {
            return None;
        }

        let current = unsafe { self.next.as_ref() };
        self.next = current.next;

        Some(current)
    }
}

impl<T: ListNodeData> DoubleEndedIterator for ListIterator<'_, T> {
    #[inline]
    fn next_back(&mut self) -> Option<Self::Item> {
        if self.is_empty {
            return None;
        }
        let current = unsafe { self.prev.as_ref() };
        self.prev = current.prev;
        Some(current) //automatically dereference
    }
}

//this iterator always acquire control under the collection
//please, consider doesn't keep such iterator alive
#[derive(Debug)]
pub struct MutListIterator<'data, 'parent, T: ListNodeData> {
    next: Option<NonNull<ListNode<T>>>,
    prev: Option<NonNull<ListNode<T>>>,
    watched: Option<NonNull<ListNode<T>>>,
    parent: &'parent mut LinkedList<'data, T>,
    //the iterator acquire ownership under list
    _marker: PhantomData<&'data mut T>,
}

impl<'data, 'parent, T: ListNodeData> MutListIterator<'data, 'parent, T> {
    fn new(parent: &'parent mut LinkedList<'data, T>) -> Self {
        MutListIterator {
            next: NonNull::new(parent.first),
            prev: NonNull::new(parent.last),
            watched: None,
            parent,
            _marker: PhantomData,
        }
    }

    pub fn limit(
        self,
    ) -> LimitedIterator<'data, MutListIterator<'data, 'parent, T>, ListNode<T>>
    {
        LimitedIterator::new(self)
    }

    ///Such as iterator is lazy primitive, this method unlink previously watched element
    pub fn unlink_watched(&mut self) -> Option<&'data mut ListNode<T>> {
        let unlinked = match self.watched {
            None => None, //last watched mean that parent is empty or no next/back_next method is invoked
            Some(mut watched) => unsafe {
                let prev = watched.as_ref().prev;

                self.parent.remove(watched.as_mut());

                if self.parent.is_empty() {
                    self.next = None;
                    self.prev = None;
                } else {
                    self.prev = prev.into();
                }

                Some(watched.as_mut())
            },
        };

        self.watched = None;

        unlinked
    }
}

impl<'a, T: ListNodeData> Iterator for MutListIterator<'a, '_, T> {
    type Item = &'a mut ListNode<T>;

    fn next(&mut self) -> Option<Self::Item> {
        match self.next {
            None => None,
            Some(mut current) => {
                self.watched = Some(current);

                let current_ref = unsafe { current.as_mut() };

                self.next = Some(current_ref.next);

                Some(current_ref)
            }
        }
    }
}

impl<T: ListNodeData> DoubleEndedIterator for MutListIterator<'_, '_, T> {
    fn next_back(&mut self) -> Option<Self::Item> {
        match self.prev {
            None => None,
            Some(mut current) => {
                self.watched = Some(current);
                let current_ref = unsafe { current.as_mut() };
                self.prev = Some(current_ref.prev);
                Some(current_ref)
            }
        }
    }
}

///to allow the iterator be binary compatible with each iterator, the first field is exactly iterator
#[derive(Debug)]
#[repr(C)]
pub struct LimitedIterator<'a, I, T> {
    iter: I,
    pub known_first: *const T,
    _marker: PhantomData<&'a mut I>,
}

impl<I, T> LimitedIterator<'_, I, T>
where
    I: Iterator,
{
    fn new(iter: I) -> Self {
        Self {
            iter,
            known_first: ptr::null_mut(),
            _marker: PhantomData,
        }
    }

    fn can_proceed(&mut self, next: &T) -> bool {
        if self.known_first.is_null() {
            self.known_first = next;
            true
        } else {
            self.known_first != next
        }
    }
}

impl<'data, T> LimitedIterator<'_, ListIterator<'data, T>, ListNode<T>>
where
    T: ListNodeData,
{
    pub fn cyclic(self) -> ListIterator<'data, T> {
        self.iter
    }
}

impl<'parent, 'data, T>
    LimitedIterator<'_, MutListIterator<'data, 'parent, T>, ListNode<T>>
where
    T: ListNodeData,
{
    pub fn unlink_watched(&mut self) -> Option<&'data mut ListNode<T>> {
        let unlinked = self.iter.unlink_watched();

        if let Some(node) = unlinked.as_ref() {
            if self.known_first == *node {
                assert!(!self.known_first.is_null());

                self.known_first = ptr::null_mut();
            }
        }

        unlinked
    }

    pub fn cyclic(self) -> MutListIterator<'data, 'parent, T> {
        self.iter
    }
}

impl<'data, T: ListNodeData> Iterator
    for LimitedIterator<'_, ListIterator<'data, T>, ListNode<T>>
{
    type Item = &'data ListNode<T>;

    fn next(&mut self) -> Option<Self::Item> {
        self.iter.next().filter(|next| self.can_proceed(next))
    }
}

impl<'data, T: ListNodeData> DoubleEndedIterator
    for LimitedIterator<'data, ListIterator<'data, T>, ListNode<T>>
{
    fn next_back(&mut self) -> Option<Self::Item> {
        self.iter.next_back().filter(|prev| self.can_proceed(prev))
    }
}

impl<'data, 'parent, T: ListNodeData> Iterator
    for LimitedIterator<'_, MutListIterator<'data, 'parent, T>, ListNode<T>>
{
    type Item = &'data mut ListNode<T>;

    fn next(&mut self) -> Option<Self::Item> {
        self.iter.next().filter(|next| self.can_proceed(next))
    }
}

impl<'data, 'parent, T: ListNodeData> DoubleEndedIterator
    for LimitedIterator<'_, MutListIterator<'data, 'parent, T>, ListNode<T>>
{
    fn next_back(&mut self) -> Option<Self::Item> {
        self.iter.next_back().filter(|prev| self.can_proceed(prev))
    }
}

#[macro_export]
macro_rules! list_node {
    ($ty: ident, $field: tt) => {
        impl $ty {
            #[allow(unused)]
            pub fn as_node(&mut self) -> &mut ListNode<$ty> {
                &mut self.$field
            }
        }

        unsafe impl $crate::collections::ListNodeData for $ty {
            type Item = $ty;
            fn from_node(node: &mut ListNode<Self>) -> &mut Self::Item {
                let pointer = node as *mut ListNode<Self>;
                let field_offset = core::mem::offset_of!($ty, $field);
                let struct_offset =
                    unsafe { (pointer as *mut u8).sub(field_offset) };
                let value = unsafe {
                    core::mem::transmute::<*mut u8, *mut $ty>(struct_offset)
                };
                unsafe { &mut *value }
            }

            fn from_ref(node: &ListNode<Self>) -> &Self::Item {
                let pointer = node as *const ListNode<Self>;
                let field_offset = core::mem::offset_of!($ty, $field);
                let struct_offset =
                    unsafe { (pointer as *const u8).sub(field_offset) };
                let value = struct_offset as *const $ty;
                unsafe { &*value }
            }
        }
    };
}

#[cfg(test)]
mod tests {
    extern crate alloc;
    extern crate std;

    use std::println;

    use crate::collections::BorrowingLinkedList;
    use crate::collections::{LinkedList, ListNode};

    fn has_data(node: Option<&ListNode<TestValue>>, value: usize) -> bool {
        if node.is_none() {
            return false;
        }
        node.unwrap().value == value
    }

    fn has_data_mut(
        node: Option<&mut ListNode<TestValue>>,
        value: usize,
    ) -> bool {
        if node.is_none() {
            return false;
        }
        node.unwrap().value == value
    }

    #[test]
    fn push_back_test() {
        let mut list = LinkedList::<TestValue>::empty();
        let mut nodes =
            [TestValue::new(12), TestValue::new(13), TestValue::new(14)];

        for node in nodes.iter_mut() {
            list.push_back(node.as_node());
        }
        let mut iter = list.iter().cyclic();

        assert!(has_data(iter.next(), 12));
        assert!(has_data(iter.next(), 13));
        assert!(has_data(iter.next(), 14));
        assert!(has_data(iter.next(), 12));
        assert!(has_data(iter.next(), 13));
        println!("forward test passed");
        assert!(has_data(iter.next_back(), 14));
        assert!(has_data(iter.next_back(), 13));
        assert!(has_data(iter.next_back(), 12));
        assert!(has_data(iter.next_back(), 14));
        assert!(has_data(iter.next_back(), 13));
        println!("backward test passed");
    }

    #[test]
    fn push_front_test() {
        let mut list = LinkedList::<TestValue>::empty();
        let [mut node1, mut node2, mut node3] =
            [TestValue::new(12), TestValue::new(13), TestValue::new(14)];

        list.push_front(node1.as_node());
        list.push_front(node2.as_node());
        list.push_front(node3.as_node());

        let mut iter = list.iter().cyclic();

        assert!(has_data(iter.next(), 14));
        assert!(has_data(iter.next(), 13));
        assert!(has_data(iter.next(), 12));
        assert!(has_data(iter.next(), 14));
        assert!(has_data(iter.next(), 13));
        println!("forward test passed");
        assert!(has_data(iter.next_back(), 12));
        assert!(has_data(iter.next_back(), 13));
        assert!(has_data(iter.next_back(), 14));
        assert!(has_data(iter.next_back(), 12));
        assert!(has_data(iter.next_back(), 13));
        println!("backward test passed");
    }

    macro_rules! values {
        ($($name: ident = $value: expr),* $(,)?) => {
            $(
                let mut $name = TestValue::new($value);
            )*

        };
    }

    #[test]
    fn push_back_front_test() {
        let mut list = LinkedList::<TestValue>::empty();
        values! {
            node1 = 12, node2 = 13,
            node3 = 14, node4 = 15,
            node5 = 16
        }

        list.push_back(node1.as_node());
        list.push_front(node2.as_node());
        list.push_back(node3.as_node());
        list.push_back(node4.as_node());
        list.push_front(node5.as_node());
        //values: 16, 13, 12, 14, 15

        let mut iter = list.iter().cyclic();

        assert!(has_data(iter.next(), 16));
        assert!(has_data(iter.next(), 13));
        assert!(has_data(iter.next(), 12));
        assert!(has_data(iter.next(), 14));
        assert!(has_data(iter.next(), 15));
        assert!(has_data(iter.next(), 16));
        assert!(has_data(iter.next(), 13));
        println!("forward test passed");
        assert!(has_data(iter.next_back(), 15));
        assert!(has_data(iter.next_back(), 14));
        assert!(has_data(iter.next_back(), 12));
        assert!(has_data(iter.next_back(), 13));
        assert!(has_data(iter.next_back(), 16));
        assert!(has_data(iter.next_back(), 15));
        assert!(has_data(iter.next_back(), 14));
        println!("backward test passed");
    }

    #[test]
    fn single_value_list() {
        values! {v = 12 };
        let mut list = LinkedList::empty();

        list.push_back(v.as_node());

        let mut iter = list.iter_mut();

        let k = iter.next().unwrap();

        assert_eq!(k.value, 12);

        assert!(iter.unlink_watched().is_some());
        assert!(iter.next().is_none());
    }

    pub struct TestValue {
        node: ListNode<TestValue>,
        value: usize,
    }

    impl TestValue {
        pub fn new(value: usize) -> Self {
            Self {
                node: ListNode::empty(),
                value,
            }
        }
        // pub fn as_node(&mut self) -> &mut ListNode<TestValue> {
        //     &mut self.node
        // }
    }

    list_node!(TestValue, node);

    // unsafe impl ListNodeData for TestValue {
    //     type Item = TestValue;
    //
    //     fn from_node(node: &mut ListNode<Self>) -> &mut Self::Item {
    //         let pointer = node as *mut ListNode<Self>;
    //         let field_offset = core::mem::offset_of!(TestValue, node);
    //         let struct_offset =
    //             unsafe { (pointer as *mut u8).sub(field_offset) };
    //         let value = unsafe {
    //             core::mem::transmute::<*mut u8, *mut TestValue>(struct_offset)
    //         };
    //         unsafe { &mut *value }
    //     }
    //
    //     fn from_ref(node: &ListNode<Self>) -> &Self::Item {
    //         let pointer = node as *const ListNode<Self>;
    //         let field_offset = core::mem::offset_of!(TestValue, node);
    //         let struct_offset =
    //             unsafe { (pointer as *mut u8).sub(field_offset) };
    //         let value = unsafe {
    //             core::mem::transmute::<*const u8, *const TestValue>(
    //                 struct_offset,
    //             )
    //         };
    //         unsafe { &*value }
    //     }
    // }

    fn list_to_vec(list: &LinkedList<TestValue>) -> std::vec::Vec<usize> {
        let mut result = std::vec![];
        // Assuming LinkedList has an iterator yielding &Test
        for test in list.iter() {
            result.push(test.value);
        }
        result
    }

    #[test]
    fn splice_test() {
        let mut test1 = TestValue::new(1);
        let mut test2 = TestValue::new(2);
        let mut test3 = TestValue::new(3);
        let mut list = LinkedList::empty();
        let mut other = LinkedList::empty();

        let test_ptr = test3.as_node() as *mut _;

        list.push_back(test1.as_node());
        list.push_back(test2.as_node());
        other.push_back(test3.as_node());
        list.splice(&mut other);

        assert_eq!(list_to_vec(&list), std::vec![3, 1, 2]);
        assert!(other.is_empty());

        let maybe_test = list.remove_first();

        assert!(maybe_test.is_some());
        assert!(core::ptr::eq(maybe_test.unwrap(), test_ptr));

        other.splice(&mut list);

        assert_eq!(list_to_vec(&other), std::vec![1, 2]);
        assert!(list.is_empty());
    }

    #[test]
    fn mutability_iter_test() {
        let mut list = LinkedList::<TestValue>::empty();

        values! {
            node1 = 12, node2 = 13, node3 = 14
        };

        list.push_back(node1.as_node());
        list.push_back(node2.as_node());
        list.push_back(node3.as_node());

        let mut iter = list.iter_mut();
        assert!(iter.unlink_watched().is_none());

        let node_value = iter.next().unwrap();
        let node_option = iter.unlink_watched();

        assert!(node_option.is_some());
        assert_eq!(node_value.value, node_option.unwrap().value);
        assert!(iter.unlink_watched().is_none());
    }

    #[test]
    fn removing_test() {
        let mut list = LinkedList::<TestValue>::empty();
        values! {
            node1 = 12, node2 = 13
        };

        list.push_back(node1.as_node());
        list.push_back(node2.as_node());

        assert_eq!(12, list.remove_first().unwrap().value);
        assert_eq!(13, list.remove_first().unwrap().value);

        assert!(list.remove_first().is_none());
        let _ = list.iter();
    }

    #[test]
    fn limit_test() {
        values! {
            node1 = 12, node2 = 13,
            node3 = 14, node4 = 15,
            node5 = 16
        }

        let mut list = LinkedList::<TestValue>::empty();

        list.push_back(node1.as_node());
        list.push_front(node2.as_node());
        list.push_back(node3.as_node());
        list.push_back(node4.as_node());
        list.push_front(node5.as_node());
        //values: 16, 13, 12, 14, 15

        let mut iter = list.iter();

        assert!(has_data(iter.next(), 16));
        assert!(has_data(iter.next(), 13));
        assert!(has_data(iter.next(), 12));
        assert!(has_data(iter.next(), 14));
        assert!(has_data(iter.next(), 15));
        assert!(iter.next().is_none());

        assert_eq!(list.len(), 5);

        let mut iter = list.iter_mut();

        assert!(has_data_mut(iter.next(), 16));
        assert!(has_data_mut(iter.unlink_watched(), 16));

        assert!(has_data_mut(iter.next_back(), 15));
        assert!(has_data_mut(iter.unlink_watched(), 15));

        assert_eq!(list.len(), 3);
    }
}
