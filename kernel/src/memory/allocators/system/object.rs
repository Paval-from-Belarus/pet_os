use super::{Alignment, SlabAlloc};

pub trait Slab: Sized {
    const NAME: &str = match core::mem::size_of::<Self>().next_power_of_two() {
        4 => "slab-4",
        8 => "slab-8",
        16 => "slab-16",
        32 => "slab-32",
        64 => "slab-64",
        _ => panic!("Custom size should be provided"),
    };

    const ALIGNMENT: Alignment = Alignment::Word;
}

pub fn classify_slab_by_size(size: usize) -> Option<SlabAlloc> {
    let size = size.next_power_of_two();
    let name = match size {
        4 => "slab-4",
        8 => "slab-8",
        16 => "slab-16",
        32 => "slab-32",
        64 => "slab-64",
        _ => return None,
    };

    SlabAlloc {
        size: size as u16,
        name,
        alignment: Alignment::CacheLine,
    }
    .into()
}
