use crate::memory::{PageRec};
use core::{ptr};

use core::marker::PhantomData;
use core::ops::{Deref, DerefMut};
use core::ptr::{NonNull};
use core::slice::IterMut;
use crate::memory::atomics::SpinLock;

pub enum ZoneType {
    Usable,
    Device,
}

///The main purpose of this struct is to map available memory space to InfoRec
///Generaly is used to collect <code>PageRec</code> ― caller pass entries to this collection
pub struct MemoryMapper {
    //array of PageRec
}


#[repr(C)]
pub struct ListNode<T> {
    next: NonNull<ListNode<T>>,
    prev: NonNull<ListNode<T>>,
    //consider to add spinlock
    data: T,
}

impl<T:> ListNode<T> {
    //without pointers
    pub unsafe fn wrap_data(data: T) -> ListNode<T> {
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
    pub fn next_mut(&mut self) -> &mut ListNode<T> {
        unsafe { self.next.as_mut() }
    }
    pub fn prev(&self) -> &ListNode<T> {
        unsafe { self.prev.as_ref() }
    }
    pub fn prev_mut(&mut self) -> &mut ListNode<T> {
        unsafe { self.prev.as_mut() }
    }
    fn set_next(&mut self, next: &mut ListNode<T>) {
        self.next = NonNull::from(next);
    }
    fn set_prev(&mut self, prev: &mut ListNode<T>) {
        self.prev = NonNull::from(prev);
    }
    //save old links
    pub fn relink(&mut self, new_next: &mut ListNode<T>) {
        //unlink old
        let old_next = unsafe { self.next.as_mut() };
        let old_prev = unsafe { self.prev.as_mut() };
        old_next.prev = self.prev;
        old_prev.next = self.next;
        //self-link because node cannot be in illegal state
        unsafe { self.self_link() };
        //link new
        let self_ptr = unsafe { self.as_mut_ptr() };
        if ptr::eq(new_next, self_ptr) {
            return; //already done with self_link method
        }
        let prev = unsafe { new_next.prev.as_mut() };
        unsafe {
            self.prev = new_next.prev;
            self.next = NonNull::new_unchecked(new_next);
            new_next.prev = NonNull::new_unchecked(self_ptr);
            prev.next = NonNull::new_unchecked(self_ptr);
        }
    }
    //link next in circular list
    pub fn link_next(&mut self, new_next: &mut ListNode<T>) {
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


#[repr(C)]
pub struct InfiniteLinkedList<T: Sized> {
    first: NonNull<ListNode<T>>,
    last: NonNull<ListNode<T>>,
    size: usize,
    spin: SpinLock,
}

impl<T: Sized> InfiniteLinkedList<T> {
    pub fn empty() -> InfiniteLinkedList<T> {
        InfiniteLinkedList {
            spin: SpinLock::new(),
            first: NonNull::dangling(),
            last: NonNull::dangling(),
            size: 0,
        }
    }
    pub unsafe fn write_empty(dest: *mut InfiniteLinkedList<T>) {
        let header_ptr = NonNull::new_unchecked(dest as *mut ListNode<T>);
        ptr::write(dest, InfiniteLinkedList {
            first: header_ptr,
            last: header_ptr,
            size: 0,
            spin: SpinLock::new(),
        });
    }
    //this method remove links from node
    pub unsafe fn wrap_node(mut raw_node: NonNull<ListNode<T>>) -> InfiniteLinkedList<T> {
        raw_node.as_mut().self_link();
        InfiniteLinkedList {
            first: raw_node,
            last: raw_node,
            size: 1,
            spin: SpinLock::new(),
        }
    }
    pub unsafe fn clear(&mut self) {
        self.spin.acquire();
        self.first = NonNull::dangling();
        self.last = NonNull::dangling();
        self.size = 0;
        self.spin.release();
    }
    pub fn iter(&self) -> ListIterator<'_, T> {
        debug_assert!(!self.is_empty());
        ListIterator::new(self)
    }
    pub fn iter_mut(&mut self) -> MutListIterator<'_, T> {
        debug_assert!(!self.is_empty());
        MutListIterator::new(self)
    }
    pub fn iter_with_limit(&mut self) {
        todo!()
    }
    pub fn is_empty(&self) -> bool {
        self.size == 0
    }
    pub fn size(&self) -> usize {
        self.size
    }
    pub fn relink_first(&mut self, other: &mut InfiniteLinkedList<T>) -> Result<NonNull<ListNode<T>>, ()> {
        self.spin.acquire();
        if self.is_empty() {
            self.spin.release();
            return Err(());
        }
        other.spin.acquire();
        // let first = self.first;
        // unsafe { first.as_mut().relink() }
        other.spin.release();
        self.spin.release();
        todo!()
    }
    pub fn relink_last(&mut self, _other: &mut InfiniteLinkedList<T>) -> Result<NonNull<ListNode<T>>, ()> {
        todo!()
    }
    pub unsafe fn push_back(&mut self, raw_node: NonNull<ListNode<T>>) {
        self.spin.acquire();
        if self.is_empty() {
            self.first_link(raw_node);
            self.spin.release();
            return;
        }
        self.insert_after_last(raw_node);
        self.last = raw_node;//we already changed last in list
        self.size += 1;
        self.spin.release();
    }
    pub unsafe fn push_front(&mut self, raw_node: NonNull<ListNode<T>>) {
        self.spin.acquire();
        if self.is_empty() {
            self.first_link(raw_node);
            self.spin.release();
            return;
        }
        self.insert_after_last(raw_node);
        self.first = raw_node;
        self.size += 1;
        self.spin.release();
    }
    //cause data leaks with node
    unsafe fn insert_after_last(&mut self, mut node: NonNull<ListNode<T>>) {
        let last = self.last.as_mut();
        let first = self.first.as_mut();
        let node = node.as_mut();
        node.set_prev(last);
        node.set_next(first);
        last.set_next(node);
        first.set_prev(node);
    }
    //can cause data leaks with inappropriate using
    unsafe fn first_link(&mut self, mut raw_node: NonNull<ListNode<T>>) {
        self.size = 1;
        self.first = raw_node;
        self.last = raw_node;
        raw_node.as_mut().self_link();
    }


    //the method is used by iterator to unlinked element
    unsafe fn unlink_node(&mut self, node: NonNull<ListNode<T>>) {
        debug_assert!(!self.is_empty(), "Impossible to unlink from empty list");
        self.size -= 1; //the size of non empty list is always greater then zero
        if self.is_empty() {
            self.first = NonNull::dangling();
            self.last = NonNull::dangling();
            return;
        }
        //relink header, because node by self has no relation with header
        //it's legal to use other values from node, because list holds not single element
        //in case of non single element, no node is self-linked
        if ptr::eq(self.first.as_ptr(), node.as_ptr()) {
            self.first = unsafe { node.as_ref().next };
            // return //because other case is impossible
        }
        if ptr::eq(self.last.as_ptr(), node.as_ptr()) {
            self.last = unsafe { node.as_ref().prev };
        }
    }
}

pub struct ListIterator<'a, T> {
    next: NonNull<ListNode<T>>,
    prev: NonNull<ListNode<T>>,
    //the next value to be emitted by forward iterator
    is_empty: bool,
    list_lock: &'a SpinLock,
    _marker: PhantomData<&'a T>,
}

impl<'a, T> ListIterator<'a, T> {
    pub fn new(list: &'a InfiniteLinkedList<T>) -> Self {
        let list_lock = &list.spin;
        list_lock.acquire();
        if list.is_empty() {
            list_lock.release();
            ListIterator {
                next: NonNull::dangling(),
                prev: NonNull::dangling(),
                is_empty: true,
                list_lock,
                _marker: PhantomData,
            }
        } else {
            ListIterator {
                next: list.first,
                prev: list.last,
                is_empty: false,
                list_lock,
                _marker: PhantomData,
            }
        }
    }
}

impl<'a, T> Drop for ListIterator<'a, T> {
    fn drop(&mut self) {
        if !self.is_empty {
            self.list_lock.release();
        }
    }
}

//attention that iterator never stops
impl<'a, T> Iterator for ListIterator<'a, T> {
    type Item = &'a T;
    #[inline]
    fn next(&mut self) -> Option<Self::Item> {
        if self.is_empty {
            return None;
        }
        let current = unsafe { self.next.as_ref() };
        self.next = current.next;
        Some(current.data())
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
        Some(current.data())
    }
}

//this iterator always acquire control under the collection
//please, consider doesn't keep such iterator alive
pub struct MutListIterator<'a, T> {
    next: NonNull<ListNode<T>>,
    prev: NonNull<ListNode<T>>,
    //the iterator acquire ownership under list
    parent: &'a mut InfiniteLinkedList<T>,
    last_watched: Option<NonNull<ListNode<T>>>,
    _marker: PhantomData<&'a T>,
}

impl<'a, T> MutListIterator<'a, T> {
    fn new(parent: &'a mut InfiniteLinkedList<T>) -> Self {
        parent.spin.acquire();
        MutListIterator {
            next: parent.first,
            prev: parent.last,
            last_watched: None,
            parent,
            _marker: PhantomData,
        }
    }
    ///Such as iterator is lazy primitive, this method unlink previously watched element
    pub fn unlink_watched(&mut self) -> Option<NonNull<ListNode<T>>> {
        return match self.last_watched {
            None => None, //last watched mean that parent is empty or no next/back_next method is invoked
            Some(mut watched) => unsafe {
                self.parent.unlink_node(watched);
                let free_node = watched.as_mut();
                if self.parent.is_empty() {
                    //the check of emptiness is always performs with with parent
                    //access to next, prev is forbidden
                    self.next = NonNull::dangling();
                    self.prev = NonNull::dangling();
                    free_node.self_link();
                } else {
                    //the self.next and self.prev are already holds valid
                    free_node.relink(watched.as_mut());
                }
                self.last_watched = None;
                Some(watched)
            }
        };
    }
    pub unsafe fn unlink_watched_unchecked(&mut self) -> NonNull<ListNode<T>> {
        debug_assert!(self.last_watched.is_some());
        match self.unlink_watched() {
            None => unreachable!("unlink unwatched failed"),
            Some(last_watched) => last_watched
        }
    }
}

impl<T> Drop for MutListIterator<'_, T> {
    fn drop(&mut self) {
        self.parent.spin.release();
    }
}

impl<'a, T> Iterator for MutListIterator<'a, T> {
    type Item = &'a mut T;

    fn next(&mut self) -> Option<Self::Item> {
        if self.parent.is_empty() {
            return None;
        }
        self.last_watched = Some(self.next);
        let current = unsafe { self.next.as_mut() };
        self.next = current.next;
        Some(current.data_mut())
    }
}

impl<'a, T> DoubleEndedIterator for MutListIterator<'a, T> {
    fn next_back(&mut self) -> Option<Self::Item> {
        if self.parent.is_empty() {
            return None;
        }
        self.last_watched = Some(self.prev);
        let current = unsafe { self.prev.as_mut() };
        self.prev = current.next;
        Some(current.data_mut())
    }
}


///The sequence of free pages
///Simply, it's a header of pages
pub struct PageList {
    head: *mut PageRec,
    tail: *mut PageRec,
    items_cnt: usize,
}

pub struct Iter {
    front_pivot: Option<&'static PageRec>,
    back_pivot: Option<&'static PageRec>,
}

impl IntoIterator for PageList {
    type Item = &'static PageRec;
    type IntoIter = Iter;
    fn into_iter(self) -> Self::IntoIter {
        self.iter()
    }
}

// impl FromIterator<&'static mut PageRec> for PageList {
//     fn from_iter<T: IntoIterator<Item=&'static mut PageRec>>(iter: T) -> Self {
//         let mut list = PageList::empty();
//         let old = iter.into_iter().cloned();
//             // .for_each(|rec| list.push_back(rec));
//         return list;
//     }
// }

impl Iterator for Iter {
    type Item = &'static PageRec;
    fn next(&mut self) -> Option<Self::Item> {
        let next = self.front_pivot;
        let option = next.and_then(|rec| rec.next_ref());
        self.front_pivot = option.map(|rec| rec as &PageRec);
        return next;
    }
}

impl DoubleEndedIterator for Iter {
    fn next_back(&mut self) -> Option<Self::Item> {
        let prev = self.back_pivot;
        let option = prev.and_then(|rec| rec.prev_ref());
        self.back_pivot = option.map(PageRec::read_only);
        return prev;
    }
}

impl PageList {
    pub fn empty() -> PageList {
        PageList {
            head: ptr::null_mut(),
            tail: ptr::null_mut(),
            items_cnt: 0,
        }
    }
    pub fn new(
        header: &'static mut PageRec,
        option_tail: Option<&'static mut PageRec>,
    ) -> PageList {
        let items_cnt: usize = 1;
        let header_ptr: *mut PageRec = header;
        let tail_ptr: *mut PageRec;
        if let Some(tail) = option_tail {
            tail_ptr = tail;
        } else {
            tail_ptr = header_ptr;
        }
        PageList {
            head: header_ptr,
            tail: tail_ptr,
            items_cnt,
        }
    }
    pub fn first(&self) -> Option<&'static PageRec> {
        return self.first_mut().map(PageRec::read_only);
    }
    pub fn last(&self) -> Option<&'static PageRec> {
        return self.last_mut().map(PageRec::read_only);
    }

    pub fn push_back(&mut self, page: &'static mut PageRec) {
        PageList::clear_links(page);
        if let Some(tail) = self.last_mut() {
            tail.set_next(page);
            page.set_prev(tail);
            self.tail = page;
            self.items_cnt += 1;
        } else {
            self.init_empty_list(page);
        }
    }
    pub fn push_front(&mut self, page: &'static mut PageRec) {
        PageList::clear_links(page);
        if let Some(head) = self.first_mut() {
            head.set_prev(page);
            page.set_next(head);
            self.head = page;
            self.items_cnt += 1;
        } else {
            self.init_empty_list(page);
        }
    }
    pub fn size(&self) -> usize {
        self.items_cnt
    }
    pub fn is_empty(&self) -> bool {
        self.size() == 0
    }
    pub fn add_all(&mut self, _other: PageList) {}
    ///The method excludes elements specified by [from_index; to_index) range
    pub fn split_list(&mut self, from_index: usize, to_index: usize) -> PageList {
        if from_index >= self.size() || self.is_empty() {
            return PageList::empty();
        }
        let to_index = core::cmp::min(to_index, self.size());
        let mut list = PageList::empty();
        for page_rec in self.iter_mut().skip(from_index).take(to_index) {
            list.push_back(self.pull(page_rec));
        }
        // for page_rec in rest_tail.next().into_iter()
        return PageList::empty();
    }
    pub fn iter(&self) -> Iter {
        let front_pivot = self.first();
        let back_pivot = self.last();
        Iter {
            front_pivot,
            back_pivot,
        }
    }
    pub fn iter_mut(&mut self) -> IterMut<'static, PageRec> {
        todo!()
    }
    fn pull(&mut self, page: &'static mut PageRec) -> &'static mut PageRec {
        //self.lock();
        if let Some(prev) = page.prev_ref() {
            prev.set_next(page.next_ptr());
            if let Some(next) = page.next_ref() {
                next.set_prev(page.prev_ptr());
            }
        } else {
            self.head = page.next_ptr(); //we have already removed header
        }
        if let Some(next) = page.next_ref() {
            next.set_prev(page.prev_ptr());
            if let Some(prev) = page.prev_ref() {
                prev.set_next(page.next_ptr());
            }
        } else {
            self.tail = page.prev_ptr();
        }
        self.items_cnt = core::cmp::max(0, self.items_cnt - 1);
        page
    }
    fn init_empty_list(&mut self, page: &'static mut PageRec) {
        let pointer: *mut PageRec = page;
        self.head = pointer;
        self.tail = pointer;
        self.items_cnt = 1;
    }
    fn first_mut(&self) -> Option<&'static mut PageRec> {
        let result: Option<&mut PageRec>;
        if !self.is_empty() {
            unsafe {
                result = Some(&mut *self.head);
            }
        } else {
            result = None;
        }
        return result;
    }
    fn last_mut(&self) -> Option<&'static mut PageRec> {
        let result: Option<&mut PageRec>;
        if !self.is_empty() {
            unsafe {
                result = Some(&mut *self.tail);
            }
        } else {
            result = None;
        }
        return result;
    }
    fn clear_links(page: &mut PageRec) {
        page.set_prev(ptr::null_mut());
        page.set_next(ptr::null_mut());
    }
}

impl MemoryMapper {
    pub fn get_zone(_zone: ZoneType) {}
}

#[cfg(test)]
mod tests {
    use alloc::vec;
    use core::ptr::NonNull;
    use std::{println};
    use crate::memory::allocators::mapper_list::{InfiniteLinkedList, ListNode};

    #[test]
    fn push_back_test() {
        let mut list = InfiniteLinkedList::<usize>::empty();
        unsafe {
            let mut nodes =
                vec!(ListNode::wrap_data(12),
                     ListNode::wrap_data(13),
                     ListNode::wrap_data(14));
            for node in nodes.iter_mut() {
                list.push_back(NonNull::from(node));
            }
            let mut iter = unsafe { list.iter() };
            assert_eq!(iter.next(), Some(&12));
            assert_eq!(iter.next(), Some(&13));
            assert_eq!(iter.next(), Some(&14));
            assert_eq!(iter.next(), Some(&12));
            assert_eq!(iter.next(), Some(&13));
            println!("forward test passed");
            assert_eq!(iter.next_back(), Some(&14));
            assert_eq!(iter.next_back(), Some(&13));
            assert_eq!(iter.next_back(), Some(&12));
            assert_eq!(iter.next_back(), Some(&14));
            assert_eq!(iter.next_back(), Some(&13));
            println!("backward test passed");
        }
    }

    #[test]
    fn push_front_test() {
        let mut list = InfiniteLinkedList::<usize>::empty();
        unsafe {
            let nodes =
                vec!(ListNode::wrap_data(12),
                     ListNode::wrap_data(13),
                     ListNode::wrap_data(14));
            for node in nodes.iter() {
                list.push_front(NonNull::from(node));
            }
            let mut iter = list.iter();
            assert_eq!(iter.next(), Some(&14));
            assert_eq!(iter.next(), Some(&13));
            assert_eq!(iter.next(), Some(&12));
            assert_eq!(iter.next(), Some(&14));
            assert_eq!(iter.next(), Some(&13));
            println!("forward test passed");
            assert_eq!(iter.next_back(), Some(&12));
            assert_eq!(iter.next_back(), Some(&13));
            assert_eq!(iter.next_back(), Some(&14));
            assert_eq!(iter.next_back(), Some(&12));
            assert_eq!(iter.next_back(), Some(&13));
            println!("backward test passed");
        }
        unsafe {
            list.clear();
            assert!(list.is_empty());
        }
    }

    #[test]
    fn push_back_front_test() {
        let mut list = InfiniteLinkedList::<usize>::empty();
        unsafe {
            let nodes =
                vec!(ListNode::wrap_data(12),
                     ListNode::wrap_data(13),
                     ListNode::wrap_data(14),
                     ListNode::wrap_data(15),
                     ListNode::wrap_data(16));
            let mut iter = nodes.iter();
            list.push_back(NonNull::from(iter.next().unwrap()));
            list.push_front(NonNull::from(iter.next().unwrap()));
            list.push_back(NonNull::from(iter.next().unwrap()));
            list.push_back(NonNull::from(iter.next().unwrap()));
            list.push_front(NonNull::from(iter.next().unwrap()));
            let mut iter = list.iter();
            assert_eq!(iter.next(), Some(&16));
            assert_eq!(iter.next(), Some(&13));
            assert_eq!(iter.next(), Some(&12));
            assert_eq!(iter.next(), Some(&14));
            assert_eq!(iter.next(), Some(&15));
            assert_eq!(iter.next(), Some(&16));
            assert_eq!(iter.next(), Some(&13));
            println!("forward test passed");
            assert_eq!(iter.next_back(), Some(&15));
            assert_eq!(iter.next_back(), Some(&14));
            assert_eq!(iter.next_back(), Some(&12));
            assert_eq!(iter.next_back(), Some(&13));
            assert_eq!(iter.next_back(), Some(&16));
            assert_eq!(iter.next_back(), Some(&15));
            assert_eq!(iter.next_back(), Some(&14));
            println!("backward test passed");
        }
        unsafe {
            list.clear();
            assert!(list.is_empty());
        }
    }

    #[test]
    fn mutability_iter_test() {
        let mut list = InfiniteLinkedList::<usize>::empty();
        unsafe {
            let nodes =
                vec!(ListNode::wrap_data(12),
                     ListNode::wrap_data(13),
                     ListNode::wrap_data(14));
            for node in nodes.iter() {
                list.push_back(NonNull::from(node));
            }
            let mut iter = list.iter_mut();
            assert_eq!(iter.unlink_watched(), None);
            let value = iter.next().unwrap();
            let node = iter.unlink_watched();
            assert!(node.is_some());
            assert_eq!(value, node.unwrap().as_mut().data_mut());
            assert_eq!(iter.unlink_watched(), None);
        }
        assert_eq!(list.size(), 2);
    }
}
