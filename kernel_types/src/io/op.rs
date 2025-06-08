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
}

#[derive(Debug, Clone)]
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

#[derive(Debug)]
#[repr(C)]
pub struct KernelBuf {
    ptr: *mut u8,
    size: usize,
}

#[derive(Debug)]
#[repr(C)]
pub struct KernelBufMut {
    ptr: *mut u8,
    size: usize,
}

#[derive(Debug)]
#[repr(C)]
pub struct UserBuf {
    ptr: *mut u8,
    size: usize,
}

#[derive(Debug)]
#[repr(C)]
pub struct UserBufMut {
    ptr: *mut u8,
    size: usize,
}

impl UserBufMut {
    /// the capacity available to be filled
    pub fn remaining_capacity(&self) -> usize {
        self.size
    }

    pub fn has_remaining_capacity(&self) -> bool {
        self.remaining_capacity() != 0
    }
}

impl KernelBuf {
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

impl KernelBufMut {
    pub fn remaining_capacity(&self) -> usize {
        self.size
    }
}
