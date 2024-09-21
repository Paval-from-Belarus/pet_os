pub mod properties;

use core::arch::asm;

use multiboot2::BootInformation;
use properties::{BootModules, KernelProperties};

use crate::memory::{CaptureMemRec, PhysicalAddress};

#[repr(u32)]
pub enum BootStatus {
    InvalidBootInfo = 1,
    InvalidKernelInfo = 2,
    InvalidCommandLine = 3,

    MemoryMapNotPresent = 4,

    InvalidBootAllocator = 5,

    Okay = 42,
}

#[no_mangle]
pub unsafe extern "C" fn parse_grub_args() -> BootStatus {
    let grub_args: *const BootInformation;
    let kernel_args: *mut KernelProperties;
    asm! {
        "",
        out("eax") kernel_args,
        out("ebx") grub_args,
        options(nostack)
    };

    let Ok(mbi) = BootInformation::load(grub_args.cast()) else {
        return BootStatus::InvalidBootInfo;
    };

    let Some(properties) = kernel_args.as_mut() else {
        return BootStatus::InvalidKernelInfo;
    };

    if let Some(tag) = mbi.command_line_tag() {
        let Ok(cmd_line) = tag.cmdline() else {
            return BootStatus::InvalidCommandLine;
        };

        interpret_command_line(cmd_line, properties)
    }

    let Some(memory_map) = mbi.memory_map_tag() else {
        return BootStatus::MemoryMapNotPresent;
    };

    let mut boot_allocator = properties.pages.boot_allocator();

    let mut kernel_area_iter = boot_allocator.as_slice_mut().iter_mut();

    for area in memory_map.memory_areas().iter() {
        let Some(kernel_area) = kernel_area_iter.next() else {
            return BootStatus::InvalidBootAllocator;
        };

        *kernel_area = CaptureMemRec::new(
            area.start_address() as usize,
            area.size() as usize,
        );
    }

    BootStatus::Okay
}

fn interpret_command_line(_args: &str, _properties: &mut KernelProperties) {}
