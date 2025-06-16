use kernel_types::{
    io::{IoOperation, PortOperation},
    syscall,
};

use crate::{io, object::KernelBufMut};

#[repr(C)]
#[must_use]
pub struct IoBatch<Kind: IoKind, const N: usize> {
    ops: heapless::Vec<IoOperation, N>,
    _kind: Kind,
}

pub trait IoKind {}

pub struct Read;
pub struct Write;

impl IoKind for Read {}
impl IoKind for Write {}

impl<const N: usize, K: IoKind> IoBatch<K, N> {
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
}

impl IoBatch<Read, 1> {
    pub fn new_read() -> IoBatch<Read, 1> {
        IoBatch {
            ops: heapless::Vec::new(),
            _kind: Read,
        }
    }
}

impl<const N: usize> IoBatch<Read, N> {
    pub fn port_u8(mut self, port: u16) -> io::Result<u8> {
        let mut v = 0u8;

        self.ops
            .push(
                PortOperation::ReadByte {
                    port,
                    value: &mut v,
                }
                .into(),
            )
            .unwrap();

        self.commit()?;

        Ok(v)
    }

    pub fn port_u16(mut self, port: u16) -> io::Result<u16> {
        let mut v = 0u16;

        self.ops
            .push(
                PortOperation::ReadWord {
                    port,
                    value: &mut v,
                }
                .into(),
            )
            .unwrap();

        self.commit()?;

        Ok(v)
    }

    pub fn port_to_buf(
        &mut self,
        port: u16,
        buf: &mut KernelBufMut,
    ) -> io::Result<()> {
        self.ops
            .push(
                PortOperation::ReadToBuf {
                    port,
                    buf: unsafe { buf.handle().syscall() },
                }
                .into(),
            )
            .unwrap();

        self.commit()?;

        Ok(())
    }
}

impl IoBatch<Write, 32> {
    pub fn new_write() -> IoBatch<Write, 32> {
        IoBatch {
            ops: heapless::Vec::new(),
            _kind: Write,
        }
    }
}

impl<const N: usize> IoBatch<Write, N> {
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
}
