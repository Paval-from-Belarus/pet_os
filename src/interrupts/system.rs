use crate::{bitflags, error_trap, naked_trap};
use crate::interrupts::{IDTable, InterruptStackFrame, pic};
use crate::interrupts::object::InterruptObject;
use crate::utils::SimpleList;

//the common handlers
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

pub fn init_traps(table: &mut IDTable) {
    for i in 0..IDTable::TRAP_COUNT {
        table.set(i, naked_trap!(unknown_trap));
    }
    table.set(IDTable::DIVISION_BY_ZERO, naked_trap!(division_by_zero));
    table.set(IDTable::DEBUG, naked_trap!(debug));
    table.set(IDTable::NOT_MASKABLE, naked_trap!(nonmaskable));
    table.set(IDTable::BREAKPOINT, naked_trap!(breakpoint));
    table.set(IDTable::OVERFLOW, naked_trap!(overflow));
    table.set(IDTable::BOUND, naked_trap!(bound_check));
    table.set(IDTable::INVALID_OPCODE, naked_trap!(invalid_opcode));
    table.set(IDTable::DEVICE_NOT_AVAILABLE, naked_trap!(device_not_available));
    table.set(IDTable::DOUBLE_FAULT, error_trap!(double_fault));
    table.set(IDTable::INVALID_TSS, error_trap!(invalid_tss));
    table.set(IDTable::SEGMENT_NOT_PRESENT, error_trap!(invalid_segment));
    table.set(IDTable::STACK_FAULT, error_trap!(stack_fault));
    table.set(IDTable::GENERAL_PROTECTION, error_trap!(general_protection));
    table.set(IDTable::PAGE_FAULT, error_trap!(page_fault));
    table.set(IDTable::ALIGNMENT_CHECK, error_trap!(alignment_check));
}

///Init IRQ lines
pub fn init_irq(table: &mut IDTable) -> [Option<&'static InterruptObject>; pic::LINES_COUNT] {
    let list = SimpleList::<Option<&'static InterruptObject>>::empty();
    todo!()
}

pub extern "x86-interrupt" fn syscall(frame: &mut InterruptStackFrame) {}

pub extern "x86-interrupt" fn division_by_zero(_from: &mut InterruptStackFrame) {}

pub extern "x86-interrupt" fn debug(frame: &mut InterruptStackFrame) {}

pub extern "x86-interrupt" fn nonmaskable(frame: &mut InterruptStackFrame) {}

pub extern "x86-interrupt" fn breakpoint(frame: &mut InterruptStackFrame) {}

pub extern "x86-interrupt" fn overflow(frame: &mut InterruptStackFrame) {}

pub extern "x86-interrupt" fn bound_check(frame: &mut InterruptStackFrame) {}

pub extern "x86-interrupt" fn invalid_opcode(frame: &mut InterruptStackFrame) {}

pub extern "x86-interrupt" fn device_not_available(frame: &mut InterruptStackFrame) {}

//we can do nothing
pub extern "x86-interrupt" fn double_fault(frame: &mut InterruptStackFrame, code: usize) {
    panic!("The double fault exception occurs. We can nothing...(");
}

pub extern "x86-interrupt" fn invalid_tss(frame: &mut InterruptStackFrame, code: usize) {}

pub extern "x86-interrupt" fn invalid_segment(frame: &mut InterruptStackFrame, code: usize) {}

pub extern "x86-interrupt" fn stack_fault(frame: &mut InterruptStackFrame, code: usize) {}


pub extern "x86-interrupt" fn general_protection(frame: &mut InterruptStackFrame, code: usize) {}

pub extern "x86-interrupt" fn page_fault(_frame: &mut InterruptStackFrame, error_code: usize) {
    let fault_code = PageFaultError::wrap(error_code);
    let _code = fault_code.contains_with_mask(PageFaultError::CAUSE_MASK, PageFaultError::MODE_MASK);
}

pub extern "x86-interrupt" fn alignment_check(frame: &mut InterruptStackFrame, code: usize) {}

///By default, unknown trap is handled by this function. Even if real error code present on stack
pub extern "x86-interrupt" fn unknown_trap(_frame: &mut InterruptStackFrame) {
    panic!("Unknown trap is caught!");
}