use crate::declare_constants;
declare_constants!(
    pub usize,
    MAX_PID_COUNT = u16::MAX as usize, "The maximal count of unique processes in the system";
);
pub struct PidBitmap {
    map: usize,

}
#[repr(transparent)]
struct Pid {
    value: usize,
}