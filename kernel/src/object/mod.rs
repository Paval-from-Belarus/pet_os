use kernel_types::collections::{HashCode, HashKey};

use crate::memory::VirtualAddress;

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd)]
pub struct Handle(VirtualAddress);

impl HashKey for Handle {
    fn hash_code(&self) -> HashCode {
        self.0 as HashCode
    }
}
