use crate::{
    io::{self, IoEvent},
    object::{Handle, KernelObject},
};

//not block device, but device partition
pub struct BlockDevice;

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
