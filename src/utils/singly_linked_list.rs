use core::ptr::NonNull;
use core::marker::PhantomData;
use core::mem;

use core::ops::Deref;
use core::ops::DerefMut;
use static_assertions::const_assert_eq;
use crate::utils::{BorrowingLinkedList, ListNode, ListNodeData, ListNodePivot, ListNodePivots, TinyListNodeData, UnlinkableListGuard};

#[repr(C)]
pub struct TinyListNode<T: Sized> {
    next: Option<NonNull<TinyListNode<T>>>,
    _marker: PhantomData<T>,
}

//SimpleListNodeData is automatically implemented for ListNodeData
unsafe impl<T: ListNodeData> TinyListNodeData for T {
    type Item = T::Item;

    fn pivot(&self) -> NonNull<ListNodePivot<T>> {
        unsafe { mem::transmute(self.pivots().as_mut().prev) }
    }

    fn from(node: NonNull<TinyListNode<Self>>) -> NonNull<Self::Item> {
        const_assert_eq!()
        unsafe {mem::transmute(node.as_mut().)}
    }
}

impl<T: ListNodeData> ListNodePivots<T> {
    pub fn wrap_to_simple(&self) -> &TinyListNode<T> {
        unsafe { mem::transmute::<&NonNull<ListNode<T>>, &TinyListNode<T>>(&self.prev) }
    }
    pub fn wrap_mut_to_simple(&mut self) -> &mut TinyListNode<T> {
        unsafe { mem::transmute::<&mut NonNull<ListNode<T>>, &mut TinyListNode<T>>(&mut self.prev) }
    }
}

impl<T: TinyListNodeData> ListNodePivot<T> {
    pub fn wrap_simple(&self) -> &TinyListNode<T> {
        unsafe { mem::transmute(self) }
    }
    pub fn wrap_mut_simple(&mut self) -> &mut TinyListNode<T> {
        unsafe { mem::transmute(self) }
    }
}

impl<T: TinyListNodeData> TinyListNode<T> {
    pub fn unwrap_simple(&self) -> &T {
        unsafe { mem::transmute(self) }
    }
    pub fn unwrap_mut_simple(&self) -> &mut T {
        unsafe { mem::transmute(self) }
    }
}

impl<T: ListNodeData> TinyListNode<T> {
    pub fn unwrap(&self) -> &T {
        unsafe {
            let pivots = self.cast_pivots();
            (&*pivots).unwrap()
        }
    }
    pub fn unwrap_mut(&self) -> &T {
        unsafe {
            let pivots = self.cast_pivots();
            (&mut *pivots).unwrap_mut()
        }
    }
    unsafe fn cast_pivots(&self) -> *mut ListNodePivots<T> {
        let byte_offset = mem::offset_of!(ListNodePivots, prev);
        (self as *const ListNodePivot<T>)
            .byte_sub(byte_offset)
            .cast::<ListNodePivots<T>>()
            .cast_mut()
    }
}

impl<T: ListNodeData> TinyListNode<T> {
    pub fn cast_node(&self) -> &ListNode<T> {
        unsafe { self.pivots().as_ref().wrap() }
    }
    pub fn cast_node_mut(&mut self) -> &mut ListNode<T> {
        unsafe { self.pivots().as_mut().wrap_mut() }
    }
}

impl<T: ListNodeData> ListNode<T> {
    pub fn cast_node(&self) -> &TinyListNode<T> {
        unsafe { self.pivots().as_mut().wrap_to_simple() }
    }
    pub fn cast_node_mut(&self) -> &mut TinyListNode<T> {
        unsafe { self.pivots().as_mut().wrap_mut_to_simple() }
    }
}

impl<T: TinyListNodeData> TinyListNode<T> {
    pub const fn wrap_data(data: T) -> Self {
        Self {
            data,
        }
    }
    pub fn data(&self) -> &T {
        &self.data
    }
    pub fn set_next(&mut self, next: &mut TinyListNode<T>) {
        self.pivot().set_next(Some(next));
    }
    pub fn remove_next(&mut self) {
        self.pivot().set_next(None);
    }
}

impl<T: TinyListNodeData> Deref for TinyListNode<T> {
    type Target = T;

    fn deref(&self) -> &Self::Target {
        &self.data
    }
}

impl<T: TinyListNodeData> DerefMut for TinyListNode<T> {
    fn deref_mut(&mut self) -> &mut Self::Target {
        &mut self.data
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
    type Item = &'a mut TinyListNode<T>;

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
        TinyLinkedList {
            first: None,
            last: None,
            _marker: PhantomData,
        }
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
}

impl<'a, T: TinyListNodeData> TinyLinkedList<'a, T> {
    pub fn is_empty(&self) -> bool {
        self.first.is_none()
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
    pub fn size(&self) -> usize {
        self.iter()
            .count()
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
    use core::ptr::NonNull;
    use crate::utils::{BorrowingLinkedList, TinyLinkedList, TinyListNode};


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
        let mut list = TinyLinkedList::<usize>::empty();
        unsafe {
            let numbers: Vec<TinyListNode<usize>> = vec!(
                TinyListNode::wrap_data(10),
                TinyListNode::wrap_data(11),
                TinyListNode::wrap_data(12),
                TinyListNode::wrap_data(13),
                TinyListNode::wrap_data(14),
            );
            for number in numbers[0..3].iter() {
                list.push_back(NonNull::from(number).as_mut());
            }
            let mut other_list = TinyLinkedList::<usize>::empty();
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