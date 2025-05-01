use core::ptr::NonNull;

use kernel_macro::ListNode;
use kernel_types::{
    collections::{LinkedList, ListNode},
    drivers::{Device, DeviceId, DriverId},
};

use crate::{
    fs::FileOperations,
    memory::ProcessId,
    object::{Object, Queue},
};

use super::WorkObject;

pub struct BlockDevice {
    device: Device,
    module: ProcessId,
    // files: NonNull<IndexNode>,
    //generic block device fields
    first_partition: DeviceId,
    partitions: LinkedList<'static, Partition>,
    //remove field because linux uses it to represent in file system
    driver_name: [u8; 32],
    ops: NonNull<FileOperations>,
    io_work: Queue<'static, Object>,
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
