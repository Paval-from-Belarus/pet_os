use core::ptr::NonNull;

use kernel_macro::ListNode;
use kernel_types::{
    collections::{LinkedList, ListNode},
    drivers::{Device, DeviceId, DriverId},
    io::block::BlockDeviceInfo,
};

use crate::{
    memory::ProcessId,
    object::{self, Object},
    user::queue::Queue,
};

use super::BlockWork;

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
    queue: object::Handle<Queue<BlockWork>>,
}

//the type alias using to represent sector
pub type Sector = usize;

#[derive(ListNode)]
pub struct Partition {
    #[list_pivots]
    pub node: ListNode<Partition>,
    pub start: Sector,
    pub size: Sector,
}
