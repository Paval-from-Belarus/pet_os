use kernel_lib::io::{self, IoBatch};

static QWERTYUIOP: &[u8] = b"qwertzuiop";
static YXCVBNM: &[u8] = b"yxcvbnm";
static ASDFGHJKL: &[u8] = b"asdfghjkl";
static NUM: &[u8] = b"123456789";

const POINT_RELEASED: u8 = 0x34;
const SLASH_RELEASED: u8 = 0xB5;
const ZERO_PRESSED: u8 = 0x29;
const ONE_PRESSED: u8 = 0x2;
const NINE_PRESSED: u8 = 0xA;

pub fn read_scan_code() -> io::Result<Option<char>> {
    let key = IoBatch::new_read().port_u8(0x60)?;

    log::debug!("KEY TO FETCH: 0x{key:x}");

    if key == 0x1C {
        return Ok('\n'.into());
    }
    if key == 0x39 {
        return Ok(' '.into());
    }

    if key == 0xE {
        return Ok('\r'.into());
    }

    if key == POINT_RELEASED {
        return Ok('.'.into());
    }

    if key == SLASH_RELEASED {
        return Ok('/'.into());
    }

    if key == ZERO_PRESSED {
        return Ok('0'.into());
    }

    if (ONE_PRESSED..=NINE_PRESSED).contains(&key) {
        return Ok((NUM[(key - ONE_PRESSED) as usize] as char).into());
    }

    log::debug!("key");

    if (0x10..=0x1C).contains(&key) {
        let letter = QWERTYUIOP[(key - 0x10) as usize] as char;
        Ok(letter.into())
    } else if (0x1E..=0x26).contains(&key) {
        let letter = ASDFGHJKL[(key - 0x1E) as usize] as char;
        Ok(letter.into())
    } else if (0x2C..=0x32).contains(&key) {
        let letter = YXCVBNM[(key - 0x2C) as usize] as char;
        Ok(letter.into())
    } else {
        Ok(None)
    }
}

// const PS2_DATA: u16 = 0x60;
// const PS2_STATUS: u16 = 0x64;
// const PS2_COMMAND: u16 = 0x64;
//
// // PS/2 status register bits
// const PS2_STATUS_OUTBUF_FULL: u8 = 0x01; // Output buffer has data
// const PS2_STATUS_INBUF_FULL: u8 = 0x02; // Input buffer full (can't write)
//
// // PS/2 commands
// const PS2_CMD_READ_CONFIG: u8 = 0x20; // Read configuration byte
// const PS2_CMD_WRITE_CONFIG: u8 = 0x60; // Write configuration byte
// const PS2_CMD_ENABLE_PORT1: u8 = 0xAE; // Enable first PS/2 port (keyboard)
// const PS2_CMD_DISABLE_PORT1: u8 = 0xAD; // Disable first PS/2 port
// const PS2_CMD_TEST_CTRL: u8 = 0xAA; // Test PS/2 controller
// const PS2_CMD_TEST_PORT1: u8 = 0xAB; // Test first PS/2 port
// const PS2_KEYBOARD_RESET: u8 = 0xFF; // Reset keyboard
// const PS2_KEYBOARD_ENABLE: u8 = 0xF4; // Enable keyboard scanning
//
// // Keycode definitions (subset for brevity)
// #[repr(u8)]
// #[derive(Clone, Copy, PartialEq)]
// pub enum Keycode {
//     NullKey = 0,
//     QPressed = 0x10,
//     QReleased = 0x90,
//     WPressed = 0x11,
//     WReleased = 0x91,
//     SpacePressed = 0x39,
//     SpaceReleased = 0xB9,
//     EnterPressed = 0x1C,
//     EnterReleased = 0x9C,
// }
//
// // Static state
// static KBD_ENABLED: AtomicU8 = AtomicU8::new(0);
// static mut KEYCACHE: *mut u8 = core::ptr::null_mut();
// static mut KEY_LOC: u16 = 0;
//
// // Simple spinlock for no_std (assuming single-core or interrupts disabled)
// static KEYBOARD_MUTEX: spin::Mutex<()> = spin::Mutex::new(());
//
// // Key mapping arrays
// static QWERTY: &[u8] = b"qwertyuiop";
// static NUM: &[u8] = b"1234567890";
//
// // Wait for PS/2 input buffer to be clear
// fn wait_input_buffer_clear() -> io::Result<()> {
//     loop {
//         let status = IoBatch::new_read().port_u8(PS2_STATUS)?;
//
//         if (status & PS2_STATUS_INBUF_FULL) == 0 {
//             break Ok(());
//         }
//     }
// }
//
// // Wait for PS/2 output buffer to have data
// fn wait_output_buffer_full() -> bool {
//     for _ in 0..10000 {
//         let status = IoBatch::new_read().port_u8(PS2_STATUS).unwrap();
//
//         if (status & PS2_STATUS_OUTBUF_FULL) != 0 {
//             return true;
//         }
//     }
//
//     false
// }
//
// // Read a byte from the PS/2 data port
// fn ps2_read() -> Option<u8> {
//     if wait_output_buffer_full() {
//         IoBatch::new_read().port_u8(PS2_DATA).unwrap().into()
//     } else {
//         None
//     }
// }
//
// // Write a byte to the PS/2 data port
// fn ps2_write_data(value: u8) {
//     wait_input_buffer_clear();
//
//     IoBatch::new_write()
//         .port_u8(PS2_DATA, value)
//         .commit()
//         .unwrap();
// }
//
// // Write a command to the PS/2 command port
// fn ps2_write_command(cmd: u8) {
//     wait_input_buffer_clear();
//
//     IoBatch::new_write()
//         .port_u8(PS2_COMMAND, cmd)
//         .commit()
//         .unwrap();
// }
//
// pub fn init() {
//     // Disable keyboard port to prevent stray interrupts
//     ps2_write_command(PS2_CMD_DISABLE_PORT1);
//
//     loop {
//         let status = IoBatch::new_read().port_u8(PS2_STATUS).unwrap();
//         if (status & PS2_STATUS_OUTBUF_FULL) == 0 {
//             break;
//         }
//     }
//
//     // Test PS/2 controller
//     ps2_write_command(PS2_CMD_TEST_CTRL);
//     if let Some(result) = ps2_read() {
//         if result != 0x55 {
//             log::warn!("PS/2 controller test failed: 0x{:x}\n", result);
//             return;
//         }
//     } else {
//         log::warn!("PS/2 controller test timed out\n");
//         return;
//     }
//
//     // Test keyboard port
//     ps2_write_command(PS2_CMD_TEST_PORT1);
//     if let Some(result) = ps2_read() {
//         if result != 0x00 {
//             log::warn!("PS/2 keyboard port test failed: 0x{:x}\n", result);
//             return;
//         }
//     } else {
//         log::warn!("PS/2 keyboard port test timed out\n");
//         return;
//     }
//
//     // Enable keyboard port
//     ps2_write_command(PS2_CMD_ENABLE_PORT1);
//
//     // Read and modify configuration byte to enable IRQ1
//     ps2_write_command(PS2_CMD_READ_CONFIG);
//     if let Some(config) = ps2_read() {
//         let new_config = config | 0x01; // Enable IRQ1 (keyboard)
//         ps2_write_command(PS2_CMD_WRITE_CONFIG);
//         ps2_write_data(new_config);
//     } else {
//         log::warn!("Failed to read PS/2 configuration\n");
//         return;
//     }
//
//     // Reset and enable keyboard
//     ps2_write_data(PS2_KEYBOARD_RESET);
//     let self_test = ps2_read().unwrap();
//     log::debug!("Self test: 0x{self_test:x}");
//     let self_test = ps2_read().unwrap();
//     log::debug!("Self test: 0x{self_test:x}");
//
//     // Enable scanning
//     ps2_write_data(PS2_KEYBOARD_ENABLE);
//     if let Some(ack) = ps2_read() {
//         if ack != 0xFA {
//             log::warn!("Keyboard enable failed: 0x{:x}\n", ack);
//             return;
//         }
//     } else {
//         log::warn!("Keyboard enable timed out\n");
//         return;
//     }
//
//     // Enable keyboard
//     log::warn!("PS/2 keyboard initialized\n");
// }
//
// // Convert scancode to ASCII
// pub fn keyboard_to_ascii(key: u8) -> u8 {
//     match key {
//         k if k == Keycode::EnterPressed as u8 => b'\n',
//         k if k == Keycode::SpacePressed as u8 => b' ',
//         k if (Keycode::QPressed as u8..=0x1C).contains(&k) => {
//             QWERTY[(key - Keycode::QPressed as u8) as usize]
//         }
//         _ => 0,
//     }
// }
//
// // Keyboard IRQ handler
// #[no_mangle]
// pub extern "C" fn keyboard_irq() {
//     // unsafe {
//     //     if inb(PS2_STATUS) & PS2_STATUS_OUTBUF_FULL != 0 {
//     //         let scancode = inb(PS2_DATA);
//     //         if !KEYCACHE.is_null() && KEY_LOC < 256 {
//     //             *KEYCACHE.offset(KEY_LOC as isize) =
//     //                 keyboard_to_ascii(scancode);
//     //             KEY_LOC += 1;
//     //         }
//     //     }
//     //     send_eoi(1); // Acknowledge IRQ1
//     // }
// }
//
// // Get a key from the keycache
// pub fn keyboard_get_key() -> u8 {
//     let _guard = KEYBOARD_MUTEX.lock();
//     let mut c = 0;
//
//     unsafe {
//         if KEY_LOC == 0 {
//             return c;
//         }
//
//         c = *KEYCACHE;
//         KEY_LOC -= 1;
//
//         let keycache_slice = core::slice::from_raw_parts_mut(KEYCACHE, 256);
//         keycache_slice.copy_within(1..256, 0);
//         keycache_slice[255] = 0;
//     }
//
//     c
// }
