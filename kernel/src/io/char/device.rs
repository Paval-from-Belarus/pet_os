use kernel_types::{collections::LinkedList, drivers::Device};

use crate::{
    fs::{FileWork, IndexNodeItem},
    memory::ProcessId,
    object::Handle,
    user::queue::Queue,
};

//that's a
pub struct CharDevice {
    ///the id of driver + id of this device
    device: Device,
    module: ProcessId,
    //to easily create IndexNode
    count: usize,
    //the list of files opened on device
    inodes: LinkedList<'static, IndexNodeItem>,
    //the count of minor devices uses the device
    // count: usize,
    // currently, there is no need in several minor devices for device;
    // therefore, for the CharDevice only on IndexNode exists
    pub queue: Handle<Queue<FileWork>>,
}

impl CharDevice {}
