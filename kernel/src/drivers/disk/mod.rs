mod ide;

///source code to create disk driver
///The main assumption is that each device
///known exactly about device
use crate::fs::FileOperations;

extern "C" {
    fn set_irq_handler();
}

pub fn init() {
    ide::probe();
}


