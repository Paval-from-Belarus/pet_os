use bitflags::bitflags;

pub struct PageDirectory {

}

pub struct PageTable {

}

pub struct TableEntry {

}

pub struct DirectoryEntry {

}
impl DirectoryEntry {
    const HUGE_SIZE: usize = 0b10_000_000;
    const ACCESSED: usize = 0b100_000;
    const CACHE_DISABLED: usize = 0b10_000;
    const WRITE_THROUGH: usize = 0b1000;
    const NO_PRIVILEGE: usize = 0b100;
    const WRITABLE: usize = 0b10;
    const EMPTY: usize = 0b0;
}

impl TableEntry {
    const GLOBAL: usize = 0b10_000_000;
    const DIRTY: usize = 0b10_000_000;
    const ACCESSED: usize = 0b100_000;
    const CACHE_DISABLED: usize = 0b10_000;
    const WRITE_THROUGH: usize = 0b1000;
    const NO_PRIVILEGE: usize = 0b100;
    const WRITABLE: usize = 0b10;
    const EMPTY: usize = 0b0;
}
