pub use physical::PhysicalAllocator;
pub use system::{
    classify_slab_by_size, Slab, SlabAlloc, SystemAllocator,
};

mod physical;
mod system;
