#![no_std]
#![feature(fn_ptr_trait)]
#![feature(tuple_trait)]
#![feature(let_chains)]
#![feature(offset_of)]
#![feature(unboxed_closures)]


pub mod drivers;
pub mod collections;

pub trait ReferableResource {
    fn take(&self);
    fn free(&self);
    fn is_used(&self) -> bool;
    fn is_free(&self) -> bool {
        !self.is_used()
    }
}
