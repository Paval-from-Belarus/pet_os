use kernel_types::syscall;

pub fn exit(code: i32) -> ! {
    log::info!("Terminating with code: {code}");

    unsafe {
        core::arch::asm! {
            "int 80",
            in("eax") syscall::Request::TerminateCurrentTask as u32,
            in("edx") code,
            options(noreturn)
        }
    }
}
