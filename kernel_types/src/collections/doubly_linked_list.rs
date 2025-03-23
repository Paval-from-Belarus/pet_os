use core::marker::PhantomData;
use core::ops::{Deref, DerefMut};
use core::ptr::NonNull;
use core::{mem, ptr};

use crate::collections::{
    BorrowingLinkedList, DanglingData, ListNodeData, UnlinkableListGuard,
};

#[derive(Debug)]
#[repr(C)]
pub struct ListNode<T: Sized + ListNodeData> {
    next: NonNull<ListNode<T>>,
    prev: NonNull<ListNode<T>>,
    _marker: PhantomData<T>,
}

impl<T: ListNodeData + Sized> ListNode<T> {
    pub const fn empty() -> Self {
        Self {
            next: NonNull::dangling(),
            prev: NonNull::dangling(),
            _marker: PhantomData,
        }
    }

    pub fn new(next: &mut ListNode<T>, prev: &mut ListNode<T>) -> Self {
        let next = NonNull::from(next);
        let prev = NonNull::from(prev);
        Self {
            next,
            prev,
            _marker: PhantomData,
        }
    }
    pub fn next(&self) -> &ListNode<T> {
        unsafe { self.next.as_ref() }
    }

    pub fn prev(&self) -> &ListNode<T> {
        unsafe { self.prev.as_ref() }
    }

    fn next_mut(&mut self) -> &mut ListNode<T> {
        unsafe { self.next.as_mut() }
    }

    fn prev_mut(&mut self) -> &mut ListNode<T> {
        unsafe { self.prev.as_mut() }
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
        unsafe { self.self_link() };
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
    fn link_next(&mut self, new_next: &mut ListNode<T>) {
        let mut raw_self = NonNull::from(self);
        unsafe {
            new_next.set_next(raw_self.as_mut());
            new_next.set_prev(raw_self.as_mut());
            raw_self.as_mut().set_next(new_next);
        }
    }

    pub fn as_ptr(&self) -> *const ListNode<T> {
        self as *const ListNode<T>
    }

    pub unsafe fn as_mut_ptr(&mut self) -> *mut ListNode<T> {
        self as *mut ListNode<T>
    }
    //unsafe because can lead to memory leaks
    pub unsafe fn self_link(&mut self) {
        unsafe {
            self.next = NonNull::new_unchecked(self);
            self.prev = NonNull::new_unchecked(self);
        }
    }
}

impl<T: Sized + ListNodeData + DanglingData> ListNode<T> {
    ///Wrap existing valid node to new list
    ///The node should be dangling. That is no other way to access node list besides wrapping to temporary list
    pub unsafe fn wrap(&mut self) -> LinkedList<T> {
        LinkedList::wrap(self)
    }
}

pub fn is_self_linked<T: ListNodeData>(node: &ListNode<T>) -> bool {
    ptr::eq(node.next.as_ptr(), node.prev.as_ptr())
        && ptr::eq(node.next.as_ptr(), node)
}

impl<T: ListNodeData> Deref for ListNode<T> {
    type Target = T::Item;

    fn deref(&self) -> &Self::Target {
        unsafe {
            ListNodeData::from_node_unchecked(NonNull::from(self)).as_ref()
        }
    }
}

impl<T: ListNodeData> DerefMut for ListNode<T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        ListNodeData::from_node(self)
    }
}

///The list lifetime is not about lifetime of list. But about lifetime of storing data
#[repr(C)]
#[derive(Clone, Copy, Debug)]
pub struct LinkedList<'a, T: Sized + ListNodeData> {
    first: Option<NonNull<ListNode<T>>>,
    last: Option<NonNull<ListNode<T>>>,
    _marker: PhantomData<&'a mut T>,
}

impl<'a, T: Sized + ListNodeData> Default for LinkedList<'a, T> {
    fn default() -> Self {
        LinkedList::empty()
    }
}

pub struct UnlinkableGuard<'a, T: ListNodeData> {
    parent: NonNull<LinkedList<'a, T>>,
}

impl<'a, T: ListNodeData> UnlinkableGuard<'a, T> {}

impl<'a, T: ListNodeData> UnlinkableListGuard<'a, LinkedList<'a, T>>
    for UnlinkableGuard<'a, T>
{
    fn parent(&self) -> NonNull<LinkedList<'a, T>> {
        self.parent
    }
}

impl<'a, T: ListNodeData> BorrowingLinkedList<'a> for LinkedList<'a, T> {
    type Item = ListNode<T>;

    fn empty() -> Self {
        Self {
            first: None,
            last: None,
            _marker: PhantomData,
        }
    }

    fn push_back(&mut self, node: &'a mut ListNode<T>) {
        let raw_node = NonNull::from(node);
        unsafe {
            if self.is_empty() {
                self.first_link(raw_node);
                return;
            }
            self.insert_after_last(raw_node);
        }
        self.last = Some(raw_node); //we already changed last in list
    }

    fn push_front(&mut self, node: &'a mut ListNode<T>) {
        let raw_node = NonNull::from(node);

        unsafe {
            if self.is_empty() {
                self.first_link(raw_node);
                return;
            }
            self.insert_after_last(raw_node);
        }

        self.first = Some(raw_node);
    }

    fn remove(&mut self, node: &'a mut ListNode<T>) {
        assert!(!self.is_empty());

        let mut raw_node = NonNull::from(node);

        unsafe {
            self.unlink_node(raw_node);
            raw_node.as_mut().relink(None);
        }
    }

    fn is_empty(&self) -> bool {
        assert!(
            self.last.is_some() && self.first.is_some()
                || self.last.is_none() && self.first.is_none()
        );
        self.first.is_none()
    }
}

impl<'a, T: Sized + ListNodeData> LinkedList<'a, T> {
    /// .
    ///
    /// # Safety
    ///
    /// .
    //this method remove links from node
    pub unsafe fn with_node(node: &'a mut ListNode<T>) -> LinkedList<'a, T> {
        node.self_link();
        Self::wrap(node)
    }
    fn wrap(node: &'a mut ListNode<T>) -> LinkedList<'a, T> {
        let raw_node = NonNull::from(node);
        Self {
            first: Some(raw_node),
            last: Some(raw_node),
            _marker: PhantomData,
        }
    }

    /// Returns the clear of this [`LinkedList<T>`].
    ///
    /// # Safety
    ///
    /// .
    pub unsafe fn clear(&mut self) {
        self.first = None;
        self.last = None;
    }
    pub fn iter(&self) -> ListIterator<'a, T> {
        ListIterator::new(self)
    }

    pub fn limit_iter(&self) -> LimitedIterator<'a, ListIterator<'a, T>> {
        LimitedIterator::new(self.iter())
    }

    pub fn iter_mut<'b>(&'b mut self) -> MutListIterator<'a, 'b, T> {
        MutListIterator::new(self)
    }

    pub fn limit_iter_mut<'b>(
        &'b mut self,
    ) -> LimitedIterator<'a, MutListIterator<'a, 'b, T>> {
        LimitedIterator::new(self.iter_mut())
    }

    pub fn splice(&mut self, other: LinkedList<'a, T>) {
        if let Some(first) = other.first
            && let Some(last) = other.last
        {
            if self.is_empty() {
                self.first = Some(first);
                self.last = Some(last);
                return;
            }
            unsafe { self.splice_bounds(first, last) };
        } else {
            assert!(other.is_empty());
        }
    }
    //this function assumes the current list is not empty
    unsafe fn splice_bounds(
        &mut self,
        mut other_first: NonNull<ListNode<T>>,
        mut other_last: NonNull<ListNode<T>>,
    ) {
        assert!(!self.is_empty());
        if let Some(mut first) = self.first
            && let Some(mut last) = self.last
        {
            let first = first.as_mut();
            let last = last.as_mut();
            let other_first = other_first.as_mut();
            let other_last = other_last.as_mut();
            first.set_prev(other_last);
            last.set_next(other_first);
            other_first.set_prev(last);
            other_last.set_next(first);
            self.first = Some(other_first.into());
        } else {
            unreachable!("Splice with empty list!");
        }
    }
    /// .
    ///
    /// # Safety
    ///
    /// .
    unsafe fn same_as_first(&self, node: NonNull<ListNode<T>>) -> bool {
        if let Some(head) = self.first
            && let Some(_) = self.last
        {
            node.eq(&head)
        } else {
            unreachable!("The head is empty");
        }
    }
    ///this method check the given node is same as node
    ///Method failed with empty list
    unsafe fn same_as_last(&self, node: NonNull<ListNode<T>>) -> bool {
        if let Some(_) = self.first
            && let Some(tail) = self.last
        {
            node.eq(&tail)
        } else {
            unreachable!("The tail is empty");
        }
    }

    pub fn remove_first(&mut self) -> Option<&'a mut ListNode<T>> {
        match self.first {
            Some(mut first) => unsafe {
                self.remove(first.as_mut());
                Some(first.as_mut())
            },
            None => None,
        }
    }
    //the only way to modify the current collection with external iterator
    pub unsafe fn link_guard<'b>(&'b self) -> UnlinkableGuard<'a, T> {
        // let parent = unsafe {
        //     let mut raw_ref = NonNull::from(self);
        //     UnsafeCell::new(raw_ref.as_mut())
        // };
        UnlinkableGuard {
            parent: NonNull::from(self),
        }
    }
    //cause data leaks with node
    unsafe fn insert_after_last(&mut self, mut raw_node: NonNull<ListNode<T>>) {
        if let Some(mut raw_first) = self.first
            && let Some(mut raw_last) = self.last
        {
            let first = raw_first.as_mut();
            let last = raw_last.as_mut();
            let node = raw_node.as_mut();
            node.set_prev(last);
            node.set_next(first);
            last.set_next(node);
            first.set_prev(node);
        } else {
            unreachable!("Should be invoked on empty list");
        }
    }
    //can cause data leaks with inappropriate using
    unsafe fn first_link(&mut self, mut raw_node: NonNull<ListNode<T>>) {
        self.first = Some(raw_node);
        self.last = Some(raw_node);
        raw_node.as_mut().self_link();
    }

    ///the method is used by iterator to unlinked element
    ///The method simply remove link in header element
    unsafe fn unlink_node(&mut self, mut raw_node: NonNull<ListNode<T>>) {
        if let Some((first, last)) = self.first.zip(self.last) {
            if first.eq(&last) && first.eq(&raw_node) {
                self.first = None;
                self.last = None;
                return;
            }
            //relink header, because node by self has no relation with header
            //it's legal to use other values from node,
            // because list holds not single element
            //in case of non single element, no node is self-linked
            if first.eq(&raw_node) {
                unsafe {
                    self.first = Some(raw_node.as_mut().next);
                }
            }

            if last.eq(&raw_node) {
                unsafe {
                    self.last = Some(raw_node.as_mut().prev);
                }
            }
        } else {
            unreachable!("Impossible to unlink from empty list");
        }
    }
}

//it's really not desirable to use such trait
//because InfiniteLinkedList is supposed to be essential part of kernel
impl<'a, T: ListNodeData> IntoIterator for &'a mut LinkedList<'a, T> {
    type Item = &'a ListNode<T>;
    type IntoIter = ListIterator<'a, T>;

    fn into_iter(self) -> Self::IntoIter {
        self.iter()
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
        if let Some(first) = list.first
            && let Some(last) = list.last
        {
            ListIterator {
                next: first,
                prev: last,
                is_empty: false,
                _marker: PhantomData,
            }
        } else {
            ListIterator {
                next: NonNull::dangling(),
                prev: NonNull::dangling(),
                is_empty: true,
                _marker: PhantomData,
            }
        }
    }
    pub fn limit(self) -> LimitedIterator<'a, ListIterator<'a, T>> {
        LimitedIterator::new(self)
    }
}

//attention that iterator never stops
impl<'a, T: ListNodeData> Iterator for ListIterator<'a, T> {
    type Item = &'a ListNode<T>;
    #[inline]
    fn next(&mut self) -> Option<Self::Item> {
        if self.is_empty {
            return None;
        }
        let current = unsafe { self.next.as_ref() };
        self.next = current.next;
        Some(current)
    }
}

impl<'a, T: ListNodeData> DoubleEndedIterator for ListIterator<'a, T> {
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
pub struct MutListIterator<'a, 'b, T: ListNodeData> {
    next: Option<NonNull<ListNode<T>>>,
    prev: Option<NonNull<ListNode<T>>>,
    watched: Option<NonNull<ListNode<T>>>,
    parent: &'b mut LinkedList<'a, T>,
    //the iterator acquire ownership under list
    _marker: PhantomData<&'a mut T>,
}

impl<'a, 'b, T: ListNodeData> MutListIterator<'a, 'b, T> {
    fn new(parent: &'b mut LinkedList<'a, T>) -> Self {
        MutListIterator {
            next: parent.first,
            prev: parent.last,
            watched: None,
            parent,
            _marker: PhantomData,
        }
    }
    pub fn limit(self) -> LimitedIterator<'a, MutListIterator<'a, 'b, T>> {
        LimitedIterator::new(self)
    }
    ///Such as iterator is lazy primitive, this method unlink previously watched element
    pub fn unlink_watched(&mut self) -> Option<&'a mut ListNode<T>> {
        let unlinked = match self.watched {
            None => None, //last watched mean that parent is empty or no next/back_next method is invoked
            Some(mut watched) => unsafe {
                self.parent.remove(watched.as_mut());
                if self.parent.is_empty() {
                    self.next = None;
                    self.prev = None;
                    // free_node.self_link() the node is immutable item for caller
                }
                Some(watched.as_mut())
            },
        };
        self.watched = None;
        unlinked
    }
}

impl<'a, 'b, T: ListNodeData> Iterator for MutListIterator<'a, 'b, T> {
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

impl<'a, 'b, T: ListNodeData> DoubleEndedIterator
    for MutListIterator<'a, 'b, T>
{
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
#[repr(C)]
pub struct LimitedIterator<'a, I> {
    iter: I,
    first: Option<NonNull<u8>>,
    _marker: PhantomData<&'a mut I>,
}

impl<'a, I> LimitedIterator<'a, I> {
    fn new(iter: I) -> Self {
        Self {
            iter,
            first: None,
            _marker: PhantomData,
        }
    }

    fn can_proceed<T>(&mut self, next: &T) -> bool {
        let raw_next = unsafe {
            let ref_next = mem::transmute::<&T, &u8>(next);
            NonNull::from(ref_next)
        };
        if let Some(raw_first) = self.first {
            !raw_next.eq(&raw_first)
        } else {
            self.first = Some(raw_next);
            true
        }
    }
}

impl<'a, I: Iterator> Iterator for LimitedIterator<'a, I> {
    type Item = I::Item;

    fn next(&mut self) -> Option<Self::Item> {
        self.iter.next().filter(|next| self.can_proceed(next))
    }
}

impl<'a, I: DoubleEndedIterator> DoubleEndedIterator
    for LimitedIterator<'a, I>
{
    fn next_back(&mut self) -> Option<Self::Item> {
        self.iter.next_back().filter(|prev| self.can_proceed(prev))
    }
}

#[macro_export]
macro_rules! from_list_node {
    ($target: ident, $source: ident, $field: tt) => {
        unsafe impl $crate::collections::ListNodeData for $source {
            type Item = $target;
            fn from_node(node: &mut ListNode<Self>) -> &mut Self::Item {
                let pointer = node as *mut ListNode<Self>;
                let field_offset = core::mem::offset_of!($target, $field);
                let struct_offset =
                    unsafe { (pointer as *mut u8).sub(field_offset) };
                let value = unsafe {
                    core::mem::transmute::<*mut u8, *mut $target>(struct_offset)
                };
                unsafe { &mut *value }
            }
        }
    };
}
#[macro_export]
macro_rules! pivots_field {
    ($vis: vis, $type: ident, $field: tt,  $field_type: ident) => {
        paste::paste! {
            impl $type {
                $vis unsafe fn [<as_ $field>](&self) -> core::ptr::NonNull<ListNode<$field_type>> {
                    core::ptr::NonNull::from(&self.$field)
                }
                // $vis fn [<as_ $field>] (&self) -> &ListNode<$field_type> {
                //     self.$field
                // }
                // $vis fn [<as_ $field _mut>](&mut self) -> &mut ListNode<$field_type> {
                //     self.$field
                // }
            }
        }
    };
}
///The general idea of list_node macro is to allow implements several ListNode types from single structure (by corresponding fields in derived struct)
#[macro_export]
macro_rules! list_node {
    ($vis: vis $target: ident $( ($self_field:tt))? $(;)? $( $name: ident  ($field: tt) $(: $( $marker: ident )* )? );* $(;)?) => {
        $(
            $crate::pivots_field!($vis, $target, $self_field, $target);
            $crate::from_list_node!($target, $target, $self_field);
        )?
        $(
            $vis struct $name();
            $crate::pivots_field!($vis, $target, $field, $name);
            $crate::from_list_node!($target, $name, $field);
            $(
                $(
                    impl $crate::collections::$marker for $name {}
                )*
            )?

        )*
    };
}
#[cfg(test)]
mod tests {
    extern crate alloc;
    extern crate std;

    use alloc::vec;
    use core::ptr::NonNull;
    use std::println;

    use static_assertions::const_assert_eq;

    use crate::collections::{BorrowingLinkedList, UnlinkableListGuard};
    use crate::collections::{LinkedList, ListNode};

    fn has_data(node: Option<&ListNode<TestStruct>>, value: usize) -> bool {
        if node.is_none() {
            return false;
        }
        node.unwrap().value == value
    }

    list_node! {
        pub TestStruct(node);
        AnotherStruct(one)
    }
    pub struct TestStruct {
        node: ListNode<TestStruct>,
        one: ListNode<AnotherStruct>,
        value: usize,
    }
    const_assert_eq!(core::mem::offset_of!(ListNode<TestStruct>, next), 0);

    impl TestStruct {
        pub fn new(value: usize) -> Self {
            unsafe {
                Self {
                    node: ListNode::empty(),
                    one: ListNode::empty(),
                    value,
                }
            }
        }
    }

    #[test]
    fn push_back_test() {
        let mut list = LinkedList::<TestStruct>::empty();
        unsafe {
            let mut nodes = vec![
                TestStruct::new(12),
                TestStruct::new(13),
                TestStruct::new(14),
            ];
            for node in nodes.iter_mut() {
                list.push_back(node.as_node().as_mut());
            }
            let mut iter = unsafe { list.iter() };
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
    }

    #[test]
    fn push_front_test() {
        let mut list = LinkedList::<TestStruct>::empty();
        unsafe {
            let nodes = vec![
                TestStruct::new(12),
                TestStruct::new(13),
                TestStruct::new(14),
            ];
            for node in nodes.iter() {
                list.push_front(node.as_node().as_mut());
            }
            let mut iter = list.iter();
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
        unsafe {
            list.clear();
            assert!(list.is_empty());
        }
    }

    #[test]
    fn push_back_front_test() {
        let mut list = LinkedList::<TestStruct>::empty();
        unsafe {
            let nodes = vec![
                TestStruct::new(12),
                TestStruct::new(13),
                TestStruct::new(14),
                TestStruct::new(15),
                TestStruct::new(16),
            ];
            let mut iter = nodes.iter();
            list.push_back(iter.next().unwrap().as_node().as_mut());
            list.push_front(iter.next().unwrap().as_node().as_mut());
            list.push_back(iter.next().unwrap().as_node().as_mut());
            list.push_back(iter.next().unwrap().as_node().as_mut());
            list.push_front(iter.next().unwrap().as_node().as_mut());
            let mut iter = list.iter();
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
            let guard = list.link_guard();
            let iter = list.iter_mut().skip_while(|node| node.value > 0);
            let another = guard.collect(iter);
        }
        unsafe {
            list.clear();
            assert!(list.is_empty());
        }
    }

    #[test]
    fn splice_test() {
        let mut list = LinkedList::<TestStruct>::empty();
        unsafe {
            let mut nodes = vec![
                TestStruct::new(12),
                TestStruct::new(13),
                TestStruct::new(14),
                TestStruct::new(15),
            ];
            //each node should support next/prevent invariant; list_node! macro to such stuff
            nodes
                .iter_mut()
                .for_each(|node| node.as_node().as_mut().self_link());
            let mut first = NonNull::from(nodes.get_mut(0).unwrap());
            let mut last = NonNull::from(nodes.get_mut(2).unwrap());
            let mut any = NonNull::from(nodes.get_mut(1).unwrap());
            // list.splice(first.as_mut().as_head());
            // assert!(!list.is_empty() && list.first.eq(&list.last));
            // list.push_front(last.as_mut());
            // let any_list = any.as_mut().as_head();
            // list.splice(any_list);
            // assert!(any.as_mut().next.as_mut().data().eq(&14) && any.as_mut().prev.as_mut().data().eq(&12));
            // let mut forth = NonNull::from(nodes.get_mut(3).unwrap());
            // let other_list = forth.as_mut().as_head();
            // first.as_mut().as_head().splice(other_list);
            // assert!(first.as_mut().next.as_mut().data().eq(&15) && last.as_mut().prev.as_mut().data().eq(&15));
        }
    }

    #[test]
    fn mutability_iter_test() {
        let mut list = LinkedList::<TestStruct>::empty();
        unsafe {
            let nodes = vec![
                TestStruct::new(12),
                TestStruct::new(13),
                TestStruct::new(14),
            ];
            for node in nodes.iter() {
                list.push_back(node.as_node().as_mut());
            }
            let mut iter = list.iter_mut();
            assert!(iter.unlink_watched().is_none());
            let node_value = iter.next().unwrap();
            let node_option = iter.unlink_watched();
            assert!(node_option.is_some());
            assert_eq!(node_value.value, node_option.unwrap().value);
            assert!(iter.unlink_watched().is_none());
        }
    }

    #[test]
    fn collection_test() {
        unsafe {
            let nodes = vec![
                TestStruct::new(1),
                TestStruct::new(2),
                TestStruct::new(3),
                TestStruct::new(4),
            ];
            let mut list = LinkedList::<TestStruct>::empty();

            for node in nodes.iter() {
                list.push_back(node.as_node().as_mut());
            }
            let guard = list.link_guard();
            let iter =
                list.iter_mut().skip_while(|node| node.value < 3).take(1);
            let target = guard.collect(iter);
            let mut test_iter = target.iter().limit();
            assert_eq!(test_iter.next().unwrap().value, 3);
            assert!(test_iter.next().is_none());
        }
    }

    #[test]
    fn removing_test() {
        let mut list = LinkedList::<TestStruct>::empty();
        unsafe {
            let nodes = vec![TestStruct::new(12), TestStruct::new(13)];
            for node in nodes.iter() {
                list.push_back(node.as_node().as_mut());
            }
            assert_eq!(12, list.remove_first().unwrap().value);
            assert_eq!(13, list.remove_first().unwrap().value);
            assert!(list.remove_first().is_none());
        }
        let _ = list.iter();
    }

    #[test]
    fn limit_test() {
        let mut list = LinkedList::<TestStruct>::empty();
    }

    #[test]
    fn conversation_test() {

        // let node = ListNode::new(data);
        // TinyListNode::from(node);
    }
}
