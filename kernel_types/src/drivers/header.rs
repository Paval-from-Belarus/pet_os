use super::DriverId;

pub enum DriverKind {
    /// the driver is intended to use io regulary
    Device = 1,
    /// the driver expose functionality of the new file system
    FileSystem = 2,
}

pub struct DriverOperations {
    pub init: fn() -> Result<(), usize>,
}
