use kernel_types::syscall;

pub fn terminate(code: i32) -> ! {
    unsafe {
        core::arch::asm! {
            "int 80h",
            in("eax") syscall::Request::TerminateCurrentTask as u32,
            in("edx") code,
            options(noreturn)
        }
    }
}
