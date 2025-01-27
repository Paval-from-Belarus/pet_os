use core::{u8, usize};
use kernel_types::{bitflags, declare_constants};

use crate::interrupts::object::InterruptObject;
use crate::interrupts::{
    pic, CallbackInfo, IDTable, InterruptStackFrame, IrqLine,
    MAX_INTERRUPTS_COUNT,
};
use crate::memory::AllocationStrategy::Kernel;
use crate::{error_trap, get_eax, log, memory, naked_trap, process, set_eax};

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

///Init IRQ lines
pub fn init_irq() -> [Option<&'static InterruptObject>; pic::LINES_COUNT] {
    let mut objects: [Option<&'static InterruptObject>; pic::LINES_COUNT] =
        [None; pic::LINES_COUNT];

    objects[u8::from(IrqLine::SYS_TIMER.line) as usize] =
        Some(init_timer(process::init()));

    objects
}

fn init_timer(info: CallbackInfo) -> &'static InterruptObject {
    let raw_object = memory::slab_alloc::<InterruptObject>(Kernel)
        .expect("Failed to init timer");

    let timer_object =
        raw_object.write(InterruptObject::new(IrqLine::SYS_TIMER.line));

    timer_object.add(info);

    timer_object
}
declare_constants!(
    pub usize,
    RESERVED_SYSCALL = 0xFFFF_FFFF, "No function to zero can be used; this function used to test system initialization";
    INVALID = 0;
);
pub extern "x86-interrupt" fn syscall(_frame: &mut InterruptStackFrame) {
    let id: usize = unsafe { get_eax!() };
    if id == RESERVED_SYSCALL {
        log!("interrupts are initialized");
        unsafe { set_eax!(1) };
    } else {
        unsafe { set_eax!(INVALID) };
    }
}

pub extern "x86-interrupt" fn division_by_zero(
    _from: &mut InterruptStackFrame,
) {
    log!("division by zero");
}

pub extern "x86-interrupt" fn debug(_frame: &mut InterruptStackFrame) {
    log!("debug int");
}

pub extern "x86-interrupt" fn nonmaskable(_frame: &mut InterruptStackFrame) {
    log!("nmi int");
}

pub extern "x86-interrupt" fn breakpoint(_frame: &mut InterruptStackFrame) {
    log!("breakpoint");
}

pub extern "x86-interrupt" fn overflow(_frame: &mut InterruptStackFrame) {
    log!("overflow");
}

pub extern "x86-interrupt" fn bound_check(_frame: &mut InterruptStackFrame) {
    log!("bound check failed");
}

pub extern "x86-interrupt" fn invalid_opcode(_frame: &mut InterruptStackFrame) {
    log!("invalid opcode int");
}

pub extern "x86-interrupt" fn device_not_available(
    _frame: &mut InterruptStackFrame,
) {
    log!("device not available");
}

//we can do nothing
pub extern "x86-interrupt" fn double_fault(
    _frame: &mut InterruptStackFrame,
    _code: usize,
) {
    panic!("The double fault exception occurs. We can nothing...(");
}

pub extern "x86-interrupt" fn invalid_tss(
    _frame: &mut InterruptStackFrame,
    code: usize,
) {
    log!("Invalid tss code={}", code);
}

pub extern "x86-interrupt" fn invalid_segment(
    _frame: &mut InterruptStackFrame,
    _code: usize,
) {
    log!("invalid segment");
}

pub extern "x86-interrupt" fn stack_fault(
    _frame: &mut InterruptStackFrame,
    _code: usize,
) {
    log!("stack fault");
}

pub extern "x86-interrupt" fn general_protection(
    _frame: &mut InterruptStackFrame,
    _code: usize,
) {
    log!("general protection fault");
}

pub extern "x86-interrupt" fn page_fault(
    _frame: &mut InterruptStackFrame,
    error_code: usize,
) {
    let fault_code = unsafe { PageFaultError::wrap(error_code) };
    let _code = fault_code.contains_with_mask(
        PageFaultError::CAUSE_MASK,
        PageFaultError::MODE_MASK,
    );
}

pub extern "x86-interrupt" fn alignment_check(
    _frame: &mut InterruptStackFrame,
    _code: usize,
) {
    log!("alignment check failed");
}

///By default, unknown trap is handled by this function. Even if real error code present on stack
pub extern "x86-interrupt" fn unknown_trap(_frame: &mut InterruptStackFrame) {
    panic!("Unknown trap is caught!");
}
