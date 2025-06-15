#![allow(unused)]
use core::ffi::{c_char, CStr};

use alloc::{boxed::Box, vec::Vec};
use elf::{
    endian::AnyEndian, relocation::Rel, section::SectionHeader,
    segment::SegmentTable, symbol::Symbol, ElfBytes,
};
use fallible_collections::{FallibleVec, TryCollect};
use kernel_types::{
    collections::LinkedList, get_eax, io::MemoryRemap, string::MutString,
    task::TaskParams,
};

use crate::{
    current_task,
    error::KernelError,
    io,
    memory::{
        self, MemoryMappingFlag, MemoryMappingRegion, MemoryRegion,
        MemoryRegionFlag, Page, Process, ProcessId, SegmentSelector,
        VirtualAddress,
    },
    task,
};

#[derive(Debug, thiserror_no_std::Error)]
pub enum LoadError {
    #[error("Failed to parse elf file: {0}")]
    ElfFormat(#[from] elf::ParseError),
    #[error("Provided elf file has invalid format")]
    NotSupportedElfFormat,
    #[error("NoSegments")]
    NoSegments,
    #[error("No Memory")]
    NoMemory(#[from] fallible_collections::TryReserveError),
    #[error("Failed to alloc {0}")]
    AllocFailed(#[from] crate::memory::AllocError),
    #[error("Kernel Error {0}")]
    Kernel(#[from] KernelError),
    #[error("Module has no entry point")]
    NoEntryPoint,
}

fn check_elf_format(
    driver_file: &ElfBytes<'_, AnyEndian>,
) -> Result<(), LoadError> {
    if driver_file.ehdr.e_machine != elf::abi::EM_386 {
        log::debug!("Not supported arch for driver");
        return Err(LoadError::NotSupportedElfFormat);
    }

    if driver_file.ehdr.version != elf::abi::EV_CURRENT as u32 {
        log::debug!("Not supported elf version");
        return Err(LoadError::NotSupportedElfFormat);
    }

    if driver_file.ehdr.e_type & elf::abi::ET_EXEC == 0 {
        return Err(LoadError::NotSupportedElfFormat);
    }

    if driver_file.ehdr.e_entry == 0 {
        return Err(LoadError::NoEntryPoint);
    }

    Ok(())
}

fn get_symbol(
    elf_file: &ElfBytes<'_, AnyEndian>,
    symbol_table: &SectionHeader,
    index: usize,
) -> Result<usize, LoadError> {
    let table_size = (symbol_table.sh_size / symbol_table.sh_entsize) as usize;

    let sections = elf_file.section_headers().unwrap();

    assert!(index > table_size);

    let (entries, _compressioin) = elf_file.section_data(symbol_table).unwrap();

    let entries = unsafe {
        core::slice::from_raw_parts(
            entries.as_ptr().cast::<Symbol>(),
            table_size,
        )
    };

    let symbol = entries.get(index).unwrap();

    if symbol.is_undefined() {
        let str_table = sections.get(symbol_table.sh_link as usize).unwrap();
        let (data, _compress) = elf_file.section_data(&str_table).unwrap();
        let name = unsafe { data.as_ptr().byte_add(symbol.st_name as usize) };

        let name = unsafe { CStr::from_ptr(name as *const c_char) };

        match lookup_symbol(name) {
            Some(address) => Ok(address),
            None => {
                if symbol.st_bind() & elf::abi::STB_WEAK != 0 {
                    Ok(0)
                } else {
                    Err(LoadError::NotSupportedElfFormat)
                }
            }
        }
    } else if symbol.st_shndx == elf::abi::SHN_ABS {
        //absolute symbol
        Ok(symbol.st_value as usize)
    } else {
        // internally defined symbol
        let header = sections.get(symbol.st_shndx as usize).unwrap();

        let (data, _compress) = elf_file.section_data(&header).unwrap();
        let definition = (data.as_ptr() as usize) + symbol.st_value as usize;

        Ok(definition)
    }
}

fn lookup_symbol(_symbol: &CStr) -> Option<VirtualAddress> {
    None
}

fn elf_realloc(
    elf_file: &ElfBytes<'_, AnyEndian>,
    symbol_table: &SectionHeader,
    entry: Rel,
    symbol_offset: &mut VirtualAddress,
) -> Result<(), LoadError> {
    assert!(entry.r_sym != elf::abi::SHN_UNDEF as u32);

    let symbol =
        get_symbol(elf_file, symbol_table, entry.r_sym as usize).unwrap();

    log::debug!("Relocating: {symbol} at {}", entry.r_sym);

    const R_386_NONE: u32 = 0;
    const R_386_32: u32 = 1;
    const R_386_PC32: u32 = 2;

    match entry.r_type {
        R_386_NONE => {
            //no relocation
        }

        R_386_32 => {
            *symbol_offset += symbol;
        }

        R_386_PC32 => {
            *symbol_offset = symbol + *symbol_offset
                - (symbol_offset as *mut usize as usize);
        }

        _ => {
            panic!("No supported relocation type");
        }
    }

    Ok(())
}

pub fn load_in_memory(elf_data: &[u8]) -> Result<(), LoadError> {
    let loader = Loader::new(elf_data)?;
    let pid = loader.load()?;
    driver_probe(pid)?;
    Ok(())
}

//execute entry point for driver
//all system should be already initialized
fn driver_probe(_pid: ProcessId) -> Result<u32, LoadError> {
    Ok(0)
}

pub struct Loader<'a> {
    elf_file: ElfBytes<'a, AnyEndian>,
    sections: Vec<SectionHeader>,
    segments: SegmentTable<'a, AnyEndian>,
    //holds copy of elf bytes available to be modified
    buffer: Vec<u8>,
    dyn_segments: LinkedList<'static, MemoryRegion>,
}

impl<'a> Loader<'a> {
    pub fn new(elf_bytes: &'a [u8]) -> Result<Self, LoadError> {
        let elf_file = ElfBytes::<AnyEndian>::minimal_parse(elf_bytes)?;

        check_elf_format(&elf_file)?;

        let Some(section_table) = elf_file.section_headers() else {
            return Err(LoadError::NoSegments);
        };

        let sections =
            section_table.iter().try_collect::<Vec<SectionHeader>>()?;

        let Some(segments) = elf_file.segments() else {
            return Err(LoadError::NoSegments);
        };

        let mut buffer: Vec<_> =
            FallibleVec::try_with_capacity(elf_bytes.len())?;

        buffer.extend_from_slice(elf_bytes);

        Ok(Self {
            elf_file,
            sections,
            segments,
            buffer,
            dyn_segments: LinkedList::empty(),
        })
    }

    fn relocate_symbols(&mut self) -> Result<(), LoadError> {
        for header in self.sections.iter() {
            //relocated section
            if header.sh_type == elf::abi::SHT_REL {
                let rel_table = header;

                let Ok(table_iter) = self.elf_file.section_data_as_rels(header)
                else {
                    log::warn!("Failed to access relocation table");
                    return Err(LoadError::NotSupportedElfFormat);
                };

                for entry in table_iter {
                    let index = header.sh_info as usize;

                    let Some(target_header) = self.sections.get(index) else {
                        log::warn!(
                            "Failed to access header for relocation table"
                        );
                        return Err(LoadError::NotSupportedElfFormat);
                    };

                    if entry.r_sym != elf::abi::SHN_UNDEF as u32 {
                        let Some(symbol_table) =
                            self.sections.get(rel_table.sh_link as usize)
                        else {
                            log::debug!("No symbol table for relocation table");
                            return Err(LoadError::NotSupportedElfFormat);
                        };

                        let symbol_offset = unsafe {
                            assert!(entry.r_offset < target_header.sh_size);

                            let segment = self
                                .buffer
                                .as_mut_ptr()
                                .byte_add(target_header.sh_offset as usize);

                            &mut *segment
                                .byte_add(entry.r_offset as usize)
                                .cast::<VirtualAddress>()
                        };

                        elf_realloc(
                            &self.elf_file,
                            symbol_table,
                            entry,
                            symbol_offset,
                        );
                    }
                }
            }
        }

        Ok(())
    }

    pub fn load(mut self) -> Result<ProcessId, LoadError> {
        let should_enable_io = unsafe { io::status() };

        unsafe { io::disable() };

        let mut builder = Process::builder()?.switch_address_space();

        for header in self.sections.iter_mut() {
            if header.sh_type == elf::abi::SHT_NOBITS {
                if header.sh_size == 0 {
                    continue;
                }

                if header.sh_flags as u32 & elf::abi::SHF_ALLOC != 0 {
                    let mut flags = MemoryRegionFlag::READ;

                    if header.sh_flags as u32 & elf::abi::SHF_WRITE != 0 {
                        flags |= MemoryRegionFlag::WRITE;
                    }

                    if header.sh_flags as u32 & elf::abi::SHF_EXECINSTR != 0 {
                        flags |= MemoryRegionFlag::EXEC;
                    }

                    let region = builder.alloc_region(
                        header.sh_offset as usize,
                        header.sh_size as usize,
                        flags,
                    )?;

                    log::debug!("Dyn Region {region:?}");
                }
            }
        }

        // self.relocate_symbols()?;

        for header in self.segments.iter() {
            if header.p_type == elf::abi::PT_INTERP {
                let start = header.p_offset as usize;
                let end = start + header.p_memsz as usize - 1;

                let bytes = &self.buffer[start..end];
                let name = MutString::from(bytes);

                log::debug!("Requested interpreter: {name}");
            } else if header.p_type == elf::abi::PT_LOAD {
                let region_flags = {
                    let mut flags = MemoryRegionFlag::READ;

                    if header.p_flags & elf::abi::PF_W != 0 {
                        flags |= MemoryRegionFlag::WRITE;
                    }

                    if header.p_flags & elf::abi::PF_X != 0 {
                        flags |= MemoryRegionFlag::EXEC;
                    }

                    flags
                };

                let virt_addr = header.p_vaddr as VirtualAddress;

                let mem_size = header.p_memsz as usize;

                assert!(mem_size >= header.p_filesz as usize);

                let region =
                    builder.alloc_region(virt_addr, mem_size, region_flags)?;

                let region_data = self.elf_file.segment_data(&header)?;

                region.copy_from(region_data);
            }
        }

        let entry_point = self.elf_file.ehdr.e_entry as VirtualAddress;

        assert!(entry_point != 0);
        let process = builder.build(entry_point)?;

        let task = task::new_task(
            run_process,
            core::ptr::null_mut(),
            task::TaskPriority::Module(1),
        )?;

        task.set_process(process);

        task::submit_task(task);

        unsafe { memory::switch_to_kernel() };

        if should_enable_io {
            unsafe { io::enable() };
        }

        Ok(0)
    }
}

extern "C" {
    pub fn breakpoint();
}

#[no_mangle]
pub extern "C" fn run_process() {
    unsafe { io::disable() }; //disable interrupts to configure kernel task

    log::debug!("Process stack size = {}", current_task!().stack_size());

    let (entry_point, stack_end) = {
        let process = current_task!().process.as_ref().unwrap().clone();

        let state = process.state.try_lock().unwrap();

        (state.entry_point, state.stack.end)
    };

    log::debug!("Running process",);

    log::debug!("Stack size: {}", current_task!().stack_size());

    unsafe {
        core::arch::asm! {
            "shl edx, 16",
            "mov dx, cx",
            "mov ecx, eax",
            "mov eax, ebx",
            "jmp run_process_routine",
            in("eax") stack_end,
            in("ebx") entry_point,
            in("cx") *SegmentSelector::USER_DATA,
            in("dx") *SegmentSelector::USER_CODE,
            options(nomem, nostack, preserves_flags, noreturn)
        }
    }
}

pub extern "C" fn run_process_task() {
    let raw_params: *mut TaskParams = unsafe { get_eax!() };

    let params = unsafe { Box::from_raw(raw_params) };

    log::debug!("{params:?}");

    unsafe { io::disable() }; //disable interrupts to configure kernel task

    let mut pages = memory::physical_alloc(4 * Page::SIZE)
        .expect("Failed to alloc memory for page stack");

    let map_region = MemoryMappingRegion {
        flags: MemoryMappingFlag::USER_DATA,
        page_count: 4,
        virtual_offset: 0xA_000_000,
        physical_offset: pages.first().unwrap().as_physical(),
    };

    let process = current_task!().process.clone().unwrap();

    let mut state = process.state.try_lock().unwrap();

    state.marker.map_user_range(&map_region).unwrap();

    let region = MemoryRegion::new_allocated(
        map_region,
        MemoryRegionFlag::READ_WRITE,
        &mut pages,
    )
    .unwrap();

    let stack_end = region.range.end;

    state.add_region(region.into_node());

    drop(state);

    unsafe {
        core::arch::asm! {
            "jmp run_process_routine",
            in("eax") params.routine,
            in("ebx") params.args,
            in("ecx") stack_end,
            in("edx") ((*SegmentSelector::USER_CODE as u32) << 16 | (*SegmentSelector::USER_DATA as u32)),
            options(nostack, preserves_flags, noreturn)
        }
    }
}

impl Drop for Loader<'_> {
    fn drop(&mut self) {
        let mut region_iter = self.dyn_segments.iter_mut();
        loop {
            if region_iter.next().is_none() {
                break;
            }

            let region = region_iter.unlink_watched().unwrap();

            let boxed_region = region.into_boxed();
            drop(boxed_region);
        }
    }
}
