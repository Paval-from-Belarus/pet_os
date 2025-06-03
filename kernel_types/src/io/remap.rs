/// remap physical memory with read-write permissions
/// physical memory can be controlled only via single user
#[derive(Debug, Clone)]
#[repr(C)]
pub struct MemoryRemap {
    pub physical_start: usize,
    pub virtual_start: usize,

    pub len: usize,
}
