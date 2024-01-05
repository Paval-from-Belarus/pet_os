pub mod logging;
pub mod io;
pub mod atomics;
mod doubly_linked_list;
mod singly_linked_list;
mod spin_box;

use core::marker::PhantomData;
use core::mem;
use core::ptr::NonNull;
use static_assertions::{assert_eq_size, const_assert};
pub use spin_box::SpinBox;
pub use doubly_linked_list::{LinkedList, ListNode};
pub use singly_linked_list::{TinyLinkedList, TinyListNode};
#[macro_export]
macro_rules! from_list_node {
    ($target: ident, $source: ident, $field: tt) => {
        unsafe impl $crate::utils::ListNodeData for $source {
            type Item = $target;
            fn from(node: core::ptr::NonNull<ListNode<Self>>) -> core::ptr::NonNull<Self::Item> {
                let pointer = unsafe { node.as_ptr() };
                let field_offset = core::mem::offset_of!($target, $field);
                let struct_offset = unsafe { (pointer as *mut u8).byte_sub(field_offset) };
                let value = unsafe { core::mem::transmute::<*mut u8, *mut $target>(struct_offset) };
                unsafe {core::ptr::NonNull::new_unchecked(value)}
            }
        }
//         impl From<&ListNodePivots<$source>> for &$target {
//             fn from(value: &ListNodePivots<$source>) -> Self {
//                 let field_offset = mem::offset_of!($source, $field);
//                 let struct_offset = unsafe { (value as *const u8).byte_sub(field_offset) };
//                 unsafe { mem::transmute::<*const u8, &$target>(struct_offset) }
//             }
//         }
//
//         impl From<&mut ListNodePivots<$source>> for &mut $target {
//             fn from(value: &mut ListNodePivots<$source>) -> Self {
//                 let field_offset = mem::offset_of!($target, $field);
//                 let struct_offset = unsafe { (value as *const u8).byte_sub(field_offset) };
//                 unsafe { mem::transmute::<*const u8, &mut $target>(struct_offset) }
//             }
//         }
    };
}
#[macro_export]
macro_rules! list_node_data {
    ($vis: vis $target: ident $( ($self_field:tt) )?; $( $name: ident  ($field: tt));* $(;)?) => {
        $(
          paste::paste!{
              impl $target {
                  $vis fn [<as_ $self_field>](&self) -> core::ptr::NonNull<ListNode<$target>> {
                      core::ptr::NonNull::from(self.$self_field)
                  }
              }
          }
          $crate::from_list_node!($target, $target, $self_field);
        )?
        $(
            $vis struct $name();
            paste::paste!{
                impl $target {
                    $vis fn [<as_ $field>](&self) -> core::ptr::NonNull<ListNode<$name>> {
                        core::ptr::NonNull::from(self.$field)
                    }
                }
            }
            $crate::from_list_node!($target, $name, $field);
        )*
        impl<T: ListNodeData> From<&ListNode<T>> for &$target {
            fn from(value: &ListNode<T>) -> Self {
                unsafe { ListNodeData::from(NonNull::from(value)).as_ref() }
            }
        }
        impl<T: ListNodeData> From<&mut ListNode<T>> for &mut $target {
            fn from(value: &mut ListNode<T>) -> Self {
                unsafe {ListNodeData::from(NonNull::from(value)).as_mut()}
            }
        }
        impl $target {
            pub fn from_node<T: ListNodeData>(node: NonNull<ListNode<T>>) -> NonNull<$target> {
                ListNodeData::from(node)
            }
        }
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
    type Item;
    fn empty() -> Self;
    fn push_back(&mut self, node: &'a mut Self::Item);
    fn push_front(&mut self, node: &'a mut Self::Item);
    fn remove(&mut self, node: &'a mut Self::Item);
}

pub trait UnlinkableListGuard<'a, T: BorrowingLinkedList<'a>> {
    type Item;
    fn parent(&self) -> NonNull<T>;
    unsafe fn collect<I: IntoIterator<Item=Self::Item>>(mut self, iter: I) -> T {
        let owner = self.parent.as_mut();
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
    unsafe fn map_collect<I: IntoIterator<Item=Self::Item>, S, R: BorrowingLinkedList<'a, Item=S>, F>(mut self, iter: I, map: F) -> R
        where F: FnMut(Self::Item) -> S {
        let owner = self.parent.as_mut();
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


pub unsafe trait ListNodeData: Sized {
    type Item;
    fn from(node: NonNull<ListNode<Self>>) -> NonNull<Self::Item>;
}


pub unsafe trait TinyListNodeData: Sized {
    type Item;
    fn from(node: NonNull<TinyListNode<Self>>) -> NonNull<Self::Item>;
}

#[derive(Copy, Clone)]
#[repr(transparent)]
pub struct ListNodePivot<T> {
    next: Option<NonNull<TinyListNode<T>>>,
}

impl<T: TinyListNodeData> ListNodePivot<T> {
    pub unsafe fn empty() -> Self {
        Self {
            next: None,
        }
    }
    pub fn new(next: Option<&mut TinyListNode<T>>) -> Self {
        let next = next.map(|node| NonNull::from(node));
        Self { next }
    }
    pub fn set_next(&mut self, next: Option<&mut TinyListNode<T>>) {
        self.next = next.map(|node| NonNull::from(node));
    }
}

#[derive(Copy, Clone)]
#[repr(C)]
pub struct ListNodePivots<T> {
    next: NonNull<ListNodePivots<T>>,
    prev: NonNull<ListNodePivots<T>>,
    _marker: PhantomData<T>,
}
assert_eq_size!(ListNodePivots, [usize; 2]);
impl<T: ListNodeData> ListNodePivots<T> {
    pub const unsafe fn empty() -> Self {
        Self {
            next: NonNull::dangling(),
            prev: NonNull::dangling(),
            _marker: PhantomData,
        }
    }
    pub fn new(next: &mut ListNode<T>, prev: &mut ListNode<T>) -> Self {
        Self {
            next: NonNull::from(next),
            prev: NonNull::from(prev),
            _marker: PhantomData,
        }
    }
    pub fn set_next(&mut self, next: &mut ListNode<T>) {
        self.next = NonNull::from(next);
    }
    pub fn set_prev(&mut self, prev: &mut ListNode<T>) {
        self.prev = NonNull::from(prev);
    }
}

fn test() {
    let pivots = ListNodePivots {
        next: NonNull::dangling(),
        prev: NonNull::dangling(),
        marker: 12u8,
    };
}