use crate::{
    io::{self, IoEvent},
    object::{Handle, KernelObject, RawHandle},
};

//not block device, but device partition
pub struct BlockDevice;

impl From<RawHandle> for BlockDevice {
    fn from(value: RawHandle) -> Self {
        todo!()
    }
}

impl KernelObject for BlockDevice {}

impl Handle<BlockDevice> {
    pub fn sector_size(&self) -> usize {
        512
    }

    pub fn read_sector(
        &self,
        _offset: usize,
        _buffer: &mut [u8],
    ) -> io::Result<Handle<IoEvent>> {
        todo!()
    }
}
