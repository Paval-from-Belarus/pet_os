use crate::memory::{PageRec};
use core::{ ptr};
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

///the access to node is not thread-safe. It's obligatory to upper lever to ensure that all is properly synchronized
#[repr(C)]
pub struct ListNode<'a, T: 'a> {
    next: NonNull<ListNode<'a, T>>,
    prev: NonNull<ListNode<'a, T>>,
    //consider to add spinlock
    data: T,
    marker: PhantomData<&'a T>,
}

#[repr(C)]
pub struct InfiniteLinkedList<'a, T: Sized> {
    first: NonNull<ListNode<'a, T>>,
    last: NonNull<ListNode<'a, T>>,
    size: usize,
    spin: SpinLock,
}

impl<'a, T> ListNode<'a, T> {
    pub fn new(data: T, next: &mut ListNode<'a, T>, prev: &mut ListNode<'a, T>) -> Self {
        ListNode {
            next: NonNull::from(next),
            prev: NonNull::from(prev),
            data,
            marker: PhantomData,
        }
    }
    #[deprecated]
    pub unsafe fn new_unchecked(data: T, next: *mut ListNode<'a, T>, prev: *mut ListNode<'a, T>) -> Self {
        debug_assert!(!next.is_null() && !prev.is_null());
        ListNode::new(data, &mut *next, &mut *prev)
    }
    pub fn next(&self) -> &'a ListNode<T> {
        unsafe { self.next.as_ref() }
    }
    pub fn next_mut(&mut self) -> &'a mut ListNode<T> {
        unsafe { self.next.as_mut() }
    }
    pub fn prev(&self) -> &'a ListNode<T> {
        unsafe { self.prev.as_ref() }
    }
    pub fn prev_mut(&mut self) -> &'a mut ListNode<T> {
        unsafe { self.prev.as_mut() }
    }
    fn set_next(&mut self, next: &'a mut ListNode<T>) {
        self.next = NonNull::from(next);
    }
    fn set_prev(&mut self, prev: &'a mut ListNode<T>) {
        self.prev = NonNull::from(prev);
    }
    pub fn relink(&mut self, new_next: &mut ListNode<'a, T>) {
        //unlink old
        let old_next = unsafe { self.next.as_mut() };
        let old_prev = unsafe { self.prev.as_mut() };
        old_next.prev = self.prev;
        old_prev.next = self.next;
        //link new
        let prev = unsafe { new_next.prev.as_mut() };
        self.prev = new_next.prev;
        self.next = unsafe { NonNull::new_unchecked(new_next) };
        let self_ptr = self as *mut ListNode<T>;
        new_next.prev = unsafe { NonNull::new_unchecked(self_ptr) };
        prev.next = unsafe { NonNull::new_unchecked(self_ptr) };
    }
}

pub fn is_self_linked<T>(node: &ListNode<T>) -> bool {
    ptr::eq(node.next.as_ptr(), node.prev.as_ptr()) && ptr::eq(node.next.as_ptr(), node)
}

impl<T> Deref for ListNode<'_, T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        &self.data
    }
}

impl<T> DerefMut for ListNode<'_, T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.data
    }
}


impl<T: Sized> InfiniteLinkedList<'_, T> {
    pub fn empty() -> Self {
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
    pub unsafe fn iter(&self) -> ListIterator<T> {
        ListIterator::new(self.first, &self.spin)
    }

    pub fn is_empty(&self) -> bool {
        self.size == 0
    }
    pub fn size(&mut self) -> usize {
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
    pub fn relink_last(&mut self, other: &mut InfiniteLinkedList<T>) -> Result<NonNull<ListNode<T>>, ()> {
        todo!()
    }
    pub fn push_back(&mut self, node: NonNull<ListNode<T>>) {}
    pub fn push_front(&mut self, node: NonNull<ListNode<T>>) {}
}

pub struct ListIterator<'a, T> {
    next: &'a ListNode<'a, T>,
    prev: &'a ListNode<'a, T>,
    list_lock: &'a SpinLock,
}

impl<'a, T> ListIterator<'a, T> {
    pub fn new(first: NonNull<ListNode<'a, T>>, list_lock: &'a SpinLock) -> ListIterator<'a, T> {
        let next = unsafe { first.as_ref() };
        list_lock.acquire();
        ListIterator { list_lock, next, prev: next.prev() }
    }
}

impl<'a, T> Drop for ListIterator<'a, T> {
    fn drop(&mut self) {
        self.list_lock.release();
    }
}

//attention that iterator never stops
impl<'a, T> Iterator for ListIterator<'a, T> {
    type Item = &'a ListNode<'a, T>;
    #[inline]
    fn next(&mut self) -> Option<Self::Item> {
        let next = Some(self.next);
        self.prev = self.next;
        self.next = self.next.next();
        next
    }
}

impl<'a, T> DoubleEndedIterator for ListIterator<'a, T> {
    #[inline]
    fn next_back(&mut self) -> Option<Self::Item> {
        let prev = Some(self.prev);
        self.next = self.prev;
        self.prev = self.prev.prev();
        prev
    }
}

pub struct MutListIterator<'a, T> {
    next: &'a mut ListNode<'a, T>,
    prev: &'a mut ListNode<'a, T>,
    list_lock: &'a SpinLock,
    empty: bool,
}

impl<'a, T> MutListIterator<'a, T> {
    pub fn new(mut first: NonNull<ListNode<'a, T>>, list_lock: &'a  SpinLock) -> MutListIterator<'a, T> {
        let next = unsafe { first.as_mut() };
        let prev = unsafe { next.prev.as_mut() };
        list_lock.acquire();
        MutListIterator { empty: true, list_lock, next, prev }
    }
    ///Such as iterator is lazy primitive, this method unlink previously watched element
    pub fn unlink(&mut self) -> Option<InfiniteLinkedList<'a, T>> {
        if self.empty {
            return None;//we cannot construct list with no value
        }
        let mut list = InfiniteLinkedList::empty();

        Some(list)
    }
    pub unsafe fn unlink_unchecked(self) -> InfiniteLinkedList<'a, T> {
        todo!()
    }
}

impl<T> Drop for MutListIterator<'_, T> {
    fn drop(&mut self) {
        self.list_lock.release();
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
    use core::mem::MaybeUninit;
    use crate::memory::{PhysicalAddress, ToVirtualAddress};
    use crate::memory::allocators::mapper_list::InfiniteLinkedList;

    #[test]
    fn import() {
        let mut queue = unsafe { InfiniteLinkedList::<usize>::empty() };
        assert!(queue.is_empty());
        let mut heap_queue_maybe = MaybeUninit::<InfiniteLinkedList<usize>>::uninit();
        unsafe { InfiniteLinkedList::write_empty(heap_queue_maybe.as_mut_ptr()) }
        let heap_queue = unsafe { heap_queue_maybe.assume_init() };
        let is_empty = heap_queue.is_empty();
        // assert!(heap_queue.is_empty());
    }
}
