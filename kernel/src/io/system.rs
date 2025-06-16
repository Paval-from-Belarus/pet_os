use kernel_types::{declare_constants, set_eax, set_edx, syscall};

use crate::io::irq::IrqChain;
use crate::io::{
    self, IDTable, InterruptStackFrame, IrqLine, MAX_INTERRUPTS_COUNT,
};
use crate::memory::{Page, SlabBox, VirtualAddress};
use crate::{
    current_task, error_trap, log_module, memory, naked_trap, task, user,
};

//the common handlers

#[cfg(target_arch = "x86")]
bitfield::bitfield! {
    pub struct PageFaultError(u32);
    impl Debug;
    pub present, _: 0;      // Bit 0: P
    pub write, _: 1;        // Bit 1: W/R
    pub user, _: 2;         // Bit 2: U/S
    pub reserved, _: 3;     // Bit 3: RSVD
    pub instruction, _: 4;  // Bit 4: I/D
}

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

pub fn init_timer_isr() -> &'static IrqChain {
    let object =
        memory::slab_alloc(IrqChain::new(IrqLine::SYS_TIMER.line)).unwrap();

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

extern "x86-interrupt" {
    pub fn _syscall(frame: InterruptStackFrame);
}

#[derive(Debug, Clone)]
#[repr(C)]
pub struct SyscallParams {
    pub code: u32,
    pub edx: u32,
    pub ecx: u32,
}

#[no_mangle]
pub extern "C" fn handle_syscall(params: *mut SyscallParams) {
    let SyscallParams { code, edx, ecx } = unsafe { &mut *params }.clone();
    let params = unsafe { &mut *params };

    if code == syscall::RESERVED {
        params.code = OK_CODE as u32;
        params.edx = CHECK_CODE as u32;
        return;
    }

    let Ok(request) = syscall::Request::try_from(code) else {
        params.code = syscall::SyscallError::NotSupported as u32;

        return;
    };

    let old_esp = current_task!().context().esp;

    let code = match user::syscall::handle(request, edx as usize, ecx as usize)
    {
        Ok(_) => 0,
        Err(cause) => cause as u32,
    };

    log::debug!("task#{}. old esp: 0x{old_esp:x?}", current_task!().id);
    if current_task!().context().esp != old_esp {
        current_task!().context_mut().esp = old_esp;
        unsafe { memory::switch_to_task(current_task!()) }
    }

    params.code = code;
}

pub extern "x86-interrupt" fn terminate_process(_frame: InterruptStackFrame) {
    task::terminate(0);
}

pub extern "x86-interrupt" fn division_by_zero(_from: InterruptStackFrame) {
    log_module!("division by zero");
}

pub extern "x86-interrupt" fn debug(frame: InterruptStackFrame) {
    log_module!("debug int: {frame:?}");
}

pub extern "x86-interrupt" fn nonmaskable(_frame: InterruptStackFrame) {
    log_module!("nmi int");
}

pub extern "x86-interrupt" fn breakpoint(_frame: InterruptStackFrame) {
    log_module!("breakpoint");
}

pub extern "x86-interrupt" fn overflow(_frame: InterruptStackFrame) {
    log_module!("overflow");
}

pub extern "x86-interrupt" fn bound_check(_frame: InterruptStackFrame) {
    log_module!("bound check failed");
}

pub extern "x86-interrupt" fn invalid_opcode(frame: InterruptStackFrame) {
    let op_code: u8 = unsafe { (frame.ip as *const u8).read() };

    log_module!(
        "Invalid Opcode {op_code:X}. EIP = {:X}, CS = {:X}",
        frame.ip,
        frame.cs
    );
}

pub extern "x86-interrupt" fn device_not_available(
    _frame: InterruptStackFrame,
) {
    log_module!("device not available");
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
    log_module!("Invalid tss code={}", code);
}

pub extern "x86-interrupt" fn invalid_segment(
    _frame: InterruptStackFrame,
    _code: usize,
) {
    log_module!("invalid segment");
}

pub extern "x86-interrupt" fn stack_fault(
    _frame: InterruptStackFrame,
    _code: usize,
) {
    log_module!("stack fault");
}

pub extern "x86-interrupt" fn general_protection(
    frame: InterruptStackFrame,
    code: usize,
) {
    let should_enable = unsafe { io::status() };
    unsafe { io::disable() };
    log_module!("\ngeneral protection fault({code:X}). Frame: {frame:?}\n",);

    if should_enable {
        unsafe { io::enable() };
    }
}

pub extern "x86-interrupt" fn page_fault(
    frame: InterruptStackFrame,
    code: usize,
) {
    let access_address: VirtualAddress;

    unsafe {
        core::arch::asm! {
            "mov eax, cr2",
            out("eax") access_address,
            options(nomem, nostack, preserves_flags)
        }
    }

    if let Some(process) = current_task!().process.clone() {
        let mut state = process.state.lock();

        let stack_bottom = state.stack.start;

        if stack_bottom > access_address
            && (stack_bottom - access_address) < 2 * Page::SIZE
        {
            let new_stack_bottom = stack_bottom - 2 * Page::SIZE;

            if let Err(cause) = state.resize_stack(new_stack_bottom) {
                log::error!("User proccess cannot resize stack: {cause}");
                drop(state);
                user::exit(12);
            }

            log::debug!("Stack resized to {:X?}", state.stack);

            return;
        }
    }

    let code = PageFaultError(code as u32);

    log_module! {
        "[Task#{}] Page Fault ({access_address:X}): {code:?} at IP={:X} CS={:X}\n",
        current_task!().id,
        frame.ip,
        frame.cs
    };

    if let Some(process) = current_task!().process.as_ref() {
        let lookuped =
            process.state.lock().marker.lookup_physical(access_address);

        log_module!("Lookuped value: {lookuped:?}");
    }
}

pub extern "x86-interrupt" fn alignment_check(
    _frame: InterruptStackFrame,
    _code: usize,
) {
    log_module!("alignment check failed");
}

///By default, unknown trap is handled by this function. Even if real error code present on stack
pub extern "x86-interrupt" fn unknown_trap(_frame: InterruptStackFrame) {
    log_module!("Unknown trap is caught!")
}
