use crate::declare_constants;

pub type Result<T> = core::result::Result<T, SyscallError>;

declare_constants! {
    pub u32,
    RESERVED = 0xFFFF_FFFF, "No function to zero can be used; this function used to test system initialization";
    MIN_MODULE_REQUEST_CODE = 0x80
}

#[derive(Debug, Clone, Copy, num_enum::TryFromPrimitive)]
#[repr(u32)]
pub enum Request {
    PrintK = 0x02,
    /// map physical memory to virtual memory in driver
    MemRemap = 0x03,

    RegBlockDevice = MIN_MODULE_REQUEST_CODE,
    RegCharDevice,
    RegFs,

    CloneHandle,

    IoOperation,

    //copy from kernel space to user space
    KernelCopy,
    //copy from user space to kernel space
    UserCopy,

    GetModuleInfo,
    GetObjectInfo,

    TerminateCurrentTask,
    SpawnTask,
    SetIrqHandler,
    TerminateCurrentProcess,

    FreeKernelObject,

    QueueBlockingGet,
    QueueTryGet,

    //event operations
    EventNew,
    EventBlock,
    EventNotifyOne,
    EventNotifyAll,
}

impl Request {
    pub const fn is_module_request(&self) -> bool {
        let code = *self as u32;

        code >= MIN_MODULE_REQUEST_CODE
    }
}

#[derive(Debug, num_enum::FromPrimitive, thiserror_no_std::Error)]
#[repr(u32)]
pub enum SyscallError {
    NotSupported = 1,
    InvalidData = 2,
    /// Call to user-space operation from kernel space
    KernelSpaceCall = 3,
    /// Operation is not available as
    /// target resource is busy
    BusyResource = 4,

    NoMemory = 5,

    InvalidQueueKind = 6,
    QueueIsEmpty = 7,
    ModuleIsNotFound = 8,
    InvalidModuleParams = 9,

    NoSpaceInBuffer = 10,

    #[num_enum(default)]
    Failed = 0x42,
}

#[macro_export]
macro_rules! syscall {
    ( $id:expr
     $(, ecx: $ecx:expr)? $(, edx: $edx:expr)?
     $(, ecx_out: $ecx_out: ident )?
     $(, edx_out: $edx_out: ident )?
     $(,)?) => ({
        let mut id = $id as u32;
        let _ecx_out: usize;
        let _edx_out: usize;

        core::arch::asm!(
          "int 80h",
           lateout("ecx") _ecx_out,
           lateout("edx") _edx_out,
           inout("eax") id
           $(,in("ecx") $ecx)?
           $(,in("edx") $edx)?
        );

        $($ecx_out = _ecx_out;)?
        $($edx_out = _edx_out;)?

        let status = id;

        if status == 0 {
            Ok(())
        } else {
            let cause = $crate::syscall::SyscallError::from(status);
            Err(cause)
        }
    });
}
