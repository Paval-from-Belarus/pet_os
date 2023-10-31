use crate::memory::{SegmentSelector, VirtualAddress};
use core::{mem};
use core::arch::asm;
use crate::{bitflags, declare_constants};
use crate::memory::atomics::SpinLock;

#[allow(unused)]
#[repr(C)] //the wrapper on real stack frame
pub struct InterruptStackFrame {
    ip: usize,
    cs: usize,
    flags: usize,
    //only for kernel-user mode switching
    esp: usize,
    ss: usize,
}

pub type NakedExceptionHandler = extern "x86-interrupt" fn(&mut InterruptStackFrame);
pub type ErrorExceptionHandler = extern "x86-interrupt" fn(&mut InterruptStackFrame, usize);

bitflags!(
    pub GateDescriptorFlag(u8),
    TASK = 0x05,
    INTERRUPT_16BIT = 0x06,
    INTERRUPT_32BIT = 0x0E,
    TRAP_16BIT = 0x07,
    TRAP_32BIT = 0x0F,
    NO_PRIVILEGES = 0x60,
    PRESENT = 0x80
);
bitflags!(
    pub PageFaultError(usize),
    NOT_PRESENT = 0b0,
    LEVEL_PROTECTION = 0b1,
    CAUSE_MASK = 0b1,

    READ_FAULT = 0b00,
    WRITE_FAULT = 0b10,
    READ_WRITE_MASK = 0b10,

    SUPER_MODE = 0b000,
    USER_MODE = 0b100,
    MODE_MASK = 0b100,

    RESERVED_BIT_CAUSE = 0b1000,
    FETCH_CAUSE = 0b10000 //the cause is instruction fetch from page
);
#[repr(C)]
#[derive(Copy, Clone)]
//each interrupt entry is associate with specific interrupt handler
pub struct GateDescriptor {
    lower_offset: u16,
    selector: SegmentSelector,
    /// always should be zeroed
    reserved: u8,
    attributes: GateDescriptorFlag,
    upper_offset: u16,
}

impl GateDescriptor {
    pub const fn new(handler_offset: VirtualAddress, selector: SegmentSelector, attributes: GateDescriptorFlag) -> GateDescriptor {
        let lower_offset = (handler_offset & 0xFFFF) as u16;
        let upper_offset = ((handler_offset >> 16) & 0xFFFF) as u16;
        GateDescriptor {
            lower_offset,
            selector,
            reserved: 0,
            attributes,
            upper_offset,
        }
    }
    pub const fn null() -> Self {
        unsafe { mem::MaybeUninit::<GateDescriptor>::zeroed().assume_init() }//because the present bit is set to zero
    }
    pub fn with_naked_handler(handler: NakedExceptionHandler, selector: SegmentSelector, attributes: GateDescriptorFlag) -> Self {
        let handler_offset = handler as *const NakedExceptionHandler as VirtualAddress;
        GateDescriptor::new(handler_offset, selector, attributes)
    }
    pub fn with_error_handler(handler: ErrorExceptionHandler, selector: SegmentSelector, attributes: GateDescriptorFlag) -> Self {
        let handler_offset = handler as *const ErrorExceptionHandler as VirtualAddress;
        let _number = 12usize;
        GateDescriptor::new(handler_offset, selector, attributes)
    }
    pub const fn is_present(&self) -> bool {
        self.attributes.contains(GateDescriptorFlag::PRESENT)
    }
}

const MAX_INTERRUPTS_COUNT: usize = 256;
pub const INTERRUPT_FLAG: GateDescriptorFlag = GateDescriptorFlag::wrap(GateDescriptorFlag::INTERRUPT_32BIT | GateDescriptorFlag::PRESENT);
pub const TRAP_FLAG: GateDescriptorFlag = GateDescriptorFlag::wrap(GateDescriptorFlag::TRAP_32BIT | GateDescriptorFlag::PRESENT);

pub fn init() {
    let table = unsafe { &mut INTERRUPT_TABLE };
    let naked_descriptor = GateDescriptor::with_naked_handler(
        default_naked_exception_handler,
        SegmentSelector::CODE,
        INTERRUPT_FLAG);
    let error_descriptor = GateDescriptor::with_error_handler(
        default_error_exception_handler,
        SegmentSelector::CODE,
        INTERRUPT_FLAG);
    table.set(IDTable::DIVISION_BY_ZERO, naked_descriptor);
    table.set(IDTable::DEBUG, naked_descriptor);
    table.set(IDTable::NOT_MASKABLE, naked_descriptor);
    table.set(IDTable::BREAKPOINT, naked_descriptor);
    table.set(IDTable::OVERFLOW, naked_descriptor);
    table.set(IDTable::BOUND, naked_descriptor);
    table.set(IDTable::INVALID_OPCODE, naked_descriptor);
    table.set(IDTable::DEVICE_NOT_AVAILABLE, naked_descriptor);
    table.set(IDTable::DOUBLE_FAULT, error_descriptor);
    table.set(IDTable::COPROCESSOR_OVERRUN, naked_descriptor);
    table.set(IDTable::INVALID_TSS, error_descriptor);
    table.set(IDTable::SEGMENT_NOT_PRESENT, error_descriptor);
    table.set(IDTable::STACK_FAULT, error_descriptor);
    table.set(IDTable::GENERAL_PROTECTION, error_descriptor);
    table.set(
        IDTable::PAGE_FAULT,
        GateDescriptor::with_error_handler(page_fault_handler, SegmentSelector::CODE, INTERRUPT_FLAG));
    unsafe {
        asm!(
        "mov eax, {}",
        "lidt [eax]",
        "sti", //enable interrupts
        in(reg) &INTERRUPT_TABLE_HANDLE
        );
    }
}

/// set custom interrupt handler
pub fn set(index: usize, descriptor: GateDescriptor) -> GateDescriptor {
    let old = unsafe {
        INTERRUPT_TABLE.set(index, descriptor)
    };
    old
}

#[repr(C, packed)]
struct IDTHandle {
    table_size: u16,
    table_offset: *const GateDescriptor,
}

unsafe impl Sync for IDTHandle {}

#[repr(C)]
struct IDTable {
    entries: [GateDescriptor; MAX_INTERRUPTS_COUNT],
    lock: SpinLock,
}

unsafe impl Sync for IDTable {}

unsafe impl Send for IDTable {}

impl IDTHandle {
    pub const fn new(table: &IDTable) -> Self {
        IDTHandle {
            table_size: table.byte_size().saturating_sub(1) as u16,
            table_offset: table.entries.as_ptr(),
        }
    }
}

#[no_mangle]
static INTERRUPT_TABLE_HANDLE: IDTHandle = IDTHandle::new(unsafe { &INTERRUPT_TABLE });
#[no_mangle]
static mut INTERRUPT_TABLE: IDTable = IDTable::empty();

impl IDTable {
    declare_constants!(
        pub usize,
        DIVISION_BY_ZERO = 0x0, "fault, no error";
        DEBUG = 0x1, "trap or fault (depends on using), no error";
        NOT_MASKABLE = 0x2, "not applicable, no error";
        BREAKPOINT = 0x3, "trap, no error";
        OVERFLOW = 0x4, "trap, no error";
        BOUND = 0x5, "fault, no error";
        INVALID_OPCODE = 0x6, "fault, no error";
        DEVICE_NOT_AVAILABLE = 0x7, "fault, no error";
        DOUBLE_FAULT = 0x8, "abort, always zero as error code";
        COPROCESSOR_OVERRUN = 0x9, "abort but don't used, no error";
        INVALID_TSS = 0xA, "fault, error contains segment selector \
                            (check EXT flag to verify kind of error";
        SEGMENT_NOT_PRESENT = 0xB, "fault, error contains segment selector";
        STACK_FAULT = 0xC, "fault, error contains segment selector";
        GENERAL_PROTECTION = 0xD, "fault, zero or many variants:\
                                    operand of instruction, gate/tss selector,\
                                    idt vector number";
        PAGE_FAULT = 0xE, "fault, specific error format";
        //other reserved
    );
    pub const fn empty() -> Self {
        let entries: [GateDescriptor; MAX_INTERRUPTS_COUNT] = [GateDescriptor::null(); MAX_INTERRUPTS_COUNT];
        let lock = SpinLock::new();
        IDTable { entries, lock }
    }
    ///the size of table in bytes
    pub const fn byte_size(&self) -> usize {
        self.entries.len() * mem::size_of::<GateDescriptor>()
    }
    pub fn set(&mut self, index: usize, descriptor: GateDescriptor) -> GateDescriptor {
        debug_assert!(index < self.entries.len(), "Invalid index for IDTable");
        let old: GateDescriptor;
        self.lock.acquire();
        old = self.entries[index];
        self.entries[index] = descriptor;
        self.lock.release();
        old
    }
}


extern "x86-interrupt" fn division_by_zero(_from: &mut InterruptStackFrame) {}

extern "x86-interrupt" fn page_fault_handler(_frame: &mut InterruptStackFrame, error_code: usize) {
    let fault_code = PageFaultError::wrap(error_code);
    let _code = fault_code.contains_with_mask(PageFaultError::CAUSE_MASK, PageFaultError::MODE_MASK);
}

extern "x86-interrupt" fn default_naked_exception_handler(_frame: &mut InterruptStackFrame) {}

extern "x86-interrupt" fn default_error_exception_handler(_frame: &mut InterruptStackFrame, _error_code: usize) {}

#[cfg(test)]
mod tests {
    use super::*;
    use core::mem;
    use core::ops::{Shl, Shr};

    #[test]
    fn integrity_tests() {
        debug_assert!(
            mem::size_of::<GateDescriptor>() == 8,
            "Invalid size of IDTEntry"
        );
        let table = IDTable::empty();
        assert_eq!(table.byte_size() <= u16::MAX as usize, true);
        assert_eq!(mem::size_of::<IDTHandle>(), 6);
    }
}
