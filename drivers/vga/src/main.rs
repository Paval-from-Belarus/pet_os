#![no_std]
#![no_main]

use core::mem::MaybeUninit;

use kernel_lib::{
    fs::{self, not_supported_read, File, FileOperations},
    io::{self, char::register_module, IoTransaction},
    object::{KernelBuf, UserBuf},
    KernelModule, ModuleError, ModuleOperations,
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

        let ptr = &raw mut self.buffer[index];

        unsafe { ptr.write_volatile((c as u16) | ((color as u16) << 8)) };
    }
}

struct VgaWriter {
    pub color: u8,
    pub buffer: *mut VgaBuffer,

    pub cursor_x: usize,
    pub cursor_y: usize,
}

impl VgaWriter {
    pub unsafe fn new_unchecked(buffer: *mut VgaBuffer) -> Self {
        Self {
            buffer,
            color: VGA_DEFAULT_COLOR,
            cursor_x: 0,
            cursor_y: 0,
        }
    }

    pub fn clear(&mut self) {
        let vga = unsafe { &mut *self.buffer };

        for i in 0..(VGA_WIDTH * VGA_HEIGHT) {
            vga.write_char(
                i % VGA_WIDTH,
                i / VGA_WIDTH,
                ' ',
                VGA_DEFAULT_COLOR,
            );
        }

        self.cursor_x = 0;
        self.cursor_y = 0;

        self.update_cursor();
    }

    pub fn update_cursor(&self) {
        let pos = self.cursor_y * VGA_WIDTH + self.cursor_x;

        IoTransaction::new_write()
            .port_u8(0x3D4, 0x0F)
            .port_u8(0x3D5, pos as u8)
            .port_u8(0x3D4, 0x0E)
            .port_u8(0x3D5, (pos >> 8) as u8)
            .commit()
            .expect("Failed to update cursor pos")
    }

    pub fn put_char(&mut self, c: char) {
        let vga = unsafe { &mut *self.buffer };

        if c == '\n' {
            self.cursor_x = 0;
            self.cursor_y += 1;

            if self.cursor_y >= VGA_HEIGHT {
                self.cursor_y = VGA_HEIGHT - 1; // No scrolling yet
            }
        } else {
            vga.write_char(self.cursor_x, self.cursor_y, c, self.color);

            self.cursor_x += 1;
            if self.cursor_x >= VGA_WIDTH {
                self.cursor_x = 0;
                self.cursor_y += 1;
                if self.cursor_y >= VGA_HEIGHT {
                    self.cursor_y = VGA_HEIGHT - 1;
                }
            }
        }
    }

    pub fn put_string(&mut self, s: &str) {
        for c in s.chars() {
            self.put_char(c);
        }
    }
}

pub fn write(_file: File, buf: UserBuf) -> fs::Result<()> {
    Ok(())
}

impl KernelModule for VgaDriver {
    fn init() -> Result<Self, ModuleError> {
        register_module(io::char::CharModuleInfo { name: "vga".into() })?;

        let offset = unsafe { VGA_BUFFER.buffer.as_ptr() };

        io::remap(VGA_BUFFER_OFFSET, offset as _, VGA_WIDTH * VGA_HEIGHT)?;

        let mut writer =
            unsafe { VgaWriter::new_unchecked(&raw mut VGA_BUFFER) };

        writer.clear();
        writer.put_string("Hello from vga\n");
        writer.update_cursor();

        log::info!("Vga driver is initialized");

        Ok(Self {})
    }

    fn ops() -> ModuleOperations {
        FileOperations {
            read: not_supported_read,
            write,
        }
        .into()
    }
}
