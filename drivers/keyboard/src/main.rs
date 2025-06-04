#![feature(allocator_api)]
#![no_std]
#![no_main]

mod pc;

use alloc::sync::Arc;
use kernel_lib::{
    fs::{File, IndexNode},
    io::{self, char::not_supported_write, spin, IoTransaction, UserBufMut},
    module,
    object::{Event, Handle},
    KernelModule, ModuleError,
};

static DEVICE_NAME: &str = "keyboard";

extern crate alloc;

pub struct KeyboardDriver;

module! {
    module: KeyboardDriver,
    name: "keybrd"
}

impl KernelModule for KeyboardDriver {
    fn init() -> Result<Self, ModuleError> {
        io::char::register_device(io::char::Device {
            name: DEVICE_NAME.into(),
            ops: io::char::Operations {
                open: handle_open,
                read: handle_read,
                write: not_supported_write,
            },
        })?;

        let event = Handle::new_event()?;

        let context = spin::Mutex::new(DriverContext {
            scan_codes: heapless::Deque::new(),
            event,
        });

        let boxed_context = Arc::try_new(context)?;

        io::set_irq(32, handle_irq, Arc::into_raw(boxed_context))?;

        log::info!("Driver is configured");

        Ok(Self)
    }
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

fn handle_read(file: Handle<File>, mut buf: UserBufMut) -> io::Result<()> {
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

fn handle_open(_node: Handle<IndexNode>, _file: Handle<File>) {}

//allocation in user space
pub type DriverContextLock = spin::Mutex<DriverContext>;

pub struct DriverContext {
    pub scan_codes: heapless::Deque<u8, 255>,
    pub event: Handle<Event>,
}
