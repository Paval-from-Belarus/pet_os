use super::block::OpError;

pub enum MemoryOperation {
    Write {},
}

#[derive(Debug, Clone, Copy)]
pub enum PortValue {
    Byte(u8),
    Word(u16),
}

pub enum PortOperation {
    WriteByte {
        port: u16,
        value: u8,
    },
    WriteWord {
        port: u16,
        value: u16,
    },
    ReadByte {
        port: u16,
    },
    ReadWord {
        port: u16,
    },
    ReadToMemory {
        port: u16,
        buffer: *mut u8,
        buffer_size: usize,
    },
}

pub enum IoOperation {
    PortOperation(PortOperation),
    MemoryOperation(MemoryOperation),
    MemoryCopy {
        source: *mut u8,
        destination: *mut u8,
        count: usize,
    },
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

#[cfg(feature = "alloc")]
#[repr(C)]
#[must_use]
pub struct IoTransaction<Kind: IoKind> {
    ops: alloc::vec::Vec<IoOperation>,
    _kind: Kind,
}

#[derive(Debug)]
#[repr(C)]
pub struct KernelBuffer {
    ptr: *mut u8,
    size: usize,
}

impl KernelBuffer {
    pub fn size(&self) -> usize {
        self.size
    }

    pub fn move_bytes(&mut self, _bytes: usize) -> Result<(), ()> {
        Ok(())
    }

    pub unsafe fn as_ptr(&self) -> *const u8 {
        self.ptr
    }
}

pub trait IoKind {}
pub struct Read;
pub struct Write;

impl IoKind for Read {}
impl IoKind for Write {}

impl IoTransaction<Read> {
    pub fn new_read() -> IoTransaction<Read> {
        Self {
            ops: alloc::vec![],
            _kind: Read,
        }
    }

    pub fn port_u8(self, _port: u16) -> Result<u8, OpError> {
        todo!()
    }

    pub fn port_u16(self, _port: u16) -> Result<u16, OpError> {
        todo!()
    }

    pub fn port_to_buffer(
        self,
        _port: u16,
        _buffer: &KernelBuffer,
    ) -> Result<(), OpError> {
        todo!()
    }
}

impl IoTransaction<Write> {
    pub fn new_write() -> IoTransaction<Write> {
        Self {
            ops: alloc::vec![],
            _kind: Write,
        }
    }

    pub fn port_u8(&mut self, port: u16, value: u8) -> &mut Self {
        self.ops
            .push(PortOperation::WriteByte { port, value }.into());

        self
    }

    pub fn port_u16(&mut self, port: u16, value: u16) -> &mut Self {
        self.ops
            .push(PortOperation::WriteWord { port, value }.into());

        self
    }

    pub fn commit(&mut self) -> Result<(), OpError> {
        Ok(())
    }
}

//какие типы операций могут быть:
//из одного куска памяти в другой (memcopy)
//из порта в какой-то один кусок памяти (один раз)
//из порта в какой-то кусок памяти (много раз), увеличение буфера
