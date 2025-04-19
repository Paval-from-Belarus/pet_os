pub use physical::PhysicalAllocator;
pub use system::{
    classify_slab_by_size, Alignment, Slab, SlabAlloc, SystemAllocator,
};

mod physical;
mod system;
