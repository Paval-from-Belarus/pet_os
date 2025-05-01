use core::ptr::NonNull;

use kernel_types::{collections::LinkedList, drivers::Device};

use crate::{
    fs::{FileOperations, IndexNodeItem},
    memory::ProcessId,
};

//that's a
pub struct CharDevice {
    ///the id of driver + id of this device
    device: Device,
    module: ProcessId,
    //to easily create IndexNode
    fs_ops: NonNull<FileOperations>,
    count: usize,
    //the list of files opened on device
    inodes: LinkedList<'static, IndexNodeItem>,
    //the count of minor devices uses the device
    // count: usize,
    // currently, there is no need in several minor devices for device;
    // therefore, for the CharDevice only on IndexNode exists
}

impl CharDevice {}
