use kernel_types::io::IoOperation;

use crate::common::io;

#[derive(Debug, Clone, Copy)]
pub enum HookOperation {
    PortWrite { port: u16, value: PortValue },
    MemoryWrite { address: u32, value: MemoryValue },
}

#[derive(Debug, Clone, Copy)]
pub enum PortValue {
    Byte(u8),
    Word(u16),
}

#[derive(Debug, Clone, Copy)]
pub enum MemoryValue {
    Byte(u8),
    Word(u16),
    DoubleWord(u32),
}

pub unsafe fn handle_irq(op: HookOperation) {
    match op {
        HookOperation::PortWrite { port, value } => match value {
            PortValue::Byte(byte) => io::outb(port, byte),
            PortValue::Word(word) => io::outw(port, word),
        },

        HookOperation::MemoryWrite { address, value } => match value {
            MemoryValue::Byte(byte) => {
                (address as *mut u8).write_volatile(byte);
            }
            MemoryValue::Word(word) => {
                (address as *mut u16).write_volatile(word);
            }
            MemoryValue::DoubleWord(dword) => {
                (address as *mut u32).write_volatile(dword);
            }
        },
    }
}
