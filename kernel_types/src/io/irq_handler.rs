use super::IoOperation;

#[repr(C)]
pub struct IrqHandler {
    pub line: u8,
    pub hook: Option<IoOperation>,
}
