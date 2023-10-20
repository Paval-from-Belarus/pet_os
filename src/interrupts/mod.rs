use crate::memory::{MemRangeFlag, SegmentSelector, VirtualAddress};
use core::marker::PhantomData;
use core::mem;
use static_assertions::{assert_eq_size, assert_eq_size_val, assert_trait_sub_all, const_assert, const_assert_eq};
use crate::bitflags;

#[allow(unused)]
#[repr(C)] //the wrapper on real stack frame
struct InterruptStackFrame {
    ip: usize,
    cs: usize,
    flags: usize,
    //only for kernel-user mode switching
    esp: usize,
    ss: usize,
}

#[allow(unused)]
pub type NakedExceptionHandler = extern "x86-interrupt" fn(&mut InterruptStackFrame);
pub type ErrorExceptionHandler = extern "x86-interrupt" fn(&mut InterruptStackFrame, usize);

trait ExceptionHandler {}

impl ExceptionHandler for NakedExceptionHandler {}

impl ExceptionHandler for ErrorExceptionHandler {}

bitflags!(
    GateDescriptorFlag(u8),
    TASK = 0x05,
    INTERRUPT_16BIT = 0x06,
    INTERRUPT_32BIT = 0x0E,
    TRAP_16BIT = 0x07,
    TRAP_32BIT = 0x0F,
    NO_PRIVILEGES = 0x60,
    PRESENT = 0x80
);
bitflags!(
    PageFaultError(usize),
    NOT_PRESENT = 0b0,
    LEVEL_PROTECTION = 0b1,
    READ_FAULT = 0b00,
    WRITE_FAULT = 0b10,
    SUPER_MODE = 0b000,
    USER_MODE = 0b100,
    RESERVED_BIT_CAUSE = 0b1000,
    FETCH_CAUSE = 0b10000 //the cause is instruction fetch from page
);

pub const MAX_INTERRUPTS_COUNT: usize = 256;

pub struct IDTable<T: ExceptionHandler> {
    entries: [GateDescriptor<T>; MAX_INTERRUPTS_COUNT],
}

pub const INTERRUPT_FLAG: GateDescriptorFlag = GateDescriptorFlag::from(GateDescriptorFlag::INTERRUPT_32BIT | GateDescriptorFlag::PRESENT);

impl<T: ExceptionHandler + Copy> IDTable<T> {
    const DIVISION_BY_ZERO: usize = 0x0;
    const PAGE_FAULT: usize = 14;
    pub const fn new() -> Self <> {
        let mut entries = [GateDescriptor::null(); MAX_INTERRUPTS_COUNT];
        entries[IDTable::PAGE_FAULT] = GateDescriptor::with_error_handler(
            page_fault_handler,
            SegmentSelector::CODE,
            INTERRUPT_FLAG,
        );
        // entries[IDTable::DIVISION_BY_ZERO] = GateDescriptor::with_naked_handler(
        //     division_by_zero,
        //     SegmentSelector::CODE,
        //     INTERRUPT_FLAG,
        // );
        IDTable { entries }
    }
}

#[repr(C)]
#[derive(Copy, Clone)]
//each interrupt entry is associate with specific interrupt handler
struct GateDescriptor<T: ExceptionHandler> {
    lower_offset: u16,
    selector: SegmentSelector,
    reserved: u8,
    //always should be zeroed
    attributes: GateDescriptorFlag,
    upper_offset: u16,
    phantom: PhantomData<T>,
}

impl<T: ExceptionHandler> GateDescriptor<T> {
    pub const fn new(handler_offset: VirtualAddress, selector: SegmentSelector, attributes: GateDescriptorFlag) -> GateDescriptor<T> {
        let lower_offset = (handler_offset & 0xFFFF) as u16;
        let upper_offset = ((handler_offset >> 16) & 0xFFFF) as u16;
        GateDescriptor {
            lower_offset,
            selector,
            reserved: 0,
            attributes,
            upper_offset,
            phantom: PhantomData,
        }
    }
    pub const fn null() -> Self {
        unsafe { mem::MaybeUninit::<GateDescriptor<T>>::zeroed().assume_init() }//because the present bit is set to zero
    }
    pub fn is_present(&self) -> bool {
        self.attributes.contains(GateDescriptorFlag::PRESENT)
    }
}

impl GateDescriptor<NakedExceptionHandler> {
    pub fn with_naked_handler(handler: NakedExceptionHandler, selector: SegmentSelector, attributes: GateDescriptorFlag) -> Self {
        let handler_offset = handler as *const NakedExceptionHandler as VirtualAddress;
        GateDescriptor::new(handler_offset, selector, attributes)
    }
}

impl GateDescriptor<ErrorExceptionHandler> {
    pub fn with_error_handler(handler: ErrorExceptionHandler, selector: SegmentSelector, attributes: GateDescriptorFlag) -> Self {
        let handler_offset = handler as *const ErrorExceptionHandler as VirtualAddress;
        let number = 12usize;
        GateDescriptor::new(handler_offset, selector, attributes)
    }
}

pub extern "x86-interrupt" fn division_by_zero(from: &mut InterruptStackFrame) {}

pub extern "x86-interrupt" fn page_fault_handler(frame: &mut InterruptStackFrame, error_code: usize) {}

pub extern "x86-interrupt" fn default_naked_exception_handler(frame: &mut InterruptStackFrame) {}

pub extern "x86-interrupt" fn default_error_exception_handler(frame: &mut InterruptStackFrame, error_code: usize) {}

#[cfg(test)]
mod tests {
    use super::*;
    use core::mem;

    #[test]
    fn integrity_tests() {
        debug_assert!(
            mem::size_of::<GateDescriptor<usize>>() == 10,
            "Invalid size of IDTEntry"
        );
    }
}
