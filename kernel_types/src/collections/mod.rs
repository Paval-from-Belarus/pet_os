use core::ptr::NonNull;

pub use doubly_linked_list::{LinkedList, ListNode};
pub use hash_table::{HashTable, PolynomialHasher};
pub use singly_linked_list::{TinyLinkedList, TinyListNode};

mod doubly_linked_list;
mod hash_table;
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
pub trait HashData {
    //The lifetime to specify how much time key is living
    type Item<'a>: HashKey;
    fn key<'a>(&self) -> &Self::Item<'a>;
    fn equals_by_key<'a, K>(&self, other_key: &K) -> bool
    where
        K: HashKey,
        Self: HashData<Item<'a> = K>,
    {
        self.key().eq(other_key)
    }
}

#[cfg(any(target_pointer_width = "32", target_pointer_width = "64"))]
impl HashKey for usize {
    fn hash_code(&self) -> HashCode {
        *self as u32
    }
}

impl HashKey for u32 {
    fn hash_code(&self) -> HashCode {
        *self
    }
}

pub trait BorrowingLinkedList<'a> {
    type Item: 'a;
    fn empty() -> Self;

    fn push_back<K: Into<&'a mut Self::Item>>(&mut self, node: K);

    fn push_front(&mut self, node: &'a mut Self::Item);

    fn remove(&mut self, node: &'a mut Self::Item);

    fn is_empty(&self) -> bool;
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
    fn from_ref(node: &ListNode<Self>) -> &Self::Item;
}

/// As `ListNodeData` allows any struct to be list node in singly linked list (`TinyLinkedList`)
/// # Safety
/// Violate rust memory rules allowing several mutable reference (conceptually, using any linked list)
/// You should manually control the references
pub unsafe trait TinyListNodeData: Sized {
    type Item;
    fn from_node(node: &mut TinyListNode<Self>) -> &mut Self::Item;
    unsafe fn from_node_unchecked(
        mut raw_node: NonNull<TinyListNode<Self>>,
    ) -> NonNull<Self::Item> {
        let node = Self::from_node(raw_node.as_mut());
        NonNull::from(node)
    }
}

unsafe impl<T: ListNodeData> TinyListNodeData for T {
    type Item = T::Item;
    fn from_node(node: &mut TinyListNode<Self>) -> &mut Self::Item {
        let pivot = unsafe {
            core::mem::transmute::<&mut TinyListNode<T>, &mut ListNode<T>>(node)
        };
        ListNodeData::from_node(pivot)
    }
}

//marker type for any type
pub trait BoxedNode: TinyListNodeData {
    type Target;
    fn into_boxed(node: &mut Self::Item) -> Self::Target;
}
