#![feature(allocator_api)]
#![no_std]
#![no_main]

mod ps;

use alloc::sync::Arc;
use kernel_lib::{
    fs::{self, not_supported_write, File, FileOperations},
    io::{self, char::register_module, spin, IrqMessage},
    module,
    object::{Event, Queue, UserBufMut},
    task::{self, TaskHandle},
    KernelModule, ModuleError,
};

extern crate alloc;

#[allow(unused)]
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

        let irq_queue = io::set_irq(1, None)?;

        let event = Event::new()?;

        let context = spin::Mutex::new(DriverContext {
            scan_codes: heapless::Deque::new(),
            event,
            irq_queue,
        });

        let boxed_context = Arc::try_new(context)?;

        let arg = Arc::into_raw(boxed_context.clone()) as *const ();

        let irq_task = task::spawn(handle_irq, arg)?;

        ps::init();

        log::info!("Driver is configured. Irq Task: {}", irq_task.id);

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

extern "C" fn handle_irq() {
    let ctx = unsafe {
        let ctx_ptr: *const DriverContextLock;
        core::arch::asm! {
            "",
            out("ebx") ctx_ptr
        };

        Arc::from_raw(ctx_ptr)
    };

    log::debug!("Keybrd irq task");

    let queue = ctx.try_lock().unwrap().irq_queue.try_clone().unwrap();

    loop {
        let Some(_event) = queue.blocking_recv() else {
            break;
        };

        let scan_code = ps::read_scan_code().expect("Failed to read scan code");

        log::debug!("key read: {scan_code}");
    }

    log::debug!("irq queue is exit");

    loop {}

    // let mut context = ctx.try_lock().unwrap();

    // if let Err(scan_code) = context.scan_codes.push_back(scan_code) {
    //     let _ = context.scan_codes.pop_front();
    //
    //     context
    //         .scan_codes
    //         .push_back(scan_code)
    //         .expect("Previous value was poped");
    // }
    //
    // context.event.notify();
}

fn handle_read(file: File, mut buf: UserBufMut) -> fs::Result<()> {
    let context_lock = unsafe { &*file.ctx::<DriverContextLock>() };

    while buf.has_remaining_capacity() {
        let mut context = context_lock.try_lock().unwrap();
        if context.scan_codes.is_empty() {
            let event = context.event.try_clone().unwrap();
            drop(context);
            buf.flush().unwrap();
            event.wait().unwrap();
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
    pub event: Event,
    pub irq_queue: Queue<IrqMessage>,
}
