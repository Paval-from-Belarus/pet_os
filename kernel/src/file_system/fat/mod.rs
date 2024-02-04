use kernel_types::bitflags;
bitflags! {
    pub FatAttributes(u16),
    SYSTEM = 0x01
}
