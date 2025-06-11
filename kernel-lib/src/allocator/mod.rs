use talc::{ClaimOnOom, Span, Talc, Talck};

#[cfg(feature = "driver")]
mod driver;

static mut ARENA: [u8; 10_000] = [0; 10_000];

#[global_allocator]
static ALLOCATOR: Talck<spin::Mutex<()>, ClaimOnOom> =
    Talc::new(unsafe { ClaimOnOom::new(Span::from_array(&raw mut ARENA)) })
        .lock();

