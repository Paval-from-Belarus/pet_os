use volatile::Volatile;

#[allow(dead_code)]
#[derive(Clone, Copy, PartialEq, Eq)]
#[repr(u8)]
pub enum Color {
    Black = 0,
    Blue = 1,
    Green = 2,
    Cyan = 3,
    Red = 4,
    Magenta = 5,
    Brown = 6,
    LightGray = 7,
    DarkGray = 8,
    LightBlue = 9,
    LightGreen = 10,
    LightCyan = 11,
    LightRed = 12,
    Pink = 13,
    Yellow = 14,
    White = 15,
}

#[derive(Clone, Copy, PartialEq, Eq)]
#[repr(transparent)]
struct ColorAttribute(u8);

impl ColorAttribute {
    const fn new(foreground: Color, background: Color) -> ColorAttribute {
        ColorAttribute((background as u8) << 4 | (foreground as u8))
    }
}

#[derive(Clone, Copy, PartialEq, Eq)]
#[repr(C)]
struct ScreenChar {
    letter: u8,
    attribute: ColorAttribute,
}

const SCREEN_HEIGHT: usize = 25;
const SCREEN_WIDTH: usize = 80;
declare_constants!(
    ColorAttribute,
    DEFAULT_COLOR_ATTRIBUTE = ColorAttribute::new(Color::White, Color::Black)
);

#[repr(transparent)]
struct MemoryBuffer {
    chars: [[Volatile<ScreenChar>; SCREEN_WIDTH]; SCREEN_HEIGHT],
}

pub struct VgaWriter {
    screen_width: u16,
    screen_height: u16,
    color: ColorAttribute,
    cursor_offset: u16,
    mode_offset: PhysicalAddress, //the memory offset in current video mode
}

impl VgaWriter {
    pub const fn default() -> Self {
        VgaWriter {
            screen_width: SCREEN_WIDTH as u16,
            screen_height: SCREEN_HEIGHT as u16,
            color: DEFAULT_COLOR_ATTRIBUTE,
            cursor_offset: 0,
            mode_offset: 0,
        }
    }
    pub fn write_byte(&mut self, _byte: u8) {}
}

pub struct Writer {
    column: usize,
    color_code: ColorAttribute,
    buffer: &'static mut MemoryBuffer,
}
///the essential element of VFS
pub struct INode {

}
pub struct FileOperations {
    owner: Handle,
    open: fn(NonNull<INode>, NonNull<File>),
    read: fn()
}
impl Writer {
    pub fn write_byte(&mut self, byte: u8) {
        match byte {
            b'\n' => self.new_line(),
            byte => {
                if self.column >= SCREEN_WIDTH {
                    self.new_line();
                }

                let row = SCREEN_HEIGHT - 1;
                let col = self.column;

                let color_code = self.color_code;
                self.buffer.chars[row][col].write(ScreenChar {
                    letter: byte,
                    attribute: color_code,
                });
                self.column += 1;
            }
        }
    }
    pub fn write_string(&mut self, s: &str) {
        for byte in s.bytes() {
            match byte {
                // printable ASCII byte or newline
                0x20..=0x7e | b'\n' => self.write_byte(byte),
                // not part of printable ASCII range
                _ => self.write_byte(0xfe),
            }
        }
    }
    fn clear_row(&mut self, row: usize) {
        let blank = ScreenChar {
            letter: b' ',
            attribute: self.color_code,
        };
        for col in 0..SCREEN_WIDTH {
            self.buffer.chars[row][col].write(blank);
        }
    }
    fn new_line(&mut self) { /* TODO */ }
}
// #[macro_export]
// macro_rules! print {
//     ($($arg:tt)*) => ($crate::utils::vga::_print(format_args!($($arg)*)));
// }
//
// #[macro_export]
// macro_rules! println {
//     () => ($crate::print!("\n"));
//     ($($arg:tt)*) => ($crate::print!("{}\n", format_args!($($arg)*)));
// }
//
// #[doc(hidden)]
// pub fn _print(args: fmt::Arguments) {
//     use core::fmt::Write;
//     let _ = WRITER.lock().write_fmt(args);
// }
// lazy_static! {
//     pub static ref WRITER: Mutex<Writer> = Mutex::new(Writer {
//         column_position: 0,
//         color_code: ColorCode::new(Color::Yellow, Color::Black),
//         buffer: unsafe { &mut *(0xb8000 as *mut Buffer) },
//     });
// }


use core::fmt;
use core::ptr::NonNull;
use crate::declare_constants;
use crate::drivers::Handle;
use crate::memory::PhysicalAddress;
use crate::process::File;

impl fmt::Write for Writer {
    fn write_str(&mut self, s: &str) -> fmt::Result {
        self.write_string(s);
        Ok(())
    }
}


fn print_something() {
    // use core::fmt::Write;
    let mut writer = Writer {
        column: 0,
        color_code: ColorAttribute::new(Color::Yellow, Color::Black),
        buffer: unsafe { &mut *(0xb8000 as *mut MemoryBuffer) },
    };

    writer.write_byte(b'H');
    writer.write_string("ello! ");
    // println!("Hello World{}", "!");
    use core::fmt::Write;
    // let _ = write!(writer, "All is fine");
    let _ = write!(writer, "The numbers are {} and {}", 42, 20 / 5);
}