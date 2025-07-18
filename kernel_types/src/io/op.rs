#[derive(Debug, Clone)]
pub enum MemoryOperation {
    Write {},
}

#[derive(Debug, Clone, Copy)]
pub enum PortValue {
    Byte(u8),
    Word(u16),
}

#[derive(Debug, Clone)]
pub enum PortOperation {
    WriteByte { port: u16, value: u8 },
    WriteWord { port: u16, value: u16 },

    ReadByte { port: u16, value: *mut u8 },
    ReadWord { port: u16, value: *mut u16 },

    ReadBytesToBuf { port: u16, buf: usize },
    ReadWordsToBuf { port: u16, buf: usize },
}

#[derive(Debug, Clone)]
pub enum IoOperation {
    PortOperation(PortOperation),
    MemoryOperation(MemoryOperation),
}

impl From<PortOperation> for IoOperation {
    fn from(value: PortOperation) -> Self {
        Self::PortOperation(value)
    }
}

impl From<MemoryOperation> for IoOperation {
    fn from(value: MemoryOperation) -> Self {
        Self::MemoryOperation(value)
    }
}
