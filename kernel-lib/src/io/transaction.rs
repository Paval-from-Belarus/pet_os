use kernel_types::{
    io::{self, IoOperation, KernelBufMut, PortOperation, UserBufMut},
    syscall,
};

#[repr(C)]
#[must_use]
pub struct IoTransaction<Kind: IoKind, const N: usize> {
    ops: heapless::Vec<IoOperation, N>,
    _kind: Kind,
}

pub trait IoKind {}
pub struct Read;
pub struct Write;

impl IoKind for Read {}
impl IoKind for Write {}

impl IoTransaction<Read, 32> {
    pub fn new_read() -> IoTransaction<Read, 32> {
        IoTransaction {
            ops: heapless::Vec::new(),
            _kind: Read,
        }
    }
}

impl<const N: usize> IoTransaction<Read, N> {
    pub fn port_u8(self, _port: u16) -> io::Result<u8> {
        todo!()
    }

    pub fn port_u16(self, _port: u16) -> io::Result<u16> {
        todo!()
    }

    pub fn port_to_buf(
        self,
        _port: u16,
        _buffer: &mut KernelBufMut,
    ) -> io::Result<()> {
        todo!()
    }
}

impl IoTransaction<Write, 32> {
    pub fn new_write() -> IoTransaction<Write, 32> {
        IoTransaction {
            ops: heapless::Vec::new(),
            _kind: Write,
        }
    }
}

impl<const N: usize> IoTransaction<Write, N> {
    pub fn port_u8(&mut self, port: u16, value: u8) -> &mut Self {
        self.ops
            .push(PortOperation::WriteByte { port, value }.into())
            .unwrap();

        self
    }

    pub fn port_u16(&mut self, port: u16, value: u16) -> &mut Self {
        self.ops
            .push(PortOperation::WriteWord { port, value }.into())
            .unwrap();

        self
    }

    pub fn commit(&mut self) -> io::Result<()> {
        unsafe {
            syscall!(
                syscall::Request::IoOperation,
                ecx: self.ops.len(),
                edx: self.ops.as_ptr(),
            )?;
        }

        Ok(())
    }

    pub fn slice_to_buf(
        &mut self,
        _slice: &[u8],
        _buf: &mut UserBufMut,
    ) -> &mut Self {
        self
    }
}
