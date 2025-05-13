#![feature(allocator_api)]
#![no_std]
#![no_main]

mod pc;

use alloc::sync::Arc;
use kernel_lib::{
    io::{
        self,
        char::{not_supported_write, OpError},
        spin, IoTransaction, KernelBufMut, UserBufMut,
    },
    object::{Event, File, Handle, IndexNode},
};

static DEVICE_NAME: &str = "keyboard";

extern crate alloc;

#[cfg(not(test))]
#[panic_handler]
pub fn panic(info: &core::panic::PanicInfo) -> ! {
    kernel_lib::panic(info)
}

fn handle_irq(raw_lock: *const DriverContextLock) {
    let lock = unsafe { &*raw_lock };

    let scan_code = pc::read_scan_code().expect("Failed to read scan code");

    let mut context = lock.try_lock().unwrap();

    if let Err(scan_code) = context.scan_codes.push_back(scan_code) {
        let _ = context.scan_codes.pop_front();

        context
            .scan_codes
            .push_back(scan_code)
            .expect("Previous value was poped");
    }

    context.event.notify();
}

fn handle_read(file: Handle<File>, mut buf: UserBufMut) -> Result<(), OpError> {
    let context_lock = unsafe { &*file.context::<DriverContextLock>() };

    while buf.has_remaining_capacity() {
        let mut context = context_lock.try_lock().unwrap();

        if context.scan_codes.is_empty() {
            let event = context.event.clone();
            drop(context);
            event.block_on();
            continue;
        }

        if let Some(scan_code) = context.scan_codes.pop_front() {
            IoTransaction::new_write()
                .slice_to_buf(&[scan_code], &mut buf)
                .commit()?;
        }
    }

    Ok(())
}

fn handle_open(node: Handle<IndexNode>, file: Handle<File>) {

}

//allocation in user space
pub type DriverContextLock = spin::Mutex<DriverContext>;

pub struct DriverContext {
    pub scan_codes: heapless::Deque<u8, 255>,
    pub event: Handle<Event>,
}

#[export_name = "init"]
extern "C" fn driver_init() -> i32 {
    kernel_lib::log::init().expect("Failed to set logger");

    if io::char::register_device(io::char::Device {
        name: DEVICE_NAME.into(),
        ops: io::char::Operations {
            open: handle_open,
            read: handle_read,
            write: not_supported_write,
        },
    })
    .is_err()
    {
        return -1;
    };

    let Ok(event) = Handle::new_event() else {
        return -5;
    };

    let context = spin::Mutex::new(DriverContext {
        scan_codes: heapless::Deque::new(),
        event,
    });

    let Ok(boxed_context) = Arc::try_new(context) else {
        return -2;
    };

    if io::set_irq(32, handle_irq, Arc::into_raw(boxed_context)).is_err() {
        return -3;
    }

    log::info!("Driver is configured");

    0
}

#[export_name = "init"]
fn driver_exit() {}
