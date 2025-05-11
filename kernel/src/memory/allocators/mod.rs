pub use physical::PhysicalAllocator;
pub use system::{
    classify_slab_by_size, Alignment, AllocContext, Slab, SlabAlloc,
    SystemAllocator,
};

mod physical;
mod system;
