use kernel_types::string::MutString;
use kernel_types::{bitflags, declare_constants, syscall};

use crate::io::object::InterruptObject;
use crate::io::{
    IDTable, InterruptStackFrame, IrqLine, MAX_INTERRUPTS_COUNT,
};
use crate::memory::{SlabBox, VirtualAddress};
use crate::{
    error_trap, get_eax, get_edx, log_unchecked, memory, naked_trap, set_eax,
    task,
};

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
    for i in 0..MAX_INTERRUPTS_COUNT {
        //setting all interrupts to default handler
        table.set(i, naked_trap!(unknown_trap));
    }

    table.set(IDTable::DIVISION_BY_ZERO, naked_trap!(division_by_zero));
    table.set(IDTable::DEBUG, naked_trap!(debug));
    table.set(IDTable::NOT_MASKABLE, naked_trap!(nonmaskable));
    table.set(IDTable::BREAKPOINT, naked_trap!(breakpoint));
    table.set(IDTable::OVERFLOW, naked_trap!(overflow));
    table.set(IDTable::BOUND, naked_trap!(bound_check));
    table.set(IDTable::INVALID_OPCODE, naked_trap!(invalid_opcode));
    table.set(
        IDTable::DEVICE_NOT_AVAILABLE,
        naked_trap!(device_not_available),
    );
    table.set(IDTable::DOUBLE_FAULT, error_trap!(double_fault));
    table.set(IDTable::INVALID_TSS, error_trap!(invalid_tss));
    table.set(IDTable::SEGMENT_NOT_PRESENT, error_trap!(invalid_segment));
    table.set(IDTable::STACK_FAULT, error_trap!(stack_fault));
    table.set(IDTable::GENERAL_PROTECTION, error_trap!(general_protection));
    table.set(IDTable::PAGE_FAULT, error_trap!(page_fault));
    table.set(IDTable::ALIGNMENT_CHECK, error_trap!(alignment_check));
}

pub fn init_timer_isr() -> &'static InterruptObject {
    let object =
        memory::slab_alloc(InterruptObject::new(IrqLine::SYS_TIMER.line))
            .unwrap();

    let timer_object = SlabBox::leak(object);

    let info = task::init();

    timer_object.append(info);

    timer_object
}

declare_constants!(
    pub usize,
    INVALID = 0;
    OK_CODE = 0;
    CHECK_CODE = 42;
);

#[no_mangle]
pub extern "x86-interrupt" fn syscall(_frame: InterruptStackFrame) {
    let id: u32 = unsafe { get_eax!() };
    if id == syscall::RESERVED {
        unsafe { set_eax!(CHECK_CODE) };

        return;
    }

    if id == syscall::PRINTK {
        let raw_string: *const MutString = unsafe { get_edx!() };
        let string = unsafe { &*raw_string };

        log_unchecked!("printks says: {string}");
    }

    unsafe { set_eax!(INVALID) };
}

pub extern "x86-interrupt" fn division_by_zero(_from: InterruptStackFrame) {
    log_unchecked!("division by zero");
}

pub extern "x86-interrupt" fn debug(frame: InterruptStackFrame) {
    log_unchecked!("debug int: {frame:?}");
}

pub extern "x86-interrupt" fn nonmaskable(_frame: InterruptStackFrame) {
    log_unchecked!("nmi int");
}

pub extern "x86-interrupt" fn breakpoint(_frame: InterruptStackFrame) {
    log_unchecked!("breakpoint");
}

pub extern "x86-interrupt" fn overflow(_frame: InterruptStackFrame) {
    log_unchecked!("overflow");
}

pub extern "x86-interrupt" fn bound_check(_frame: InterruptStackFrame) {
    log_unchecked!("bound check failed");
}

pub extern "x86-interrupt" fn invalid_opcode(frame: InterruptStackFrame) {
    log_unchecked!("Invalid Opcode. EIP = {:X}, CS = {:X}", frame.ip, frame.cs);
}

pub extern "x86-interrupt" fn device_not_available(
    _frame: InterruptStackFrame,
) {
    log_unchecked!("device not available");
}

//we can do nothing
pub extern "x86-interrupt" fn double_fault(
    _frame: InterruptStackFrame,
    _code: usize,
) {
    panic!("The double fault exception occurs. We can nothing...(");
}

pub extern "x86-interrupt" fn invalid_tss(
    _frame: InterruptStackFrame,
    code: usize,
) {
    log_unchecked!("Invalid tss code={}", code);
}

pub extern "x86-interrupt" fn invalid_segment(
    _frame: InterruptStackFrame,
    _code: usize,
) {
    log_unchecked!("invalid segment");
}

pub extern "x86-interrupt" fn stack_fault(
    _frame: InterruptStackFrame,
    _code: usize,
) {
    log_unchecked!("stack fault");
}

pub extern "x86-interrupt" fn general_protection(
    _frame: InterruptStackFrame,
    _code: usize,
) {
    log_unchecked!("general protection fault");
}

pub extern "x86-interrupt" fn page_fault(
    frame: InterruptStackFrame,
    error_code: usize,
) {
    let fault_code = unsafe { PageFaultError::wrap(error_code) };
    let access_address: VirtualAddress;

    unsafe {
        core::arch::asm! {
            "mov eax, cr2",
            out("eax") access_address,
            options(nomem, nostack, preserves_flags)
        }
    }

    log_unchecked!(
        "Page Fault ({access_address:X}): {error_code} at IP={:X} CS={:X}\n",
        frame.ip,
        frame.cs
    );

    let _code = fault_code.contains_with_mask(
        PageFaultError::CAUSE_MASK,
        PageFaultError::MODE_MASK,
    );
}

pub extern "x86-interrupt" fn alignment_check(
    _frame: InterruptStackFrame,
    _code: usize,
) {
    log_unchecked!("alignment check failed");
}

///By default, unknown trap is handled by this function. Even if real error code present on stack
pub extern "x86-interrupt" fn unknown_trap(_frame: InterruptStackFrame) {
    log_unchecked!("Unknown trap is caught!")
}
