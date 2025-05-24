use core::mem;
use core::{fmt::Debug, marker::PhantomData};

use bitfield::Bit;
use static_assertions::assert_eq_size;

use kernel_types::{bitflags, declare_constants, Zeroed};

use crate::memory::{PhysicalAddress, ToPhysicalAddress, VirtualAddress};

#[derive(Clone, Copy, Default)]
#[repr(transparent)]
pub struct SegmentSelector(u16);

#[derive(PartialEq, PartialOrd)]
pub enum SelectorType {
    Gdt,
    Ldt,
}

impl SegmentSelector {
    declare_constants!(
        pub SegmentSelector,
        NULL = SegmentSelector(0);
        KERNEL_CODE = SegmentSelector(0x08); //1
        KERNEL_DATA = SegmentSelector(0x10); //2
        KERNEL_STACK = SegmentSelector(0x10); //3
        USER_CODE = SegmentSelector::new(4, PrivilegeLevel::USER, SelectorType::Gdt); //4
        USER_DATA = SegmentSelector::new(5, PrivilegeLevel::USER, SelectorType::Gdt);//5
        TASK = SegmentSelector(0x28);//6

    );

    pub const fn new(
        index: usize,
        ring: PrivilegeLevel,
        parent: SelectorType,
    ) -> Self {
        assert!(index < u32::MAX as usize);

        let type_bit = match parent {
            SelectorType::Gdt => 0x00,
            SelectorType::Ldt => 0x04,
        };

        let selector = (index & !0x3) | type_bit | (ring.bits() as usize);

        Self(selector as u16)
    }

    pub const fn get_type(&self) -> SelectorType {
        let type_bit = self.0 & 0x04;
        if type_bit == 0 {
            SelectorType::Gdt
        } else {
            SelectorType::Ldt
        }
    }

    pub const fn get_ring(&self) -> PrivilegeLevel {
        let bits = (self.0 & 0x03) as u8;

        PrivilegeLevel::from_bits(bits).expect("Unknwon privilege level")
    }
}

impl From<SegmentSelector> for u16 {
    fn from(value: SegmentSelector) -> Self {
        value.0
    }
}

impl core::ops::Deref for SegmentSelector {
    type Target = u16;

    fn deref(&self) -> &Self::Target {
        &self.0
    }
}

bitflags::bitflags! {
    #[derive(Debug, Clone, Copy)]
    pub struct  PrivilegeLevel: u8 {
        const KERNEL = 0b00;
        const USER = 0b11;
    }
}

bitflags! {
pub MemoryType(u8),
DATA = 0b10000, //including memory bit
CODE = 0b11000, //as you
ACCESSED = 0b1,
DATA_WRITABLE = MemoryType::DATA | 0b10,
DATA_DOWNABLE = MemoryType::DATA | 0b100,
CODE_READABLE = MemoryType::CODE | 0b10,
CODE_CONFORMING = MemoryType::CODE | 0b100
}

bitflags!(
    pub SystemType(u8),
    RESERVED = 0b00000, //should include in which field
    TSS_FREE_16BIT = SystemType::RESERVED | 0b0001,
    LDT = SystemType::RESERVED | 0b0010,
    TSS_BUSY_16BIT = SystemType::RESERVED | 0b0011,
    CALL_16BIT = SystemType::RESERVED | 0b100,
    TASK = SystemType::RESERVED | 0b0101,
    INTERRUPT_16BIT = SystemType::RESERVED | 0b0110,
    TRAP_16BIT = SystemType::RESERVED | 0b0111,
    TRAP_32BIT = SystemType::RESERVED | 0b1111,
    TSS_FREE_32BIT = SystemType::RESERVED | 0b1001,
    TSS_BUSY_32BIT = SystemType::RESERVED | 0b1011,
    CALL_32BIT = SystemType::RESERVED | 0b1100,
    INTERRUPT_32BIT = SystemType::RESERVED | 0b1110,
);

pub trait DescriptorType: Debug {
    fn bits(&self) -> u8;
}

//the marker for type
pub trait Descriptor {}

#[derive(Debug, Clone, Copy)]
#[repr(transparent)]
pub struct DescriptorFlags<T: DescriptorType> {
    value: u8,
    _marker: PhantomData<T>,
}

impl<T: DescriptorType> DescriptorFlags<T> {
    pub fn new(
        present: bool,
        ring: PrivilegeLevel,
        descriptor_type: T,
    ) -> Self {
        let present_bit = u8::from(present);
        Self {
            value: (present_bit << 7)
                | (ring.bits() << 5)
                | descriptor_type.bits(),
            _marker: PhantomData,
        }
    }

    #[deprecated]
    pub const fn without_type(present: bool, ring: PrivilegeLevel) -> Self {
        let present_bit: u8 = if present { 1 } else { 0 };
        Self {
            value: (present_bit << 7) | ring.bits() << 5,
            _marker: PhantomData,
        }
    }
    pub const fn is_present(&self) -> bool {
        (self.value >> 1) & 1 == 1
    }

    pub const fn ring(&self) -> PrivilegeLevel {
        let bits = (self.value >> 6) & 0b11;

        PrivilegeLevel::from_bits(bits).expect("Invalid ring level")
    }

    pub fn set_present(&mut self, present: bool) {
        let present_bit = if present { 1 } else { 0 };
        self.value = (self.value & 0x7F) | (present_bit << 7);
    }

    pub fn set_ring(&mut self, ring: PrivilegeLevel) {
        let bits = ring.bits();
        self.value = (self.value & 0x9F) | (bits << 5);
    }
    //it's forbidden to modify stat by anyone
    fn set_type(&mut self, descriptor_type: T) {
        self.value = (self.value & 0xE0) | descriptor_type.bits();
    }
}

#[repr(C)]
#[derive(Copy, Clone)]
pub struct MemoryDescriptor {
    lower_limit: u16,
    lower_address: u16,
    middle_address: u8,
    pub flags: DescriptorFlags<MemoryType>,
    specific: u8,
    //the specific field for memory descriptor
    upper_address: u8,
}
assert_eq_size!(MemoryDescriptor, [u32; 2]);
impl Descriptor for MemoryDescriptor {}

impl MemoryDescriptor {
    pub fn default(
        base: VirtualAddress,
        limit: usize,
        memory_type: MemoryType,
    ) -> Self {
        let ring = PrivilegeLevel::KERNEL;
        let flags = DescriptorFlags::new(false, ring, memory_type);
        let mut instance = MemoryDescriptor::null();
        instance.set_granularity(false);
        instance.set_small_operations(false);
        instance.set_limit(limit);
        instance.set_base(base);
        Self { flags, ..instance }
    }
    ///When granularity flag is clear then virtual address is measured in byte units.
    ///Otherwise, the address space is measured in 4KiB pages
    #[inline]
    pub fn set_granularity(&mut self, bit: bool) {
        let granularity = u8::from(bit);
        self.specific = (self.specific & 0x7F) | (granularity << 7);
    }
    #[inline]
    pub fn set_limit(&mut self, limit: usize) {
        self.lower_limit = (limit & 0xFFFF) as u16;
        self.specific = (self.specific & 0xF0) | ((limit >> 16) & 0x0F) as u8;
    }
    #[inline]
    pub fn set_base(&mut self, base: VirtualAddress) {
        self.lower_address = (base & 0xFFFF) as u16;
        self.middle_address = ((base >> 16) & 0xFF) as u8;
        self.upper_address = ((base >> 24) & 0xFF) as u8;
    }
    ///Set operation size to 16 bit mode
    #[inline]
    pub fn set_small_operations(&mut self, small: bool) {
        let bit = u8::from(small);
        self.specific = (self.specific & 0xBF) | bit << 6;
    }
    pub const fn null() -> Self {
        unsafe { mem::MaybeUninit::zeroed().assume_init() }
    }
    #[inline]
    pub fn update(&mut self, memory_type: MemoryType) {
        self.flags.set_type(memory_type);
    }
}

#[repr(C)]
#[derive(Debug, Copy, Clone)]
pub struct TaskStateDescriptor {
    lower_limit: u16,
    lower_base: u16,
    middle_base: u8,
    pub flags: DescriptorFlags<SystemType>,
    specific: u8,
    upper_base: u8,
}

assert_eq_size!(TaskStateDescriptor, [u32; 2]);

impl TaskStateDescriptor {
    pub fn active(base: VirtualAddress, limit: usize) -> Self {
        let ring = PrivilegeLevel::KERNEL;

        let system_type =
            unsafe { SystemType::wrap(SystemType::TSS_FREE_32BIT) };

        let flags = DescriptorFlags::new(true, ring, system_type);

        let mut instance = TaskStateDescriptor::null();
        instance.set_base(base.as_physical());
        instance.set_limit(limit);
        instance.set_granularity(false);

        Self { flags, ..instance }
    }

    pub const fn null() -> Self {
        unsafe { mem::MaybeUninit::zeroed().assume_init() }
    }
    pub fn set_base(&mut self, base: PhysicalAddress) {
        self.lower_base = (base & 0xFFFF) as u16;
        self.middle_base = ((base >> 16) & 0xFF) as u8;
        self.upper_base = ((base >> 24) & 0xFF) as u8;
    }
    pub fn set_limit(&mut self, limit: usize) {
        self.lower_limit = (limit & 0xFFFF) as u16;
        self.specific = (self.specific & 0xF0) | ((limit >> 16) & 0xFF) as u8;
    }
    ///The current implementation supports only 32-bit tasks
    #[deprecated]
    pub fn set_busy(&mut self, busy: bool) {
        let system_type = if busy {
            SystemType::TSS_BUSY_32BIT
        } else {
            SystemType::TSS_FREE_32BIT
        };
        unsafe { self.flags.set_type(SystemType::wrap(system_type)) };
    }
    pub fn is_busy(&self) -> bool {
        self.flags.value.bit(1)
    }
    ///when granularity bit is set then limit field should have limit field >= 67h
    pub fn set_granularity(&mut self, bit: bool) {
        self.specific = (self.specific & 0x7F) | u8::from(bit) << 7;
    }
}

#[repr(C)]
#[derive(Copy, Clone)]
pub struct TaskGate {
    reserved_1: Zeroed<u16>,
    pub task: SegmentSelector,
    reserved_2: Zeroed<u8>,
    pub flags: DescriptorFlags<SystemType>,
    reserved_3: Zeroed<u16>,
}
assert_eq_size!(TaskGate, [u32; 2]);
impl Descriptor for TaskGate {}

impl TaskGate {
    pub fn default(task: SegmentSelector) -> Self {
        let ring = PrivilegeLevel::KERNEL;
        let task_type = unsafe { SystemType::wrap(SystemType::TASK) };
        let flags = DescriptorFlags::new(false, ring, task_type);
        Self {
            task,
            flags,
            ..TaskGate::null()
        }
    }
    pub const fn null() -> Self {
        unsafe { mem::MaybeUninit::zeroed().assume_init() }
    }
}

///the common struct for both TaskGate and InterruptGate
#[repr(C)]
#[derive(Copy, Clone)]
pub struct InterruptGate {
    lower_offset: u16,
    pub selector: SegmentSelector,
    reserved: Zeroed<u8>,
    pub flags: DescriptorFlags<SystemType>,
    upper_offset: u16,
}

assert_eq_size!(InterruptGate, [u32; 2]);
impl Descriptor for InterruptGate {}

impl InterruptGate {
    /// The default interrupt gate is kernel ring and not present
    pub fn new(
        handler_offset: VirtualAddress,
        selector: SegmentSelector,
        flags: SystemType,
    ) -> InterruptGate {
        // let physical_offset = handler_offset.as_physical();
        let lower_offset = (handler_offset & 0xFFFF) as u16;
        let upper_offset = ((handler_offset >> 16) & 0xFFFF) as u16;
        let ring = PrivilegeLevel::KERNEL;

        InterruptGate {
            lower_offset,
            selector,
            flags: DescriptorFlags::new(false, ring, flags),
            upper_offset,
            ..InterruptGate::null()
        }
    }
    pub const fn null() -> Self {
        unsafe { mem::MaybeUninit::<InterruptGate>::zeroed().assume_init() } //because the present bit is set to zero
    }
}

impl DescriptorType for SystemType {
    fn bits(&self) -> u8 {
        self.bits()
    }
}

impl DescriptorType for MemoryType {
    fn bits(&self) -> u8 {
        self.bits()
    }
}
