#[macro_use]
extern crate kernel_macro;

// bitflags! {
//     pub struct MemoryType: u8 {
//         const DATA = 0b10000;
//         const CODE = 0b11000;
//         const DATA_WRITABLE = Self::DATA.bits() | Self::CODE.bits();
//     }
// }
#[test]
#[export_symbolic(my_func)]
pub fn any_function() {
    // let value = MemoryType::DATA.bitand(MemoryType::CODE);
}


pub struct MyStruct(usize);

impl MyStruct {
    pub fn new() {}
}

#[derive(Debug)]
pub enum BitflagError {}

impl TryFrom<usize> for MyStruct {
    type Error = ();
    fn try_from(value: usize) -> Result<Self, Self::Error> {
        match value {
            1 => { Ok(MyStruct(1)) }
            2 => { Ok(MyStruct(2)) }
            _ => { Err(()) }
        }
    }
}
