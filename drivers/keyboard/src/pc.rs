use kernel_lib::io::{self, IoBatch};

pub fn read_scan_code() -> io::Result<char> {
    let keycode = IoBatch::new_read().port_u8(0x60)?;

    Ok(keycode as char)
}
