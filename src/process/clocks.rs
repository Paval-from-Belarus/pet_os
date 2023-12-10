use core::sync::atomic::AtomicUsize;
use core::sync::atomic::Ordering::SeqCst;
use crate::{declare_constants};
use crate::interrupts::pic;
use crate::utils::io;

declare_constants!(
    pub usize,
    TIMEOUT = 20, "in milliseconds";
    TICKS = 2000000;
);
static TIME: AtomicUsize = AtomicUsize::new(0);

pub fn get_time_since_boot() -> usize {
    TIME.load(SeqCst)
}

pub fn init() {
    const DEFAULT_FREQUENCY: u32 = 1193180;
    let divisor: u32 = DEFAULT_FREQUENCY / 50;
    let low = (divisor & 0xFF) as u8;
    let high = ((divisor >> 8) & 0xFF) as u8;
    unsafe {
        io::outb(0x43, 0x36);
        io::outb(0x40, low);
        io::outb(0x40, high);
    };
}

pub fn update_time() {
    pic::complete(pic::PicLine::IRQ0);
    let _ = TIME.fetch_add(TIMEOUT, SeqCst);
}
