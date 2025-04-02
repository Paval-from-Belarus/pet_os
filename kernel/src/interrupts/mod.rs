use core::arch::asm;
use core::{mem, ptr};

use kernel_macro::ListNode;
use kernel_types::collections::TinyListNode;
use kernel_types::{declare_constants, declare_types};

use crate::common::atomics::SpinLockLazyCell;
use crate::drivers::Handle;
use crate::interrupts::object::InterruptObject;
use crate::interrupts::pic::PicLine;
use crate::memory::AllocationStrategy::Kernel;
use crate::memory::{
    InterruptGate, PrivilegeLevel, SegmentSelector, Slab, SystemType,
    VirtualAddress,
};
use crate::{get_eax, memory, syscall};

mod lock;
mod object;
pub(crate) mod pic;
mod system;

#[derive(Debug)]
#[repr(C)] //the wrapper on real stack frame
pub struct InterruptStackFrame {
    ip: usize,
    cs: usize,
    flags: usize,

    //only for kernel-user mode switching
    esp: usize,
    ss: usize,
}

pub type NakedExceptionHandler = extern "x86-interrupt" fn(InterruptStackFrame);
pub type ErrorExceptionHandler =
    extern "x86-interrupt" fn(InterruptStackFrame, usize);
///the interrupt callback that return true if interrupt was handle (and no more handling is required)
pub type Callback = fn(is_processed: bool, context: *mut ()) -> bool;

#[derive(Debug, ListNode)]
pub struct CallbackInfo {
    driver: Handle,
    callback: Callback,
    context: *mut (),
    #[list_pivot]
    next: TinyListNode<CallbackInfo>,
}

impl Slab for CallbackInfo {
    const NAME: &str = "int_callback";
}

impl CallbackInfo {
    //the default kernel callback with no context
    pub const fn default(callback: Callback) -> Self {
        Self {
            callback,
            driver: Handle::KERNEL,
            context: ptr::null_mut(),
            next: TinyListNode::empty(),
        }
    }
    #[inline]
    pub fn invoke(&self, is_dispatched: bool) -> bool {
        let callback = self.callback;
        callback(is_dispatched, self.context)
    }
}

pub struct IrqLine {
    interrupt: u8,
    //the index in InterruptTable
    line: PicLine,
}
macro_rules! irq_line {
    ($index: expr, $line: ident) => {
        IrqLine {
            interrupt: $index,
            line: $crate::interrupts::pic::PicLine::$line,
        }
    };
}
impl From<PicLine> for IrqLine {
    fn from(line: PicLine) -> Self {
        use PicLine::*;
        match line {
            IRQ0 => IrqLine::SYS_TIMER,
            IRQ1 => IrqLine::KEYBOARD,
            IRQ2 => IrqLine::CASCADE_SLAVE,
            IRQ3 => IrqLine::COM1,
            IRQ4 => IrqLine::COM2,
            IRQ5 => IrqLine::SOUND_CARD,
            IRQ6 => IrqLine::FLOPPY,
            IRQ7 => IrqLine::PRINTER,
            IRQ8 => IrqLine::CLOCKS,
            IRQ9 => IrqLine::POWER,
            IRQ10 => IrqLine::NETWORK_CARD,
            IRQ11 => IrqLine::UNUSED,
            IRQ12 => IrqLine::MOUSE,
            IRQ13 => IrqLine::FLOAT_COPROC,
            IRQ14 => IrqLine::PRIMARY_ATA,
            IRQ15 => IrqLine::SECONDARY_ATA,
        }
    }
}

impl IrqLine {
    declare_constants! {
        pub IrqLine,
        SYS_TIMER = irq_line!(32, IRQ0), "Scheduler and company";
        KEYBOARD = irq_line!(34, IRQ1);
        CASCADE_SLAVE = irq_line!(35, IRQ2);
        COM1 = irq_line!(36, IRQ3);
        COM2 = irq_line!(37, IRQ4);
        SOUND_CARD = irq_line!(38, IRQ5);
        FLOPPY = irq_line!(39, IRQ6);
        PRINTER = irq_line!(40, IRQ7);
        CLOCKS = irq_line!(41, IRQ8);
        POWER = irq_line!(42, IRQ9);
        NETWORK_CARD = irq_line!(43, IRQ10);
        UNUSED = irq_line!(44, IRQ11);
        MOUSE = irq_line!(45,  IRQ12);
        FLOAT_COPROC = irq_line!(46, IRQ13);
        PRIMARY_ATA = irq_line!(47, IRQ14);
        SECONDARY_ATA = irq_line!(48, IRQ15);
    }

    declare_constants! {
        pub usize,
        //The mapping of IRQ lines to IDT Table
        //The master's interrupts
        IRQ_MASTER_OFFSET = 32, "The first interrupt for master";
        IRQ_SLAVE_OFFSET = 41, "The first interrupt for slave"
    }

    pub fn line_index(&self) -> usize {
        (self.line as u8) as usize
    }
}

declare_types! {
    pub SystemType as wrap,
    INTERRUPT = SystemType::INTERRUPT_32BIT;
    TRAP = SystemType::TRAP_32BIT;
}

#[macro_export]
macro_rules! naked_trap {
    ($handler:ident) => {{
        use $crate::interrupts::InterruptGate;
        InterruptGate::with_naked_handler(
            $handler,
            $crate::memory::SegmentSelector::CODE,
            $crate::interrupts::TRAP,
        )
    }};
}
#[macro_export]
macro_rules! error_trap {
    ($handler: ident) => {{
        use $crate::interrupts::InterruptGate;
        InterruptGate::with_error_handler(
            $handler,
            $crate::memory::SegmentSelector::CODE,
            $crate::interrupts::TRAP,
        )
    }};
}
impl InterruptGate {
    pub fn with_naked_handler(
        handler: NakedExceptionHandler,
        selector: SegmentSelector,
        attributes: SystemType,
    ) -> Self {
        let handler_offset =
            handler as *const NakedExceptionHandler as VirtualAddress;
        let mut instance =
            InterruptGate::new(handler_offset, selector, attributes);
        instance.flags.set_present(true);
        instance
    }

    pub fn with_error_handler(
        handler: ErrorExceptionHandler,
        selector: SegmentSelector,
        attributes: SystemType,
    ) -> Self {
        let handler_offset =
            handler as *const ErrorExceptionHandler as VirtualAddress;
        let mut instance =
            InterruptGate::new(handler_offset, selector, attributes);
        instance.flags.set_present(true);
        instance
    }

    pub fn syscall(handler: NakedExceptionHandler) -> Self {
        let offset = handler as *const NakedExceptionHandler as VirtualAddress;
        let mut instance =
            InterruptGate::new(offset, SegmentSelector::CODE, INTERRUPT);
        instance.flags.set_present(true);
        unsafe {
            instance
                .flags
                .set_ring(PrivilegeLevel::wrap(PrivilegeLevel::USER))
        };
        instance
    }
}

const MAX_INTERRUPTS_COUNT: usize = 256;

///the method to registry InterruptObject
pub fn registry(_handle: Handle, line: IrqLine, info: CallbackInfo) {
    let index = u8::from(line.line) as usize;
    let interceptors = INTERCEPTORS.get();
    let manager = interceptors[index];
    manager.append(info);
}

//the red zone in thread kernel size:
//all segment registers + all base registers + InterStackFrame + error code + user-mode switching ― the worst case
pub const KERNEL_TRAP_SIZE: usize =
    4 * 2 + 8 * 4 + mem::size_of::<InterruptStackFrame>() + 4 + 4 * 2;

//save all registers
unsafe fn enter_kernel_trap() {
    asm!(
        "push es",
        "push ds",
        "push fs",
        "push gs",
        "pusha",
        "push ax", //save ax from future changing
        options(preserves_flags)
    );
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
        options(preserves_flags)
    );
}

pub fn init() {
    let mut table = INTERRUPT_TABLE.try_write().expect("Single core");

    system::init_traps(&mut table);

    table.set(
        IDTable::SYSTEM_CALL,
        InterruptGate::syscall(system::syscall),
    );

    unsafe {
        pic::remap(
            IrqLine::IRQ_MASTER_OFFSET as u8,
            IrqLine::IRQ_SLAVE_OFFSET as u8,
        )
    };

    init_interceptors(&mut table);

    unsafe {
        INTERRUPT_TABLE_HANDLE = IDTHandle::new(&table);

        asm!(
        "lidt [eax]",
        in("eax") &raw const INTERRUPT_TABLE_HANDLE
        )
    }

    unsafe {
        syscall!(system::RESERVED_SYSCALL);

        let code: usize = get_eax!();
        if code == system::INVALID {
            panic!("failed to init interrupts");
        }
    };
}

extern "C" {
    static INTERCEPTOR_STUB_ARRAY: [NakedExceptionHandler; pic::LINES_COUNT];
}

#[no_mangle]
static INTERCEPTORS: SpinLockLazyCell<
    [&'static InterruptObject; pic::LINES_COUNT],
> = SpinLockLazyCell::empty();

///the interceptor_stub is invoked by corresponding asm stub for certain interrupt
#[no_mangle]
pub unsafe extern "C" fn interceptor_stub() {
    let index: usize = get_eax!();

    enter_kernel_trap();

    let object = &mut INTERCEPTORS.get()[index];

    object.dispatch();
    leave_kernel_trap();
}

fn init_interceptors(table: &mut IDTable) {
    let mut created_objects = system::init_irq();

    for (index, object_option) in created_objects.iter_mut().enumerate() {
        if object_option.is_none() {
            let line = PicLine::try_from(index as u8)
                .expect("index cannot exceed array size");

            let raw_object = memory::slab_alloc_old::<InterruptObject>(Kernel)
                .expect("Failed to alloc task struct");

            let object = raw_object.write(InterruptObject::new(line));
            *object_option = Some(object);
        }
    }

    let interceptors = created_objects
        .map(|object| object.expect("The object is already initialized"));

    for (index, object) in interceptors.iter().enumerate() {
        let irq_line = IrqLine::from(object.line());
        let trap = unsafe { INTERCEPTOR_STUB_ARRAY[index] };
        table.set(irq_line.interrupt as usize, naked_trap!(trap));
    }

    let _ = INTERCEPTORS.set(interceptors);
}
//this function is invoked directly from interrupt stub

const SUPPRESS_CALLBACK: CallbackInfo = CallbackInfo::default(suppress_irq);

const fn suppress_irq(_is_processed: bool, _context: *mut ()) -> bool {
    false
}

/// set custom interrupt handler
pub fn set(index: usize, descriptor: InterruptGate) -> InterruptGate {
    let mut table = INTERRUPT_TABLE
        .try_write()
        .expect("Already taken in single core");

    table.set(index, descriptor)
}

#[derive(Debug)]
#[repr(C, packed)]
struct IDTHandle {
    table_size: u16,
    table_offset: *const InterruptGate,
}

unsafe impl Sync for IDTHandle {}

#[repr(C)]
struct IDTable {
    entries: [InterruptGate; MAX_INTERRUPTS_COUNT],
    //the interrupt objects that should handle exceptions
    // objects: SimpleList<InterruptObject>
}

unsafe impl Sync for IDTable {}

unsafe impl Send for IDTable {}

impl IDTHandle {
    pub const fn null() -> Self {
        Self {
            table_size: 0,
            table_offset: ptr::null_mut(),
        }
    }

    pub const fn new(table: &IDTable) -> Self {
        IDTHandle {
            table_size: table.byte_size().saturating_sub(1) as u16,
            table_offset: table.entries.as_ptr(),
        }
    }
}

#[inline(always)]
pub unsafe fn disable() {
    asm!("cli", options(nomem, nostack));

    log::debug!("Disable interrupts");
}

#[inline(always)]
pub unsafe fn enable() {
    log::debug!("Enable interrupts");

    asm!("sti", options(nomem, nostack));

}

#[no_mangle]
static mut INTERRUPT_TABLE_HANDLE: IDTHandle = IDTHandle::null();

#[no_mangle]
static INTERRUPT_TABLE: spin::RwLock<IDTable> =
    spin::RwLock::new(IDTable::empty());

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
    );

    pub const fn empty() -> Self {
        let entries: [InterruptGate; MAX_INTERRUPTS_COUNT] =
            [InterruptGate::null(); MAX_INTERRUPTS_COUNT];
        IDTable { entries }
    }
    ///the size of table in bytes
    pub const fn byte_size(&self) -> usize {
        self.entries.len() * mem::size_of::<InterruptGate>()
    }

    pub fn set(
        &mut self,
        index: usize,
        descriptor: InterruptGate,
    ) -> InterruptGate {
        assert!(index < self.entries.len(), "Invalid index for IDTable");

        let old = self.entries[index];
        self.entries[index] = descriptor;

        old
    }
}

#[cfg(test)]
mod tests {
    extern crate alloc;
    extern crate std;

    use super::*;

    #[test]
    fn integrity_tests() {
        assert_eq!(
            mem::size_of::<InterruptGate>(),
            8,
            "Invalid size of IDTEntry"
        );

        let table = IDTable::empty();
        assert_eq!(table.byte_size() <= u16::MAX as usize, true);
        assert_eq!(mem::size_of::<IDTHandle>(), 6);
    }
}
