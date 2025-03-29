#![allow(unused)]

/// All drivers storing in
use core::ptr::NonNull;
use core::{mem, slice};

use kernel_macro::{export_symbolic, ListNode};
use kernel_types::collections::{LinkedList, ListNode, Queue};
use kernel_types::declare_constants;
use kernel_types::drivers::{Device, DeviceId, DriverId, KernelSymbol};

use crate::common::atomics::SpinLockLazyCell;
use crate::fs::{
    FileOperations, IndexNode, IndexNodeItem, SuperBlock, SuperBlockOperations,
};
use crate::memory::VirtualAddress;

mod keyboard;
mod management;
mod memory;
mod network;
mod vga;

///The only one DriverId for each driver
///Each device can be handler as devices as can
pub fn register_file_system(_fs: SuperBlock) -> Result<DriverId, ()> {
    Ok(DriverId::RESERVED)
}

pub fn register_device_driver(_name: &str) -> Result<DriverId, ()> {
    Ok(DriverId::RESERVED)
}

pub fn register_char_device_range(
    _id: DriverId,
    _count: usize,
    _name: &str,
) -> Result<(), ()> {
    Err(())
}

///return the lowest value of deviceId
pub fn alloc_char_device_range(
    _minor_base: usize,
    _count: usize,
    _name: &str,
) -> Result<DeviceId, ()> {
    Err(())
}

#[export_symbolic(cdev_init)]
pub fn new_char_device() -> CharDevice {
    todo!()
}

#[export_symbolic(bdev_init)]
pub fn new_block_device() -> BlockDevice {
    todo!()
}

#[export_symbolic]
pub fn io_remap() {}

#[export_symbolic]
pub fn io_unmap() {}

extern "Rust" {
    #[link_name = "symbol_table_start"]
    static SYMBOL_TABLE_START: *const KernelSymbol;
    #[link_name = "symbol_table_end"]
    static SYMBOL_TABLE_END: *const KernelSymbol;
}

pub struct CharDeviceBox {}

pub struct CharDevice {
    ///the id of driver + id of this device
    device: Device,
    module: NonNull<*mut u8>,
    //to easily create IndexNode
    fs_ops: NonNull<FileOperations>,
    count: usize,
    inodes: LinkedList<'static, IndexNodeItem>,
    //the count of minor devices uses the device
    // count: usize,
    // currently, there is no need in several minor devices for device;
    // therefore, for the CharDevice only on IndexNode exists
}

impl CharDevice {}

pub struct BlockDeviceBox {}

pub struct BlockDevice {
    device: Device,
    //regular files on block device
    files: NonNull<IndexNode>,
    //generic block device fields
    driver: DriverId,
    first_partition: DeviceId,
    partitions_count: usize,
    partitions: LinkedList<'static, Partition>,
    //remove field because linux uses it to represent in file system
    driver_name: [u8; 32],
    ops: NonNull<BlockDeviceOperations>,
    requests: Queue<()>,
}

//the type alias using to represent sector
pub type Sector = usize;

#[derive(ListNode)]
pub struct Partition {
    #[list_pivots]
    node: ListNode<Partition>,
    start: Sector,
    size: Sector,
}

pub struct BlockDeviceOperations {}

pub fn init() {
    unsafe {
        let bytes_size = (SYMBOL_TABLE_END as *const u8)
            .sub_ptr(SYMBOL_TABLE_START as *const u8);
        assert!(
            bytes_size % mem::size_of::<KernelSymbol>() == 0
                && bytes_size > mem::size_of::<KernelSymbol>(),
            "Invalid Symbol table sizes"
        );
    }
}

fn find_symbol(name: &str) -> Option<VirtualAddress> {
    let table_size = unsafe { SYMBOL_TABLE_END.sub_ptr(SYMBOL_TABLE_START) };
    let symbol_table =
        unsafe { slice::from_raw_parts(SYMBOL_TABLE_START, table_size) };
    symbol_table
        .iter()
        .find(|entry| entry.has_same_name(name))
        .map(|entry| entry.offset())
}
declare_constants! {
    pub usize,
    MAX_DEVICE_COUNT = 128;
}

static DRIVERS_TABLE: SpinLockLazyCell<[VirtualAddress; MAX_DEVICE_COUNT]> =
    SpinLockLazyCell::empty();

#[repr(transparent)]
#[derive(Clone, Copy, PartialEq, Debug)]
pub struct Handle(VirtualAddress);

impl Handle {
    declare_constants!(
        pub Handle,
        KERNEL = Handle(0);
    );
}
