use core::arch::asm;
use core::sync::atomic::AtomicUsize;
use core::{mem, ptr};

use kernel_macro::ListNode;
use kernel_types::collections::{BoxedNode, ListNode};
use kernel_types::io::IoOperation;
use kernel_types::{
    declare_constants, declare_types, get_eax, get_edx, set_eax, syscall,
};

use crate::common::io::{inb, inw, outb, outw};
use crate::io;
use crate::io::irq::IrqChain;
use crate::io::pic::PicLine;
use crate::memory::{
    self, slab_alloc, InterruptGate, PrivilegeLevel, SegmentSelector, Slab,
    SlabBox, SystemType, VirtualAddress,
};
use crate::task::TaskContext;
use crate::{current_task, object};

pub use lock::InterruptableLazyCell;

mod block;
mod char;
mod irq;
mod lock;
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
pub type SyscallHandler = unsafe extern "x86-interrupt" fn(InterruptStackFrame);
pub type ErrorExceptionHandler =
    extern "x86-interrupt" fn(InterruptStackFrame, usize);
///the interrupt callback that return true if interrupt was handle (and no more handling is required)
pub type Callback = fn(
    is_processed: bool,
    context: *mut (),
    frame: &mut *mut TaskContext,
) -> bool;

#[derive(Debug, ListNode)]
#[repr(C)]
pub struct CallbackInfo {
    driver: crate::object::RawHandle,
    callback: Callback,
    context: *mut (),
    #[list_pivots]
    next: ListNode<CallbackInfo>,
}

impl Slab for CallbackInfo {
    const NAME: &str = "int_callback";
}

impl BoxedNode for CallbackInfo {
    type Target = SlabBox<CallbackInfo>;

    fn into_boxed(node: &mut Self::Item) -> Self::Target {
        memory::into_boxed(node.into())
    }
}

impl CallbackInfo {
    //the default kernel callback with no context
    pub const fn new(callback: Callback) -> Self {
        Self {
            callback,
            driver: 0,
            context: ptr::null_mut(),
            next: ListNode::empty(),
        }
    }

    #[inline]
    pub fn invoke(
        &self,
        is_dispatched: bool,
        frame: &mut *mut TaskContext,
    ) -> bool {
        let callback = self.callback;
        callback(is_dispatched, self.context, frame)
    }
}

#[derive(Debug, Clone, Copy)]
pub struct IrqLine {
    //the index in InterruptTable
    interrupt: u8,
    line: PicLine,
}

macro_rules! irq_line {
    ($index: expr, $line: ident) => {
        IrqLine {
            interrupt: $index,
            line: $crate::io::pic::PicLine::$line,
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

impl From<IrqLine> for PicLine {
    fn from(value: IrqLine) -> Self {
        value.line
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
        use $crate::io::InterruptGate;
        InterruptGate::with_naked_handler(
            $handler,
            $crate::memory::SegmentSelector::KERNEL_CODE,
            $crate::io::TRAP,
        )
    }};
}
#[macro_export]
macro_rules! error_trap {
    ($handler: ident) => {{
        use $crate::io::InterruptGate;
        InterruptGate::with_error_handler(
            $handler,
            $crate::memory::SegmentSelector::KERNEL_CODE,
            $crate::io::TRAP,
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

    pub fn syscall(handler: SyscallHandler) -> Self {
        let offset = handler as *const NakedExceptionHandler as VirtualAddress;
        let mut gate =
            InterruptGate::new(offset, SegmentSelector::KERNEL_CODE, INTERRUPT);
        gate.flags.set_present(true);
        gate.flags.set_ring(PrivilegeLevel::USER);
        gate
    }
}

const MAX_INTERRUPTS_COUNT: usize = 256;

///the method to registry InterruptObject
pub fn registry(_handle: object::RawHandle, line: IrqLine, info: CallbackInfo) {
    let index = u8::from(line.line) as usize;
    let interceptors = INTERCEPTORS.try_lock().unwrap().unwrap();
    let manager = interceptors[index];
    manager.append(info);
}

//the red zone in thread kernel size:
//all segment registers + all base registers + InterStackFrame + error code + user-mode switching ― the worst case
pub const KERNEL_TRAP_SIZE: usize =
    4 * 2 + 8 * 4 + mem::size_of::<InterruptStackFrame>() + 4 + 4 * 2;

pub fn start_tx() {}

pub fn end_tx() {}

pub unsafe fn interpretate_op(op: &IoOperation) {
    use kernel_types::io::PortOperation;

    log::debug!("JIT: {op:X?}");

    match op {
        IoOperation::PortOperation(op) => match op {
            PortOperation::WriteByte { port, value } => {
                outb(*port, *value);
            }

            PortOperation::WriteWord { port, value } => {
                outw(*port, *value);
            }

            PortOperation::ReadByte { port, value } => {
                let read_byte = inb(*port);
                value.write_volatile(read_byte);
            }

            PortOperation::ReadWord { port, value } => {
                let read_word = inw(*port);
                value.write_volatile(read_word);
            }
        },
        IoOperation::MemoryOperation(_) => todo!(),
        IoOperation::MemoryCopy { .. } => todo!(),
    }
}

pub fn init() {
    let mut table = IDTable::empty();

    system::init_traps(&mut table);

    table.set(
        IDTable::SYSTEM_CALL,
        InterruptGate::syscall(system::_syscall),
    );

    table.set(
        IDTable::PROCCESS_EXIT,
        InterruptGate::syscall(system::terminate_process),
    );

    table.set(
        IDTable::MODULE_COMPLETE,
        InterruptGate::syscall(system::_module_complete),
    );

    unsafe {
        pic::remap(
            IrqLine::IRQ_MASTER_OFFSET as u8,
            IrqLine::IRQ_SLAVE_OFFSET as u8,
        )
    };

    init_interceptors(&mut table);

    unsafe {
        INTERRUPT_TABLE = table;
        INTERRUPT_TABLE_HANDLE = IDTHandle::new(&raw const INTERRUPT_TABLE);

        asm! {
        "lidt [eax]",
        in("eax") &raw const INTERRUPT_TABLE_HANDLE
        }
    }

    unsafe {
        if syscall!(syscall::RESERVED).is_ok() {
            let code: usize = get_edx!();
            if code == system::CHECK_CODE {
                return;
            }
        }

        panic!("failed to init interrupts");
    };
}

extern "C" {
    static INTERCEPTOR_STUB_ARRAY: [NakedExceptionHandler; pic::LINES_COUNT];
}

#[no_mangle]
static INTERCEPTORS: spin::Mutex<
    Option<[&'static IrqChain; pic::LINES_COUNT]>,
> = spin::Mutex::new(None);

#[inline(never)]
pub unsafe fn validate_stack() {
    let stack_size = current_task!().stack_size();

    log::debug!("task#{} IRQ stack size: {stack_size}", current_task!().id);

    if stack_size == 0 {
        panic!("Red Zone violated");
    }
}

///the interceptor_stub is invoked by corresponding asm stub for certain interrupt
///The following invarians are supported:
/// - All registers can be modified (pusha saves all)
/// - Interrupts are disabled (to prevent nested interrupts)
#[no_mangle]
#[allow(clippy::pointers_in_nomem_asm_block)]
pub unsafe extern "C" fn interceptor_stub() {
    let index: usize = get_eax!();
    let mut frame_ptr: *mut TaskContext = get_edx!();

    io::disable();

    validate_stack();

    asm! {
        "mov ds, ax",
        "mov es, ax",
        in("ax") u16::from(SegmentSelector::KERNEL_DATA),
        options(preserves_flags)
    };

    let chain = &mut INTERCEPTORS
        .try_lock()
        .expect("Busy loop on interrupts")
        .unwrap()[index];

    chain.dispatch(&mut frame_ptr);

    set_eax!(frame_ptr)
}

fn init_interceptors(table: &mut IDTable) {
    let objects = core::array::from_fn(|index| {
        let object = if index == IrqLine::SYS_TIMER.line_index() {
            system::init_timer_isr()
        } else {
            let pic_line = PicLine::try_from(index as u8)
                .expect("index cannot exceed array size");

            let object = slab_alloc(IrqChain::new(pic_line)).unwrap();

            SlabBox::leak(object)
        };

        let irq_line = IrqLine::from(object.line());
        let trap = unsafe { INTERCEPTOR_STUB_ARRAY[index] };
        table.set(irq_line.interrupt as usize, naked_trap!(trap));

        object
    });

    *INTERCEPTORS.try_lock().unwrap() = objects.into();
}
//this function is invoked directly from interrupt stub

const SUPPRESS_CALLBACK: CallbackInfo = CallbackInfo::new(suppress_irq);

const fn suppress_irq(
    _is_processed: bool,
    _context: *mut (),
    _frame: &mut *mut TaskContext,
) -> bool {
    false
}

/// set custom interrupt handler
pub fn set(index: usize, descriptor: InterruptGate) -> InterruptGate {
    let table = &raw mut INTERRUPT_TABLE;

    unsafe { (*table).set(index, descriptor) }
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

    pub const fn new(raw_table: *const IDTable) -> Self {
        let table = unsafe { &*raw_table };

        IDTHandle {
            table_size: table.byte_size().saturating_sub(1) as u16,
            table_offset: table.entries.as_ptr(),
        }
    }
}

static INTERRUPT_LOCK_REQUESTS: AtomicUsize = AtomicUsize::new(0);

pub unsafe fn disable() {
    asm!("cli", options(nomem, nostack));
}

pub unsafe fn enable() {
    asm!("sti", options(nomem, nostack));
}

/// true if interrupts are enabled
/// false if interrupts are disabled
pub unsafe fn status() -> bool {
    let is_flag_set: u8;

    core::arch::asm! {
        "pushfd",
        "pop eax",
        "test eax, 0x200",
        "setnz al",
        out("al") is_flag_set,
        options(nostack)
    };

    is_flag_set == 1
}

#[no_mangle]
static mut INTERRUPT_TABLE_HANDLE: IDTHandle = IDTHandle::null();

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
        PROCCESS_EXIT = 0x81, "proccess exit";
        MODULE_COMPLETE = 0x82, "module initialization is completed";
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
        assert!(table.byte_size() <= u16::MAX as usize);
        assert_eq!(mem::size_of::<IDTHandle>(), 6);
    }
}
