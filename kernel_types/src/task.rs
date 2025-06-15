pub type FnTask = extern "C" fn();

#[derive(Debug, Clone)]
#[repr(C)]
pub struct TaskParams {
    pub args: *const (),
    pub routine: FnTask,
    pub nice: u16,
}
