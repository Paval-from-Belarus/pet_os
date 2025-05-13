#![feature(allocator_api)]
#![no_std]
#![no_main]

mod bpb;
// mod fs;
// mod time;
// mod dir_entry;
// mod file;
// mod byteorder_core_io;
// mod dir;
// mod table;

use alloc::boxed::Box;
use bpb::BiosParameterBlock;
use kernel_lib::{
    fs::{
        self, FileId, FileSystemKind, IndexNode, IndexNodeInfo, SuperBlock,
        SuperBlockInfo,
    },
    io::{self, block::BlockDevice, spin::Mutex},
    object::Handle,
    string::QuickString,
};

extern crate alloc;
extern crate core;

#[cfg(not(test))]
#[panic_handler]
pub fn panic(_info: &core::panic::PanicInfo) -> ! {
    unsafe { core::arch::asm!("hlt", options(noreturn)) }
}

pub struct DriverContext {
    pub bpb: BiosParameterBlock,
}

pub type DriverContextLock = Mutex<DriverContext>;

pub struct FatEntry;

impl DriverContext {
    pub fn new(bpb: BiosParameterBlock, _disk: Handle<BlockDevice>) -> Self {
        Self { bpb }
    }

    pub fn find_by_name(
        &self,
        _parent_dir: &Handle<IndexNode>,
        _name: &str,
    ) -> io::Result<FatEntry> {
        todo!()
    }

    pub fn find_by_id(&self, _id: FileId) -> fs::Result<FatEntry> {
        todo!()
    }

    pub fn alloc_file_entry(
        &self,
        _parent_dir: &Handle<IndexNode>,
        _name: &str,
    ) -> io::Result<FatEntry> {
        todo!()
    }

    pub fn alloc_dir_entry(
        &self,
        _parent_dir: &Handle<IndexNode>,
        _name: &str,
    ) -> io::Result<FatEntry> {
        todo!()
    }

    pub fn alloc_node(&self, _entry: FatEntry) -> io::Result<IndexNodeInfo> {
        todo!()
    }

    pub fn flush(&self, _entry: FatEntry) -> io::Result<()> {
        todo!()
    }

    pub fn destroy_by_id(&self, _id: FileId) -> fs::Result<()> {
        todo!()
    }
}

pub fn lookup_node(
    super_block: Handle<SuperBlock>,
    parent_dir: Handle<IndexNode>,
    name: QuickString<'_>,
) -> fs::Result<IndexNodeInfo> {
    let context_lock = unsafe { &*super_block.context::<DriverContextLock>() };

    let entry = context_lock
        .lock()
        .find_by_name(&parent_dir, name.as_ref())?;

    let node = context_lock.lock().alloc_node(entry)?;

    Ok(node)
}

pub fn create_file(
    super_block: Handle<SuperBlock>,
    parent_dir: Handle<IndexNode>,
    name: QuickString<'_>,
) -> fs::Result<IndexNodeInfo> {
    let context_lock = unsafe { &*super_block.context::<DriverContextLock>() };

    let entry = context_lock
        .lock()
        .alloc_file_entry(&parent_dir, name.as_ref())?;

    let node = context_lock.lock().alloc_node(entry)?;

    Ok(node)
}

pub fn create_directory(
    super_block: Handle<SuperBlock>,
    parent_dir: Handle<IndexNode>,
    name: QuickString<'_>,
) -> fs::Result<IndexNodeInfo> {
    let context_lock = unsafe { &*super_block.context::<DriverContextLock>() };

    let entry = context_lock
        .lock()
        .alloc_dir_entry(&parent_dir, name.as_ref())?;

    let node = context_lock.lock().alloc_node(entry)?;

    Ok(node)
}

pub fn flush_node(
    super_block: Handle<SuperBlock>,
    node: Handle<IndexNode>,
) -> fs::Result<()> {
    let context_lock = unsafe { &*super_block.context::<DriverContextLock>() };

    let entry = context_lock.lock().find_by_id(node.id())?;

    context_lock.lock().flush(entry)?;

    Ok(())
}

pub fn destroy_node(
    super_block: Handle<SuperBlock>,
    node: Handle<IndexNode>,
) -> fs::Result<()> {
    let context_lock = unsafe { &*super_block.context::<DriverContextLock>() };

    context_lock.lock().destroy_by_id(node.id())?;

    Ok(())
}

pub fn mount_fs(disk: Handle<BlockDevice>) -> fs::Result<SuperBlockInfo> {
    let mut buffer = [0; 512];

    let handle = disk.read_sector(0, &mut buffer)?;
    handle.wait()?;

    let bpb = bpb::parse(&buffer)?;

    let context = Mutex::new(DriverContext::new(bpb, disk));

    let boxed = Box::try_new(context)?;

    Ok(SuperBlockInfo {
        context: Box::into_raw(boxed).cast(),
        ops: fs::SuperBlockOperations {
            lookup_node,
            create_file,
            create_directory,
            flush_node,
            destroy_node,
        },
    })
}

pub fn unmount_fs(super_block: Handle<SuperBlock>) -> fs::Result<()> {
    let context =
        super_block.context::<DriverContextLock>() as *mut DriverContextLock;

    let _ = unsafe { Box::from_raw(context) };

    Ok(())
}

#[no_mangle]
unsafe extern "C" fn init() -> i32 {
    kernel_lib::log::init().unwrap();

    let Ok(()) = fs::register(fs::FileSystem {
        name: "fat32".into(),
        kind: FileSystemKind::NORMAL,
        mount: mount_fs,
        unmount: unmount_fs,
    }) else {
        return -1;
    };

    0
}

#[no_mangle]
unsafe extern "C" fn exit() {}
