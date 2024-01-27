pub mod logging;
pub mod io;
pub mod atomics;
mod doubly_linked_list;
mod singly_linked_list;
mod spin_box;
mod string;
pub mod time;
mod hash_table;

use core::ptr::NonNull;
pub use spin_box::SpinBox;
pub use doubly_linked_list::{LinkedList, ListNode};
pub use hash_table::{HashTable, HashKey, HashData};
pub use singly_linked_list::{TinyLinkedList, TinyListNode};
pub use string::{MutString, QuickString};
#[macro_export]
macro_rules! from_list_node {
    ($target: ident, $source: ident, $field: tt) => {
        unsafe impl $crate::utils::ListNodeData for $source {
            type Item = $target;
            fn from(node: core::ptr::NonNull<ListNode<Self>>) -> core::ptr::NonNull<Self::Item> {
                let pointer = node.as_ptr();
                let field_offset = core::mem::offset_of!($target, $field);
                let struct_offset = unsafe { (pointer as *mut u8).byte_sub(field_offset) };
                let value = unsafe { core::mem::transmute::<*mut u8, *mut $target>(struct_offset) };
                unsafe {core::ptr::NonNull::new_unchecked(value)}
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
                    impl $crate::utils::$marker for $name {}
                )*
            )?

        )*
        impl $target {
            pub fn from_node<T: $crate::utils::ListNodeData<Item=$target>>(node: core::ptr::NonNull<ListNode<T>>) -> core::ptr::NonNull<$target> {
                $crate::utils::ListNodeData::from(node)
            }
            pub fn from_mut<T: $crate::utils::ListNodeData<Item=$target>>(node: &mut ListNode<T>) -> &mut $target {
                unsafe { $crate::utils::ListNodeData::from(core::ptr::NonNull::from(node)).as_mut() }
            }
            pub fn from_ref<T: $crate::utils::ListNodeData<Item=$target>>(node: &ListNode<T>) -> &$target {
                unsafe { $crate::utils::ListNodeData::from(core::ptr::NonNull::from(node)).as_ref() }
            }
        }
    };
}
#[macro_export]
macro_rules! tiny_list_node {
    ($vis: vis $target: ident ($field: tt)) => {
        paste::paste!{
            impl $target {
                $vis fn [<as_ $field>](&self) -> core::ptr::NonNull<TinyListNode<$target>> {
                    core::ptr::NonNull::from(&self.$field)
                }
                $vis fn from_node<T: $crate::utils::TinyListNodeData<Item=$target>>(node: core::ptr::NonNull<TinyListNode<T>>) -> core::ptr::NonNull<$target> {
                    $crate::utils::TinyListNodeData::from(node)
                }
                $vis fn from_mut<T: $crate::utils::TinyListNodeData<Item=$target>>(node: &mut TinyListNode<T>) -> &mut $target {
                    unsafe { $crate::utils::TinyListNodeData::from(core::ptr::NonNull::from(node)).as_mut() }
                }
                $vis fn from_ref<T: $crate::utils::TinyListNodeData<Item=$target>>(node: &TinyListNode<T>) -> & $target {
                    unsafe {$crate::utils::TinyListNodeData::from(core::ptr::NonNull::from(node)).as_ref() }
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
#[macro_export]
macro_rules! lambda_const_assert {
    ($($list:ident : $ty:ty),* => $expr:expr) => {{
        struct Assert<$(const $list: usize,)*>;
        impl<$(const $list: $ty,)*> Assert<$($list,)*> {
            const OK: u8 = 0 - !($expr) as u8;
        }
        Assert::<$($list,)*>::OK
    }};
    ($expr:expr) => {
        const OK: u8 = 0 - !($expr) as u8;
    };
}
#[macro_export]
macro_rules! bitflags {
    ($vis:vis $s:ident($t:ty), $($name:ident = $value:expr),* $(,)?) => {
        #[derive(Clone, Copy)]
        #[repr(transparent)]
        $vis struct $s($t);

        impl From<$t> for $s {
            fn from(item: $t) -> Self {
                $s(item)
            }
        }
        impl From<$s> for $t {
            fn from(item: $s) -> Self {
                item.0
            }
        }
        impl $s {
         $(
            $vis const $name: $t = $value;
        )*
            const BITS_COUNT: usize = core::mem::size_of::<$t>() * 8;
            pub const fn wrap(value: $t) -> Self {
                Self(value)
         }
           pub const fn bits(&self) -> $t {
             self.0
         }
            pub const fn contains_with_mask(&self, mask: $t, flag: $t) -> bool {
             self.0 & mask == flag
         }
            pub const fn test_with(&self, bit: $t) -> bool {
             self.0 & bit == bit
         }
        }
    };
}
#[macro_export]
macro_rules! declare_constants {
    ($vis: vis $t:ty, $($name:ident = $value:expr $(, $comment:expr)?);* $(;)?) => {
        $(
            $(#[doc = $comment])?
            $vis const $name: $t = $value;
        )*
    };
}

#[derive(Default, Clone, Copy)]
#[repr(transparent)]
pub struct Zeroed<T: Sized> {
    value: T,
}

#[derive(Clone, Copy)]
pub struct MinMax<T: Sized + Ord> {
    min: T,
    max: T,
}


#[inline]
pub fn min_max<T: Sized + Ord>(first: T, second: T) -> MinMax<T> {
    if first.le(&second) {
        MinMax { min: first, max: second }
    } else {
        MinMax { min: second, max: first }
    }
}

pub fn unreachable() -> ! {
    unsafe { core::intrinsics::unreachable() }
}
#[macro_export]
macro_rules! unwrap_err_unchecked {
    ($expr: expr) => {
        unsafe { $expr.unwrap_err_unchecked() }
    };
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
    unsafe fn collect_map<I: IntoIterator<Item=&'a mut T::Item>, S: 'a, R: BorrowingLinkedList<'a, Item=S>, F>(self, iter: I, mut map: F) -> R
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

//that's enought to implement only ListNodeData because TinyListNodeData is implemente by default
pub trait DanglingData {}

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
