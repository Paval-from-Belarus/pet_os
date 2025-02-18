pub mod properties;

use core::arch::asm;

use multiboot2::BootInformation;
use properties::KernelProperties;

use crate::{
    entry_index, get_eax,
    memory::{
        self, CaptureMemRec, DirEntry, DirEntryFlag, Page, PageDirectory,
        PhysicalAddress, TableEntry, TableEntryFlag, ToPhysicalAddress,
        VirtualAddress, DIRECTORY_ENTRIES_COUNT, DIRECTORY_PAGES_COUNT,
        TABLE_ENTRIES_COUNT,
    },
    set_eax, table_index,
};

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
pub unsafe extern "C" fn parse_grub_args() {
    let grub_args: *const BootInformation;
    let kernel_args: *mut KernelProperties;

    asm! {
        "",
        out("eax") kernel_args,
        out("ebx") grub_args,
        options(nostack)
    };

    let status = parse_grub_args_native(grub_args, kernel_args);

    set_eax!(status as u32);
}

pub unsafe fn parse_grub_args_native(
    grub_args: *const BootInformation,
    kernel_args: *mut KernelProperties,
) -> BootStatus {
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
    let memory_areas = memory_map.memory_areas();

    boot_allocator.set_len(memory_areas.len());

    for (area, kernel_area) in memory_areas
        .iter()
        .zip(boot_allocator.as_slice_mut().iter_mut())
    {
        let raw_kind: u32 = area.typ().into();
        *kernel_area = CaptureMemRec::new(
            area.start_address() as usize,
            area.size() as usize,
            raw_kind,
        );
    }

    BootStatus::Okay
}

fn interpret_command_line(_args: &str, _properties: &mut KernelProperties) {}

#[allow(unused)]
unsafe fn enable_paging() {
    let properties = {
        let raw_properties: *mut KernelProperties = get_eax!();
        raw_properties.as_mut().unwrap()
    };

    let mut allocator = properties.pages.boot_allocator();

    let Some(directory_offset) =
        allocator.alloc(memory::kernel_physical_offset(), 1)
    else {
        set_eax!(1);
        return;
    };

    let Some(tables_offset) = allocator
        .alloc(memory::kernel_physical_offset(), DIRECTORY_PAGES_COUNT)
    else {
        set_eax!(2);
        return;
    };

    let directory = core::slice::from_raw_parts_mut(
        directory_offset as *mut DirEntry,
        DIRECTORY_ENTRIES_COUNT,
    );

    let tables = core::slice::from_raw_parts_mut(
        tables_offset as *mut [TableEntry; TABLE_ENTRIES_COUNT],
        DIRECTORY_PAGES_COUNT,
    );

    for (dir_entry, page_entries) in directory.iter_mut().zip(tables.iter_mut())
    {
        *dir_entry = DirEntry::new(
            page_entries as *mut TableEntry as PhysicalAddress,
            DirEntryFlag(DirEntryFlag::PRESENT),
        );

        page_entries.fill(TableEntry::new(
            PhysicalAddress::NULL,
            TableEntryFlag(TableEntryFlag::EMPTY),
        ));
    }

    // mark_region(DirEntryFlag(DirEntryFlag::), table_flag, dir, p_o, v_o, pages_count)
}

fn mark_region(
    dir_flag: DirEntryFlag,
    table_flag: TableEntryFlag,
    dir: &mut PageDirectory<'static>,
    p_o: PhysicalAddress,
    v_o: VirtualAddress,
    pages_count: usize,
) {
    let mut next_virtual_offset = v_o;
    let mut next_physical_offset = p_o;

    for _ in 0..pages_count {
        let dir_entry = {
            let index = table_index!(next_virtual_offset);
            dir.get_mut(index).unwrap()
        };

        dir_entry.set_flags(dir_flag);

        if let Some(page_table) = dir_entry.page_table_mut() {
            let table_entry =
                &mut page_table[entry_index!(next_virtual_offset)];

            table_entry.set_flags(table_flag);
            table_entry.set_page_offset(next_physical_offset);
        }

        next_virtual_offset += Page::SIZE;
        next_physical_offset += Page::SIZE;
    }
}
// ;Input:
// ;eax -> PageDirectoryFlag
// ;edx -> PageTableFlag
// ;ecx -> pages count
// ;ebx -> PageDirectory (already configured)
// ;esi -> physical offset (aligned to Page.bytes)
// ;edi -> corresponding virtual offset (aligned to Page.bytes)
// ;Output:
// ;ebx, esi, edi -> are saved
// ;
// proc MMU.markRegion uses esi edi
//      local dNextPhysicalOffset: DWORD
//      local dNextVirtualOffset: DWORD
//      jcxz .exit
//      mov dword [dNextPhysicalOffset], esi
//      mov dword [dNextVirtualOffset], edi
//      mov esi, eax ;PageDirectoryFlag
//      mov edi, edx ;PageTableFlag
//      ;in ecx -> page count
// .markLoop:
//      mov eax, dword [dNextVirtualOffset]
//      mov edx, eax
//      shr eax, 22
//      and eax, 0x3FF ;in eax -> table index
//      lea eax, dword [ebx + eax * PageDirEntry.bytes] ;in eax -> table entry offset
//      or dword [eax], esi ;mark with PageDirectoryFlag
//      mov eax, dword [eax] ;load entry
//      and eax, (not 0xFFF) ;get pure page table offset
//      shr edx, 12
//      and edx, 0x3FF ;holds page entry index
//      lea eax, dword [eax + edx * PageTableEntry.bytes] ;page table entry offset
//      mov edx, edi ;copy table flag
//      or edx, dword [dNextPhysicalOffset]
//      mov dword [eax], edx ;store page table entry
//      add dword [dNextPhysicalOffset], PageSize.bytes
//      add dword [dNextVirtualOffset], PageSize.bytes
//      loop .markLoop
// .exit:
// ret
