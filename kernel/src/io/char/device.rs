use kernel_types::drivers::Device;

use crate::{
    fs::FileWork, memory::ProcessId, object::Handle, user::queue::Queue,
};

//that's a
pub struct CharDevice {
    ///the id of driver + id of this device
    device: Device,
    module: ProcessId,
    //to easily create IndexNode
    count: usize,
    //the count of minor devices uses the device
    // count: usize,
    // currently, there is no need in several minor devices for device;
    // therefore, for the CharDevice only on IndexNode exists
    pub queue: Handle<Queue<FileWork>>,
}

impl CharDevice {}
