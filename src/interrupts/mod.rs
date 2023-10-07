use crate::memory::VirtualAddress;
use core::marker::PhantomData;

#[allow(unused)]
#[repr(C)] //the wrapper on real stack frame
struct InterruptStackFrame {
    ip: usize,
    flags: usize,
    cs: usize,
    sp: usize,
    ss: usize,
    error_code: usize,
}

#[allow(unused)]
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
    #[allow(unused)]
    pub fn new(handler: Handler) -> IDTEntry<Handler> {
        let handler_offset = handler as *const Handler as VirtualAddress;
        let _lower_offset = (handler_offset & 0xFFFF) as u16;
        let _upper_offset = ((handler_offset >> 16) & 0xFFFF) as u16;

        todo!()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use core::mem;

    #[test]
    fn integrity_tests() {
        debug_assert!(
            mem::size_of::<IDTEntry<usize>>() == 10,
            "Invalid size of IDTEntries"
        );
    }
}
