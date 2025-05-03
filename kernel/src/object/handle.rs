use kernel_types::collections::{HashCode, HashKey};

use crate::memory::VirtualAddress;

use super::Object;

#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd)]
#[must_use]
pub struct Handle(pub VirtualAddress);

impl HashKey for Handle {
    fn hash_code(&self) -> HashCode {
        self.0 as HashCode
    }
}

impl Handle {
    pub fn object(&self) -> *const Object {
        self.0 as *const Object
    }
}
