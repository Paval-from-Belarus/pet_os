use core::ptr::NonNull;

pub use singly_linked_list::{TinyLinkedList, TinyListNode};
pub use doubly_linked_list::{LinkedList, ListNode};

mod hash_table;
mod doubly_linked_list;
mod singly_linked_list;

pub type HashCode = u32;

pub trait FastHasher: core::hash::Hasher {
    fn fast_hash(&self) -> HashCode;
}

pub trait HashKey: Eq {
    fn hash_code(&self) -> HashCode;
}

/// The basic concept of HashData is data by itself storing key
pub trait HashData<T: HashKey> {
    fn key(&self) -> &T;
    fn equals_by_key(&self, key: &T) -> bool {
        self.key().eq(key)
    }
}

pub trait BorrowingLinkedList<'a> {
    type Item: 'a;
    fn empty() -> Self;
    fn push_back(&mut self, node: &'a mut Self::Item);
    fn push_front(&mut self, node: &'a mut Self::Item);
    fn remove(&mut self, node: &'a mut Self::Item);
    fn is_empty(&self) -> bool;
}

pub trait UnlinkableListGuard<'a, T: BorrowingLinkedList<'a>>: Sized {
    fn parent(&self) -> NonNull<T>;
    unsafe fn collect<I: IntoIterator<Item=&'a mut T::Item>>(mut self, iter: I) -> T {
        let owner = self.parent().as_mut();
        let mut target = T::empty();
        for node in iter {
            if owner.is_empty() {
                break;
            }
            let mut raw_node = NonNull::from(node);
            owner.remove(raw_node.as_mut());
            target.push_back(raw_node.as_mut());
        }
        target
    }
    unsafe fn collect_map<I: IntoIterator<Item=&'a mut T::Item>,
        S: 'a, R: BorrowingLinkedList<'a, Item=S>, F>
    (self, iter: I, mut map: F) -> R
     where F: FnMut(&'a mut T::Item) -> &'a mut S {
        let owner = self.parent().as_mut();
        let mut target = R::empty();
        for node in iter {
            if owner.is_empty() {
                break;
            }
            let mut raw_node = NonNull::from(node);
            owner.remove(raw_node.as_mut());
            let mapped_node = map(raw_node.as_mut());
            target.push_back(mapped_node);
        }
        target
    }
}

pub unsafe trait DanglingData {}

pub unsafe trait ListNodeData: Sized {
    type Item;
    fn from(node: NonNull<ListNode<Self>>) -> NonNull<Self::Item>;
}

pub unsafe trait TinyListNodeData: Sized {
    type Item;
    fn from(node: NonNull<TinyListNode<Self>>) -> NonNull<Self::Item>;
}

unsafe impl<T: ListNodeData> TinyListNodeData for T {
    type Item = T::Item;
    fn from(node: NonNull<TinyListNode<Self>>) -> NonNull<Self::Item> {
        let pivot = unsafe { core::mem::transmute::<NonNull<TinyListNode<T>>, NonNull<ListNode<T>>>(node) };
        ListNodeData::from(pivot)
    }
}
