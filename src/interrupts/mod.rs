mod object;
mod system;
mod pic;

use crate::memory::{InterruptGate, PrivilegeLevel, SegmentSelector, SystemType, VirtualAddress};
use core::{mem};
use core::arch::asm;
use crate::{declare_constants};
use crate::interrupts::object::InterruptObject;
use crate::utils::atomics::SpinLock;
use crate::utils::{io, SimpleList};

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
///the interrupt callback that return true if interrupt was handle (and no more handling is required)
pub type Callback = fn(is_processed: bool, context: *mut ()) -> bool;

pub struct CallbackInfo {
    callback: Callback,
    context: *mut (),
}

impl CallbackInfo {
    pub fn new(callback: Callback, context: *mut ()) -> Self {
        Self { callback, context }
    }
    #[inline]
    pub const fn invoke(&self, is_dispatched: bool) -> bool {
        let callback = self.callback;
        callback(is_dispatched, self.context)
    }
}

declare_constants!(
    pub SystemType,
    INTERRUPT = SystemType::wrap(SystemType::INTERRUPT_32BIT);
    TRAP = SystemType::wrap(SystemType::TRAP_32BIT);
);

#[macro_export]
macro_rules! naked_trap {
    ($handler:ident) => ({
        use $crate::interrupts::InterruptGate;
        InterruptGate::with_naked_handler($handler, $crate::memory::SegmentSelector::CODE, $crate::interrupts::TRAP)
    });
}
#[macro_export]
macro_rules! error_trap {
    ($handler: ident) => ({
        use $crate::interrupts::InterruptGate;
        InterruptGate::with_error_handler($handler, $crate::memory::SegmentSelector::CODE, $crate::interrupts::TRAP)
    });
}
impl InterruptGate {
    pub fn with_naked_handler(handler: NakedExceptionHandler, selector: SegmentSelector, attributes: SystemType) -> Self {
        let handler_offset = handler as *const NakedExceptionHandler as VirtualAddress;
        let mut instance = InterruptGate::default(handler_offset, selector, attributes);
        instance.flags.set_present(true);
        instance
    }
    pub fn with_error_handler(handler: ErrorExceptionHandler, selector: SegmentSelector, attributes: SystemType) -> Self {
        let handler_offset = handler as *const ErrorExceptionHandler as VirtualAddress;
        let _number = 12usize;
        let mut instance = InterruptGate::default(handler_offset, selector, attributes);
        instance.flags.set_present(true);
        instance
    }
    pub fn syscall(handler: NakedExceptionHandler) -> Self {
        let offset = handler as *const NakedExceptionHandler as VirtualAddress;
        let mut instance = InterruptGate::default(offset, SegmentSelector::CODE, INTERRUPT);
        instance.flags.set_present(true);
        instance.flags.set_ring(PrivilegeLevel::wrap(PrivilegeLevel::USER));
        instance
    }
}

const MAX_INTERRUPTS_COUNT: usize = 256;

///the method to registry InterruptObject
pub fn registry(index: u8) {}


extern "x86-interrupt" fn dispatch(frame: &mut InterruptStackFrame) {
    unsafe { enter_kernel_trap() };

    unsafe { leave_kernel_trap() };
}

extern "x86-interrupt" fn dispatch_with_error_code(frame: &mut InterruptStackFrame, error_code: usize) {
    unsafe { enter_kernel_trap() };

    unsafe { leave_kernel_trap() };
}

//t
extern "x86-interrupt" fn dispatch_irq(frame: &mut InterruptStackFrame) {}

//save all registers
unsafe fn enter_kernel_trap() {
    asm!(
    "push es",
    "push ds",
    "push fs",
    "push gs",
    "pusha",
    "push ax", //save ax from future changing
    options(preserves_flags));

    asm!(
    "mov ds, ax",
    "mov es, ax",
    "pop ax",
    in("ax") u16::from(SegmentSelector::DATA),//the data is already here?
    options(preserves_flags));
}

unsafe fn leave_kernel_trap() {
    asm!(
    "popa",
    "pop gs",
    "pop fs",
    "pop ds",
    "pop es",
    options(preserves_flags));
}


//Migration to APIC
pub unsafe fn disable_pic() {
    asm!(
    "out 0xa1, al",
    "out 0x21, al",
    in("ax") 0xFF,
    options(preserves_flags, nomem, nostack));
}

pub fn init() {
    let table = unsafe { &mut INTERRUPT_TABLE };
    system::init_traps(table);
    table.set(IDTable::SYSTEM_CALL, InterruptGate::syscall(system::syscall));
    unsafe {
        pic::remap(IDTable::IRQ_MASTER_OFFSET as u8,
                   IDTable::IRQ_SLAVE_OFFSET as u8)
    };
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
pub fn set(index: usize, descriptor: InterruptGate) -> InterruptGate {
    let old = unsafe {
        INTERRUPT_TABLE.set(index, descriptor)
    };
    old
}

#[repr(C, packed)]
struct IDTHandle {
    table_size: u16,
    table_offset: *const InterruptGate,
}

unsafe impl Sync for IDTHandle {}

#[repr(C)]
struct IDTable {
    entries: [InterruptGate; MAX_INTERRUPTS_COUNT],
    lock: SpinLock,
    //the interrupt objects that should handle exceptions
    // objects: SimpleList<InterruptObject>
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
        ALIGNMENT_CHECK = 0x11, "alignment check, with error";
        //all others don't have error code
        SYSTEM_CALL = 0x80, "system call";
        //other reserved
        TRAP_COUNT = 32, "The average count of exception reserved by Intel";
        //The mapping of IRQ lines to IDT Table
        //The master's interrupts
        IRQ_MASTER_OFFSET = 33, "The first interrupt for master";
        SYS_TIMER = 33, "Scheduler and company";
        KEYBOARD = 34;
        CASCADE_SLAVE = 35;
        COM1 = 36;
        COM2 = 37;
        SOUND_CARD = 38;
        FLOPPY = 39;
        PRINTER = 40;
        //The slave's interrupts
        IRQ_SLAVE_OFFSET = 41, "The first interrupt for slave";
        CLOCK = 41;
        POWER = 42;
        NETWORK_CARD = 43, "Can be configured to any SCSI or NIC";
        // FREE = 44;
        MOUSE = 45;
        FLOAT_COPROC = 46;
        PRIMARY_ATA = 47;
        SECONDARY_ATA = 48;
    );
    pub const fn empty() -> Self {
        let entries: [InterruptGate; MAX_INTERRUPTS_COUNT] = [InterruptGate::null(); MAX_INTERRUPTS_COUNT];
        let lock = SpinLock::new();
        IDTable { entries, lock }
    }
    ///the size of table in bytes
    pub const fn byte_size(&self) -> usize {
        self.entries.len() * mem::size_of::<InterruptGate>()
    }
    pub fn set(&mut self, index: usize, descriptor: InterruptGate) -> InterruptGate {
        debug_assert!(index < self.entries.len(), "Invalid index for IDTable");
        let old: InterruptGate;
        self.lock.acquire();
        old = self.entries[index];
        self.entries[index] = descriptor;
        self.lock.release();
        old
    }
}


#[cfg(test)]
mod tests {
    extern crate std;
    extern crate alloc;

    use super::*;

    #[test]
    fn integrity_tests() {
        debug_assert!(
            mem::size_of::<InterruptGate>() == 8,
            "Invalid size of IDTEntry"
        );
        let table = IDTable::empty();
        assert_eq!(table.byte_size() <= u16::MAX as usize, true);
        assert_eq!(mem::size_of::<IDTHandle>(), 6);
    }
}
