#[macro_export]
macro_rules! get_eax {
    () => ({
        let value;
        core::arch::asm!(
          "",
          out("eax") value,
          options(preserves_flags, nomem, nostack)
        );
        value
    });
}

#[macro_export]
macro_rules! set_eax {
    ($value : expr) => ({
        core::arch::asm!(
          "",
          in("eax") $value,
          options(preserves_flags, nomem, nostack)
        );
    });
}

#[macro_export]
macro_rules! get_edx {
    () => ({
        let value;
        core::arch::asm!(
          "",
          out("edx") value,
          options(preserves_flags, nomem, nostack)
        );
        value
    });
}

#[macro_export]
macro_rules! set_edx {
    ($value : expr) => ({
        core::arch::asm!(
          "",
          in("edx") $value,
          options(preserves_flags, nomem, nostack)
        );
    });
}
