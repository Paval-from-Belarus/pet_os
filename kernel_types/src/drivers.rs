use core::marker::Tuple;
use core::mem;
use core::ptr::NonNull;

use bitfield::bitfield;

use crate::{bitflags, declare_types};

///Currently, KernelSymbol holds size_of(usize) * 3 bytes
///Consider to remove
#[repr(C)]
pub struct KernelSymbol {
    #[doc = "Offset of function to be exported"]
    offset: NonNull<()>,
    #[doc = "Offset of string to be checked"]
    value: &'static [u8],
}

unsafe impl Send for KernelSymbol {}

unsafe impl Sync for KernelSymbol {}

impl PartialEq for KernelSymbol {
    fn eq(&self, other: &Self) -> bool {
        self.value.eq(other.value)
    }
}

impl KernelSymbol {
    pub const fn new<Args: Tuple, T: Fn<Args>>(
        function: &'static T,
        value: &'static [u8],
    ) -> Self {
        let offset: NonNull<()> = unsafe { mem::transmute(function) };
        Self { offset, value }
    }
    pub fn has_same_name(&self, name: &str) -> bool {
        let value = unsafe { core::str::from_utf8_unchecked(self.value) };
        value.eq(name)
    }
    pub fn offset(&self) -> usize {
        self.offset.as_ptr() as usize
    }
}

#[derive(Clone, Copy)]
pub struct DriverId(u16);

impl DriverId {
    pub const RESERVED: DriverId = DriverId(0);
    declare_types! {
        pub DriverId as new,
        TTY = 4 , "The terminal";
        SCSI = 8, "The hard drive";
    }
    const fn new(value: u16) -> Self {
        Self(value)
    }
    pub const fn is_reserved(&self) -> bool {
        self.0 == Self::RESERVED.0
    }
}

#[derive(Clone, Copy)]
pub struct DeviceId(u32);
bitfield! {
/// the representation of any device in system
/// dev_t alternative type
    #[derive(Copy, Clone, PartialEq, PartialOrd)]
    #[repr(transparent)]
    pub struct Device(u32);
    driver_bits, _: 11, 0;
    device_bits, _: 31, 12;
}

impl Device {
    pub fn new(driver: u32, device: u32) -> Self {
        assert!(
            driver & 0x2FF == driver && device < (u32::MAX >> 12),
            "Invalid parameters"
        );
        Self(driver | (device << 12))
    }
    //the id of driver responsible for given device
    pub fn driver(&self) -> DriverId {
        DriverId(self.driver_bits() as u16)
    }
    //the id for certain device
    pub fn id(&self) -> DeviceId {
        DeviceId(self.device_bits())
    }
}

pub struct DeviceEntry {
    code: Device,
    range: usize,
    //the max count of devices for given driver
    owner: NonNull<*mut u8>,
    get: fn(),
}
