use crate::bitflags;
bitflags! {
    pub FatAttributes(u16),
    SYSTEM = 0x01
}
