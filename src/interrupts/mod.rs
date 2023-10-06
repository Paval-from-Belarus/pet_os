use core::marker::PhantomData;
use core::mem;
use crate::memory::VirtualAddress;

#[repr(C)] //the wrapper on real stack frame
struct InterruptStackFrame {
    ip: usize,
    flags: usize,
    cs: usize,
    sp: usize,
    ss: usize,
    error_code: usize,
}

type Handler = fn(&mut InterruptStackFrame);

#[derive(Debug)]
#[repr(C)]
//each interrupt entry is associate with specific interrupt handler
struct IDTEntry<T> {
    lower_offset: u16,
    code_selector: u16,
    reserved: u8,
    attributes: u16,
    upper_offset: u16,
    phantom: PhantomData<T>,
}

impl IDTEntry<Handler> {
    pub fn new(handler: Handler) -> IDTEntry<Handler> {
        let handler_offset = handler as *const Handler as VirtualAddress;
        let lower_offset = (handler_offset & 0xFFFF) as u16;
        let upper_offset = ((handler_offset >> 16) & 0xFFFF) as u16;

        todo!()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn integrity_tests() {
        debug_assert!(mem::size_of::<IDTEntry<usize>>() == 10, "Invalid size of IDTEntries");
    }
}