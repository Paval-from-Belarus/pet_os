use core::ptr::NonNull;

use kernel_macro::ListNode;
use kernel_types::{
    collections::{LinkedList, ListNode},
    drivers::{Device, DeviceId, DriverId}, io::block::BlockDeviceInfo,
};

use crate::{
    fs::FileOperations,
    memory::ProcessId,
    object::{self, Object},
    user::queue::Queue,
};

use super::IoWork;

pub const MAX_DEVICE_NAME_LEN: usize = 32;

pub struct BlockDevice {
    device: Device,
    module: ProcessId,
    // files: NonNull<IndexNode>,
    //generic block device fields
    first_partition: DeviceId,
    partitions: LinkedList<'static, Partition>,
    //remove field because linux uses it to represent in file system
    driver_name: [u8; 32],
    name: heapless::String<MAX_DEVICE_NAME_LEN>,
    ops: NonNull<FileOperations>,
    io_work: object::Handle<Queue<IoWork>>,
}

impl BlockDevice {
    // pub fn new_boxed(blk_dev: &BlockDeviceInfo) 
    //file operations are created from
    //blocK::Operations
    pub fn file_ops(&self) -> FileOperations {
        FileOperations {
            open: todo!(),
            flush: todo!(),
            close: todo!(),
            read: todo!(),
            write: todo!(),
            seek: todo!(),
            ioctl: todo!(),
        }
    }
}

fn open_block_device() {}

//the type alias using to represent sector
pub type Sector = usize;

#[derive(ListNode)]
pub struct Partition {
    #[list_pivots]
    pub node: ListNode<Partition>,
    pub start: Sector,
    pub size: Sector,
}
