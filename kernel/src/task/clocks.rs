#![allow(unused)]

use core::sync::atomic::AtomicUsize;
use core::sync::atomic::Ordering::SeqCst;
use kernel_types::declare_constants;

use crate::common::io;
use crate::common::time::Timestamp;
use crate::interrupts::pic;

pub enum ClockType {
    //the time since epoch
    Epoch,
    //the time from system boot
    Boot,
    //the total time consumed to corresponding thread
    ThreadConsumed,
}

///This upper level function is supposed to be really slow
///Do not use this in high performance places
pub fn now(_clocks: ClockType) -> Timestamp {
    todo!()
}

declare_constants!(
    pub usize,
    TIMEOUT = 20, "in milliseconds";
    TICKS = 2000000;
);
static TIME: AtomicUsize = AtomicUsize::new(0);

pub fn get_time_since_boot() -> usize {
    TIME.load(SeqCst)
}

#[macro_export]
macro_rules! ticks_now {
    () => {
        $crate::task::clocks::get_time_since_boot()
    };
}

#[macro_export]
macro_rules! ticks_size {
    () => {
        1
    };
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
