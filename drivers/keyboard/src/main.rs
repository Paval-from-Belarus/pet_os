#![feature(allocator_api)]
#![no_std]
#![no_main]

mod pc;

use alloc::sync::Arc;
use kernel_lib::{
    fs::{self, not_supported_write, File, FileOperations, IndexNode},
    io::{
        self,
        char::{not_supported_write, register_module},
        spin, IoTransaction, IrqEvent, UserBufMut,
    },
    module,
    object::{Event, Handle, Queue, RawHandle, UserBuf, UserBufMut},
    task::{self, TaskHandle},
    KernelModule, ModuleError,
};

static DEVICE_NAME: &str = "keyboard";

extern crate alloc;

pub struct KeyboardDriver {
    irq_task: TaskHandle,
}

module! {
    module: KeyboardDriver,
    name: "keybrd"
}

impl KernelModule for KeyboardDriver {
    fn init() -> Result<Self, ModuleError> {
        register_module(io::char::CharModuleInfo {
            name: "keybrd".into(),
            ctx: core::ptr::null_mut(),
        })?;

        let queue = io::set_irq(34, None)?;

        let event = Handle::new_event()?;

        let context = spin::Mutex::new(DriverContext {
            scan_codes: heapless::Deque::new(),
            event,
            queue,
        });

        let boxed_context = Arc::try_new(context)?;

        let arg = boxed_context.clone().as_ref() as *const DriverContextLock
            as *const ();

        let irq_task = task::spawn(handle_irq, arg)?;

        log::info!("Driver is configured");

        Ok(Self { irq_task })
    }

    fn ops() -> kernel_lib::ModuleOperations {
        FileOperations {
            read: handle_read,
            write: not_supported_write,
        }
        .into()
    }
}

fn handle_irq() {
    // let queue: Queue<IrqEvent> = unsafe {
    //     let handle: usize;
    //     core::arch::asm! {
    //         "",
    //         out("eax") handle
    //     };
    let lock: DriverContextLock = todo!();

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

fn handle_read(file: File, mut buf: UserBufMut) -> fs::Result<()> {
    let context_lock = unsafe { &*file.context::<DriverContextLock>() };

    while buf.has_remaining_capacity() {
        let mut context = context_lock.try_lock().unwrap();

        if context.scan_codes.is_empty() {
            let event = context.event.clone();
            drop(context);
            buf.flush().unwrap();
            event.block_on();
            continue;
        }

        if let Some(scan_code) = context.scan_codes.pop_front() {
            buf.push(scan_code);
        }
    }

    Ok(())
}

//allocation in user space
pub type DriverContextLock = spin::Mutex<DriverContext>;

pub struct DriverContext {
    pub scan_codes: heapless::Deque<u8, 255>,
    pub event: Handle<Event>,
    pub queue: Queue<IrqEvent>,
}
