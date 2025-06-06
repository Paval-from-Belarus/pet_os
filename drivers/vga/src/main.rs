#![no_std]
#![no_main]

use core::mem::MaybeUninit;

use kernel_lib::{
    io::{self, IoTransaction},
    KernelModule, ModuleError,
};

kernel_lib::module! {
    module: VgaDriver,
    name: "vga",
}

pub struct VgaDriver {}

const VGA_WIDTH: usize = 80;
const VGA_HEIGHT: usize = 25;

const VGA_BUFFER_OFFSET: usize = 0xB8_000;
const VGA_COLOR_BLACK: u8 = 0;
const VGA_COLOR_WHITE: u8 = 0xF;
const VGA_DEFAULT_COLOR: u8 = VGA_COLOR_WHITE | (VGA_COLOR_BLACK << 4);

// Global state for cursor position
static mut CURSOR_X: usize = 0;
static mut CURSOR_Y: usize = 0;

static mut VGA_BUFFER: VgaBuffer = VgaBuffer::new();

#[repr(align(4096))]
struct VgaBuffer {
    buffer: [u16; VGA_WIDTH * VGA_HEIGHT],
}

impl VgaBuffer {
    pub const fn new() -> Self {
        unsafe { MaybeUninit::zeroed().assume_init() }
    }

    fn write_char(&mut self, x: usize, y: usize, c: char, color: u8) {
        let index = y * VGA_WIDTH + x;

        let ptr = self.buffer.as_mut_ptr();

        unsafe {
            ptr.add(index)
                .write_volatile((c as u16) | ((color as u16) << 8))
        }
    }
}

// Clear the screen
pub fn clear_screen() {
    let mut vga = VgaBuffer::new();
    for i in 0..(VGA_WIDTH * VGA_HEIGHT) {
        vga.write_char(i % VGA_WIDTH, i / VGA_WIDTH, ' ', VGA_DEFAULT_COLOR);
    }
    unsafe {
        CURSOR_X = 0;
        CURSOR_Y = 0;
    }
}

// Update hardware cursor
pub fn update_cursor() {
    use kernel_lib::io::Write;

    let pos = unsafe { CURSOR_Y * VGA_WIDTH + CURSOR_X };

    IoTransaction::<Write, 8>::new_write()
        .port_u8(0x3D4, 0x0F)
        .port_u8(0x3D5, pos as u8)
        .port_u8(0x3D4, 0x0E)
        .port_u8(0x3D5, (pos >> 8) as u8)
        .commit()
        .expect("Failed to update cursor pos")
}

// Print a single character
fn putchar(c: char) {
    let mut vga = VgaBuffer::new();
    unsafe {
        if c == '\n' {
            CURSOR_X = 0;
            CURSOR_Y += 1;
            if CURSOR_Y >= VGA_HEIGHT {
                CURSOR_Y = VGA_HEIGHT - 1; // No scrolling yet
            }
        } else {
            vga.write_char(CURSOR_X, CURSOR_Y, c, VGA_DEFAULT_COLOR);
            CURSOR_X += 1;
            if CURSOR_X >= VGA_WIDTH {
                CURSOR_X = 0;
                CURSOR_Y += 1;
                if CURSOR_Y >= VGA_HEIGHT {
                    CURSOR_Y = VGA_HEIGHT - 1;
                }
            }
        }
    }
    // update_cursor();
}

// Print a string
pub fn puts(s: &str) {
    for c in s.chars() {
        putchar(c);
    }
}

fn u16_to_str(num: u16, buf: &mut [u8; 4]) {
    buf[0] = b'0' + ((num / 1000) % 10) as u8;
    buf[1] = b'0' + ((num / 100) % 10) as u8;
    buf[2] = b'0' + ((num / 10) % 10) as u8;
    buf[3] = b'0' + (num % 10) as u8;
}

fn u8_to_str(num: u8, buf: &mut [u8; 2]) {
    buf[0] = b'0' + (num / 10);
    buf[1] = b'0' + (num % 10);
}

// fn display_time(time: &RtcTime) {
//     let mut u8_buf = [b'0'; 2];
//     let mut u16_buf = [b'0'; 4];
//
//     u16_to_str(time.year, &mut u16_buf);
//     puts(core::str::from_utf8(&u16_buf).unwrap_or("??"));
//     putchar('-');
//
//     u8_to_str(time.month, &mut u8_buf);
//     puts(core::str::from_utf8(&u8_buf).unwrap_or("??"));
//     putchar('-');
//
//     u8_to_str(time.day, &mut u8_buf);
//     puts(core::str::from_utf8(&u8_buf).unwrap_or("??"));
//
//     putchar(' ');
//
//     // Format hours
//     u8_to_str(time.hours, &mut u8_buf);
//     puts(core::str::from_utf8(&u8_buf).unwrap_or("??"));
//
//     putchar(':');
//
//     // Format minutes
//     u8_to_str(time.minutes, &mut u8_buf);
//     puts(core::str::from_utf8(&u8_buf).unwrap_or("??"));
//
//     putchar(':');
//
//     // Format seconds
//     u8_to_str(time.seconds, &mut u8_buf);
//     puts(core::str::from_utf8(&u8_buf).unwrap_or("??"));
// }

pub struct Driver {
    pub name: &'static str,
    pub status: &'static str,
}

// pub fn init() {
//     clear_screen();
//
//     let time = unsafe { read_rtc_time() };
//
//     puts("Welcome to PetOS!\n\n");
//     puts("Login Time: ");
//     display_time(&time);
//     puts("\n\n");
//
//     puts("user$");
//     update_cursor();
//
//     let drivers = [
//         Driver {
//             name: "ata-disk",
//             status: "okay",
//         },
//         Driver {
//             name: "fat-fs",
//             status: "okay",
//         },
//         Driver {
//             name: "vga-char",
//             status: "okay",
//         },
//         Driver {
//             name: "keybrd-char",
//             status: "okay",
//         },
//     ];
//
//     puts("modinfo\n");
//
//     for driver in drivers.into_iter() {
//         puts(driver.name);
//         puts(": ");
//         puts(driver.status);
//         puts("\n");
//     }
//
//     puts("user$");
//
//     update_cursor();
//
//     let files = ["sys", "usr", "boot", "home"];
//     puts("ls\n");
//
//     for file in files.into_iter() {
//         puts(file);
//         puts(" ");
//     }
//
//     puts("\nuser$");
//     update_cursor();
// }

impl KernelModule for VgaDriver {
    fn init() -> Result<Self, ModuleError> {
        let offset = unsafe { VGA_BUFFER.buffer.as_ptr() };

        log::debug!("Virtual offset: {offset:X?}");

        io::remap(VGA_BUFFER_OFFSET, offset as _, VGA_WIDTH * VGA_HEIGHT)?;

        clear_screen();
        puts("Hello From Vga");
        update_cursor();

        loop {
            log::info!("From vga driver");
        }

        Ok(Self {})
    }
}
