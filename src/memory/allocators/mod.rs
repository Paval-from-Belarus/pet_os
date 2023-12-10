mod physical;
mod system;
mod utils;

use core::mem;
pub use system::{SlabAllocator, SlabPiece, Alignment};
pub use physical::PhysicalAllocator;
