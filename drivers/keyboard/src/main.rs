#![feature(allocator_api)]
#![no_std]
#![no_main]

mod ps;

use alloc::{boxed::Box, sync::Arc};
use kernel_lib::{
    fs::{
        self, not_supported_ioctl, not_supported_write, File, FileOperations,
    },
    io::{self, char::register_module, IrqMessage},
    module,
    object::{Event, Mutex, Queue, UserBufMut},
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
        let context = Box::<DriverContextLock>::try_new_uninit()?;

        let boxed_context = Box::into_raw(context);

        register_module(io::char::CharModuleInfo {
            name: "keybrd".into(),
            ctx: boxed_context as *mut (),
        })?;

        let _ = ps::read_scan_code().expect("Failed to read scan code");

        let irq_queue = io::set_irq(1, None)?;

        let event = Event::new()?;

        let context = unsafe { &mut *boxed_context };
        context.write(Mutex::new(DriverContext {
            scan_codes: heapless::Deque::new(),
            event,
            irq_queue,
        }));

        let context = unsafe { context.assume_init_ref() };

        let arg = context as *const DriverContextLock as *const ();

        let irq_task = task::spawn(handle_irq, arg, 3)?;

        log::info!("Driver is configured. Irq Task: {}", irq_task.id);

        Ok(Self { irq_task })
    }

    fn ops() -> kernel_lib::ModuleOperations {
        FileOperations {
            read: handle_read,
            write: not_supported_write,
            ioctl: not_supported_ioctl,
        }
        .into()
    }
}

extern "C" fn handle_irq(ctx_ptr: *const ()) {
    let ctx = unsafe {
        let ptr = ctx_ptr as *const DriverContextLock;

        &*ptr
    };

    log::debug!("Keybrd irq task");

    let queue = ctx.lock().irq_queue.try_clone().unwrap();

    loop {
        let Some(_event) = queue.blocking_recv() else {
            break;
        };

        let scan_code = ps::read_scan_code().expect("Failed to read scan code");

        if let Some(letter) = scan_code {
            let mut ctx_lock = ctx.lock();

            if let Err(data) = ctx_lock.scan_codes.push_back(letter) {
                let _ = ctx_lock.scan_codes.pop_front().unwrap(); //remove key from buffer

                ctx_lock.scan_codes.push_back(data).unwrap();
            }

            log::debug!("new letter = {letter}");

            ctx_lock.event.notify_all().unwrap();
        }
    }

    log::debug!("irq queue is exit");

    task::terminate(1);

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
        let mut context = context_lock.lock();

        if context.scan_codes.is_empty() {
            let event = context.event.try_clone().unwrap();

            drop(context);

            log::debug!("waiting new key codes: {event:?}");

            event.wait().unwrap();

            continue;
        }

        if let Some(scan_code) = context.scan_codes.pop_front() {
            buf.push(scan_code as u8);
        }

        buf.flush().unwrap();
    }

    Ok(())
}

//allocation in user space
pub type DriverContextLock = Mutex<DriverContext>;

pub struct DriverContext {
    pub scan_codes: heapless::Deque<char, 255>,
    pub event: Event,
    pub irq_queue: Queue<IrqMessage>,
}
