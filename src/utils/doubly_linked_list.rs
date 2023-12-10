use core::{mem, ptr};
use core::marker::PhantomData;
use core::ops::{Deref, DerefMut};
use core::ptr::NonNull;


#[repr(C)]
pub struct ListNode<T> {
    next: NonNull<ListNode<T>>,
    prev: NonNull<ListNode<T>>,
    data: T,
}
#[macro_export]
macro_rules! list_node {
    ($data:expr) => ({
        {
            let mut node = ListNode::wrap_data($data);
            node.self_link();
            node
        }
    });
}

impl<T:> ListNode<T> {
    //without pointers
    pub const unsafe fn wrap_data(data: T) -> ListNode<T> {
        ListNode {
            next: NonNull::dangling(),
            prev: NonNull::dangling(),
            data,
        }
    }
    pub fn new(data: T, next: &mut ListNode<T>, prev: &mut ListNode<T>) -> Self {
        ListNode {
            next: NonNull::from(next),
            prev: NonNull::from(prev),
            data,
        }
    }
    ///the method
    pub unsafe fn as_head(&mut self) -> &mut LinkedList<T> {
        unsafe { mem::transmute::<&mut ListNode<T>, &mut LinkedList<T>>(self) }
    }
    pub fn data(&self) -> &T {
        &self.data
    }
    pub fn data_mut(&mut self) -> &mut T {
        &mut self.data
    }
    #[deprecated]
    pub unsafe fn new_unchecked(data: T, next: *mut ListNode<T>, prev: *mut ListNode<T>) -> Self {
        debug_assert!(!next.is_null() && !prev.is_null());
        ListNode::new(data, &mut *next, &mut *prev)
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
        //unlink old
        let old_next = unsafe { self.next.as_mut() };
        let old_prev = unsafe { self.prev.as_mut() };
        old_next.prev = self.prev;
        old_prev.next = self.next;
        //self-link because node cannot be in illegal state
        unsafe { self.self_link() };
        //link new
        if let Some(new_next) = new_next_option {
            unsafe {
                let prev = new_next.prev.as_mut();
                let raw_self = NonNull::new_unchecked(self);
                self.prev = new_next.prev;
                self.next = NonNull::new_unchecked(new_next);
                new_next.prev = raw_self;
                prev.next = raw_self;
            }
        }
    }
    //link next in circular list
    fn link_next(&mut self, new_next: &mut ListNode<T>) {
        unsafe {
            new_next.next = self.next;
            new_next.prev = NonNull::new_unchecked(self.as_mut_ptr());
            self.next = NonNull::new_unchecked(new_next.as_mut_ptr());
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
        let self_ptr = self as *mut ListNode<T>;
        unsafe {
            self.next = NonNull::new_unchecked(self_ptr);
            self.prev = NonNull::new_unchecked(self_ptr);
        }
    }
}

pub fn is_self_linked<T>(node: &ListNode<T>) -> bool {
    ptr::eq(node.next.as_ptr(), node.prev.as_ptr()) && ptr::eq(node.next.as_ptr(), node)
}

impl<T> Deref for ListNode<T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        &self.data
    }
}

impl<T> DerefMut for ListNode<T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.data
    }
}

///The list lifetime is not about lifetime of list. But about lifetime of storing data
#[repr(C)]
#[derive(Clone, Copy)]
pub struct LinkedList<'a, T: Sized> {
    first: Option<NonNull<ListNode<T>>>,
    last: Option<NonNull<ListNode<T>>>,
    _marker: PhantomData<&'a mut T>,
}

impl<'a, T: Sized> LinkedList<'a, T> {
    pub fn empty() -> LinkedList<'a, T> {
        LinkedList {
            first: None,
            last: None,
            _marker: PhantomData,
        }
    }
    //this method remove links from node
    pub unsafe fn with_node(node: &'a mut ListNode<T>) -> LinkedList<'a, T> {
        node.self_link();
        let raw_node = NonNull::from(node);
        LinkedList {
            first: Some(raw_node),
            last: Some(raw_node),
            _marker: PhantomData,
        }
    }
    pub unsafe fn clear(&mut self) {
        self.first = None;
        self.last = None;
    }
    pub fn iter(&self) -> ListIterator<'a, T> {
        debug_assert!(!self.is_empty());
        ListIterator::new(self)
    }
    pub fn iter_mut<'b>(&'b mut self) -> MutListIterator<'a, 'b, T> {
        debug_assert!(!self.is_empty());
        MutListIterator::new(self)
    }
    pub fn is_empty(&self) -> bool {
        debug_assert!(self.last.is_some() && self.first.is_some() || self.last.is_none() && self.first.is_none());
        self.first.is_none()
    }
    pub fn splice(&mut self, other: LinkedList<'a, T>) {
        if let Some(first) = other.first && let Some(last) = other.last {
            if self.is_empty() {
                self.first = Some(first);
                self.last = Some(last);
                return;
            }
            unsafe { self.splice_bounds(first, last) };
        } else {
            debug_assert!(other.is_empty());
        }
    }
    //this function assumes the current list is not empty
    unsafe fn splice_bounds(&mut self, mut other_first: NonNull<ListNode<T>>, mut other_last: NonNull<ListNode<T>>) {
        debug_assert!(!self.is_empty());
        if let Some(mut first) = self.first && let Some(mut last) = self.last {
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
    unsafe fn same_as_first(&self, node: NonNull<ListNode<T>>) -> bool {
        if let Some(head) = self.first && let Some(_) = self.last {
            node.eq(&head)
        } else {
            unreachable!("The head is empty");
        }
    }
    ///this method check the given node is same as node
    ///Method failed with empty list
    unsafe fn same_as_last(&self, node: NonNull<ListNode<T>>) -> bool {
        if let Some(_) = self.first && let Some(tail) = self.last {
            node.eq(&tail)
        } else {
            unreachable!("The tail is empty");
        }
    }
    pub fn remove(&mut self, node: &'a mut ListNode<T>) {
        debug_assert!(!self.is_empty());
        let mut raw_node = NonNull::from(node);
        unsafe {
            self.unlink_node(raw_node);
            raw_node.as_mut().relink(None);
        }
    }
    pub fn remove_first(&mut self) -> Option<&'a mut ListNode<T>> {
        match self.first {
            Some(mut first) => unsafe {
                self.remove(first.as_mut());
                Some(first.as_mut())
            }
            None => {
                None
            }
        }
    }
    pub fn push_back(&mut self, node: &mut ListNode<T>) {
        let raw_node = NonNull::from(node);
        unsafe {
            if self.is_empty() {
                self.first_link(raw_node);
                return;
            }
            self.insert_after_last(raw_node);
        }
        self.last = Some(raw_node);//we already changed last in list
    }
    pub fn push_front(&mut self, node: &mut ListNode<T>) {
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
    //cause data leaks with node
    unsafe fn insert_after_last(&mut self, mut raw_node: NonNull<ListNode<T>>) {
        if let Some(mut raw_first) = self.first && let Some(mut raw_last) = self.last {
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
        if let Some(first) = self.first && let Some(last) = self.last {
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
impl<'a, T> IntoIterator for &'a mut LinkedList<'a, T> {
    type Item = &'a ListNode<T>;
    type IntoIter = ListIterator<'a, T>;

    fn into_iter(self) -> Self::IntoIter {
        self.iter()
    }
}

pub struct ListIterator<'a, T> {
    next: NonNull<ListNode<T>>,
    prev: NonNull<ListNode<T>>,
    //the next value to be emitted by forward iterator
    is_empty: bool,
    _marker: PhantomData<&'a T>,
}

impl<'a, T> ListIterator<'a, T> {
    pub fn new(list: &LinkedList<T>) -> Self {
        if let Some(first) = list.first && let Some(last) = list.last {
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
}
//
// impl<'a, T> FromIterator<&'a ListNode<T>> for LinkedList<'a, T> {
//     fn from_iter<S: IntoIterator<Item=&'a ListNode<T>>>(iter: S) -> Self {
//         let mut list = LinkedList::<T>::empty();
//     }
// }

//attention that iterator never stops
impl<'a, T> Iterator for ListIterator<'a, T> {
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

impl<'a, T> DoubleEndedIterator for ListIterator<'a, T> {
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
pub struct MutListIterator<'a, 'b, T> {
    next: Option<NonNull<ListNode<T>>>,
    prev: Option<NonNull<ListNode<T>>>,
    watched: Option<NonNull<ListNode<T>>>,
    parent: &'b mut LinkedList<'a, T>,
    //the iterator acquire ownership under list
    _marker: PhantomData<&'a mut T>,
}

impl<'a, 'b, T> MutListIterator<'a, 'b, T> {
    fn new(parent: &'b mut LinkedList<'a, T>) -> Self {
        MutListIterator {
            next: parent.first,
            prev: parent.last,
            watched: None,
            parent,
            _marker: PhantomData,
        }
    }
    ///Such as iterator is lazy primitive, this method unlink previously watched element
    pub fn unlink_watched(&mut self) -> Option<&'a mut ListNode<T>> {
        let unlinked = match self.watched {
            None => None,//last watched mean that parent is empty or no next/back_next method is invoked
            Some(mut watched) => unsafe {
                self.parent.remove(watched.as_mut());
                if self.parent.is_empty() {
                    self.next = None;
                    self.prev = None;
                    // free_node.self_link() the node is immutable item for caller
                }
                Some(watched.as_mut())
            }
        };
        self.watched = None;
        unlinked
    }
}

impl<'a, 'b, T> Iterator for MutListIterator<'a, 'b, T> {
    type Item = &'b mut ListNode<T>;

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

impl<'a, 'b, T> DoubleEndedIterator for MutListIterator<'a, 'b, T> {
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

#[cfg(test)]
mod tests {
    extern crate std;
    extern crate alloc;

    use alloc::vec;
    use core::ptr::NonNull;
    use std::println;

    use crate::utils::doubly_linked_list::{LinkedList, ListNode};

    fn has_data<T: PartialEq>(node: Option<&ListNode<T>>, value: T) -> bool {
        if node.is_none() {
            return false;
        }
        node.unwrap().data == value
    }

    #[test]
    fn push_back_test() {
        let mut list = LinkedList::<usize>::empty();
        unsafe {
            let mut nodes =
                vec!(ListNode::wrap_data(12),
                     ListNode::wrap_data(13),
                     ListNode::wrap_data(14));
            for node in nodes.iter_mut() {
                list.push_back(NonNull::from(node).as_mut());
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
        let mut list = LinkedList::<usize>::empty();
        unsafe {
            let nodes =
                vec!(ListNode::wrap_data(12),
                     ListNode::wrap_data(13),
                     ListNode::wrap_data(14));
            for node in nodes.iter() {
                list.push_front(NonNull::from(node).as_mut());
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
        let mut list = LinkedList::<usize>::empty();
        unsafe {
            let nodes =
                vec!(ListNode::wrap_data(12),
                     ListNode::wrap_data(13),
                     ListNode::wrap_data(14),
                     ListNode::wrap_data(15),
                     ListNode::wrap_data(16));
            let mut iter = nodes.iter();
            list.push_back(NonNull::from(iter.next().unwrap()).as_mut());
            list.push_front(NonNull::from(iter.next().unwrap()).as_mut());
            list.push_back(NonNull::from(iter.next().unwrap()).as_mut());
            list.push_back(NonNull::from(iter.next().unwrap()).as_mut());
            list.push_front(NonNull::from(iter.next().unwrap()).as_mut());
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
        }
        unsafe {
            list.clear();
            assert!(list.is_empty());
        }
    }

    #[test]
    fn splice_test() {
        let mut list = LinkedList::<usize>::empty();
        unsafe {
            let mut nodes = vec!(
                ListNode::wrap_data(12),
                ListNode::wrap_data(13),
                ListNode::wrap_data(14),
                ListNode::wrap_data(15)
            );
            //each node should support next/prevent invariant; list_node! macro to such stuff
            nodes.iter_mut().for_each(|node| node.self_link());
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
        let mut list = LinkedList::<usize>::empty();
        unsafe {
            let nodes =
                vec!(ListNode::wrap_data(12),
                     ListNode::wrap_data(13),
                     ListNode::wrap_data(14));
            for node in nodes.iter() {
                list.push_back(NonNull::from(node).as_mut());
            }
            let mut iter = list.iter_mut();
            assert!(iter.unlink_watched().is_none());
            let value = iter.next().unwrap();
            let node = iter.unlink_watched();
            assert!(node.is_some());
            assert_eq!(value.data_mut(), node.unwrap().data_mut());
            assert!(iter.unlink_watched().is_none());
        }
    }

    #[test]
    fn collection_test() {
        let mut list = LinkedList::<usize>::empty();
        unsafe {
            let nodes =
                vec!(ListNode::wrap_data(12),
                     ListNode::wrap_data(13),
                     ListNode::wrap_data(14));
            for node in nodes.iter() {
                list.push_back(NonNull::from(node).as_mut());
            }
        }
    }

    #[test]
    fn removing_test() {
        let mut list = LinkedList::<usize>::empty();
        unsafe {
            let nodes =
                vec!(ListNode::wrap_data(12),
                     ListNode::wrap_data(13));
            for node in nodes.iter() {
                list.push_back(NonNull::from(node).as_mut());
            }
            assert_eq!(&12, list.remove_first().unwrap().data());
            assert_eq!(&13, list.remove_first().unwrap().data());
            assert!(list.remove_first().is_none());
        }
    }
}
