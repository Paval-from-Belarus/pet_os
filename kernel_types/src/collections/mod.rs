use core::ptr;
use core::ptr::NonNull;

pub use singly_linked_list::{TinyLinkedList, TinyListNode};
pub use doubly_linked_list::{LinkedList, ListNode};
pub use hash_table::{HashTable, PolynomialHasher};

mod hash_table;
mod doubly_linked_list;
mod singly_linked_list;


#[macro_export]
macro_rules! tiny_list_node {
    ($vis: vis $target: ident ($field: tt)) => {
        paste::paste!{
            impl $target {
                $vis fn [<as_ $field>](&self) -> core::ptr::NonNull<TinyListNode<$target>> {
                    core::ptr::NonNull::from(&self.$field)
                }
                $vis fn from_node<T: $crate::utils::TinyListNodeData<Item=$target>>(node: core::ptr::NonNull<TinyListNode<T>>) -> core::ptr::NonNull<$target> {
                    $crate::utils::TinyListNodeData::from_unchecked(node)
                }
                $vis fn from_mut<T: $crate::utils::TinyListNodeData<Item=$target>>(node: &mut TinyListNode<T>) -> &mut $target {
                    unsafe { $crate::utils::TinyListNodeData::from_unchecked(core::ptr::NonNull::from(node)).as_mut() }
                }
                $vis fn from_ref<T: $crate::utils::TinyListNodeData<Item=$target>>(node: &TinyListNode<T>) -> & $target {
                    unsafe {$crate::utils::TinyListNodeData::from_unchecked(core::ptr::NonNull::from(node)).as_ref() }
                }
            }
        }
        unsafe impl $crate::utils::TinyListNodeData for $target {
            type Item = $target;
            fn from(node: core::ptr::NonNull<TinyListNode<Self>>) -> core::ptr::NonNull<Self::Item> {
                let pointer = node.as_ptr();
                let field_offset = core::mem::offset_of!($target, $field);
                let struct_offset = unsafe { (pointer as *mut u8).byte_sub(field_offset) };
                let value = unsafe { core::mem::transmute::<*mut u8, *mut $target>(struct_offset) };
                unsafe {core::ptr::NonNull::new_unchecked(value)}
        }
    }
    };
}

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
    unsafe fn collect<I: IntoIterator<Item=&'a mut T::Item>>(self, iter: I) -> T {
        self.collect_map(iter, |node| node)
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

/// Mnemonic trait that allow any kind of list node be independent (without head element of list).
/// This trait (by ideas) should export some methods
/// # Safety
/// Please doesn't no implement such trait manualy. Prefer macro. Moreover, it can lead mistake by list organization
/// Be carefull, when use this trait
pub unsafe trait DanglingData {}

/// Conventional trait allowing any struct be list node in doubly linked list (`LinkedList`)
/// # Safety
/// Be careful using this trait. It violates rust memory rules while unappropriate using

pub unsafe trait ListNodeData: Sized {
    type Item;
    fn from_node(node: &mut ListNode<Self>) -> &mut Self::Item;
    unsafe fn from_node_unchecked(mut raw_node: NonNull<ListNode<Self>>) -> NonNull<Self::Item> {
        let node = Self::from_node(raw_node.as_mut());
        NonNull::from(node)
    }
}

/// As `ListNodeData` allows any struct to be list node in singly linked list (`TinyLinkedList`)
/// # Safety
/// Violate rust memory rules allowing several mutable reference (conceptually, using any linked list)
/// You should manually control the references
pub unsafe trait TinyListNodeData: Sized {
    type Item;
    fn from_node(node: &mut TinyListNode<Self>) -> &mut Self::Item;
    unsafe fn from_node_unchecked(mut raw_node: NonNull<TinyListNode<Self>>) -> NonNull<Self::Item> {
        let node = Self::from_node(raw_node.as_mut());
        NonNull::from(node)
    }
}

unsafe impl<T: ListNodeData> TinyListNodeData for T {
    type Item = T::Item;
    fn from_node(node: &mut TinyListNode<Self>) -> &mut Self::Item {
        let pivot = unsafe { core::mem::transmute::<&mut TinyListNode<T>, &mut ListNode<T>>(node) };
        ListNodeData::from_node(pivot)
    }
}
