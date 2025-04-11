// use elf::{endian::AnyEndian, ElfBytes};

// pub fn load(bytes: &[u8]) {
//     let file = ElfBytes::<AnyEndian>::minimal_parse(bytes).unwrap();
//
//     let abi_shdr: SectionHeader = file
//         .section_header_by_name(".note.gnu.build-id")
//         .expect("section table should be parseable")
//         .expect("file should have a .note.ABI-tag section");
//
//     let notes: Vec<Note> = file
//         .section_data_as_notes(&abi_shdr)
//         .expect("Should be able to get note section data")
//         .collect();
//     assert_eq!(
//         notes[0],
//         Note::GnuBuildId(NoteGnuBuildId(&[
//             140, 51, 19, 23, 221, 90, 215, 131, 169, 13, 210, 183, 215, 77,
//             216, 175, 167, 110, 3, 209
//         ]))
//     );
//
//     // Find lazy-parsing types for the common ELF sections (we want .dynsym, .dynstr, .hash)
//     let common = file.find_common_data().expect("shdrs should parse");
//     let (dynsyms, strtab) =
//         (common.dynsyms.unwrap(), common.dynsyms_strs.unwrap());
//     let hash_table = common.sysv_hash.unwrap();
//
//     // Use the hash table to find a given symbol in it.
//     let name = b"memset";
//     let (sym_idx, sym) = hash_table
//         .find(name, &dynsyms, &strtab)
//         .expect("hash table and symbols should parse")
//         .unwrap();
//
//     // Verify that we got the same symbol from the hash table we expected
//     assert_eq!(sym_idx, 2);
//     assert_eq!(strtab.get(sym.st_name as usize).unwrap(), "memset");
//     assert_eq!(sym, dynsyms.get(sym_idx).unwrap());
// }

// pub fn load_driver(elf_data: &'static [u8]) -> Result<Driver, LoaderError> {
//     // Parse the ELF file
//     let reader = MemoryReader::new(elf_data);
//     let elf =
//         ElfBytes::new(AnyEndian, elf_data).map_err(LoaderError::ParseError)?;
//
//     // Validate ELF header
//     let header = elf.ehdr;
//     if &header.e_ident[0..4] != b"\x7FELF" {
//         return Err(LoaderError::InvalidElf);
//     }
//
//     // Get program headers
//     let phdrs = elf
//         .segments()
//         .ok_or(LoaderError::ParseError(ParseError::InvalidProgramHeader))?;
//
//     // Map program segments into memory
//     for phdr in phdrs.iter() {
//         if phdr.p_type == elf::abi::PT_LOAD {
//             let vaddr = phdr.p_vaddr as usize;
//             let mem_size = phdr.p_memsz as usize;
//             let file_size = phdr.p_filesz as usize;
//             let offset = phdr.p_offset as usize;
//
//             // Allocate or map memory at vaddr (simplified)
//             // In a real kernel, use your memory manager
//             let dest = unsafe {
//                 core::slice::from_raw_parts_mut(vaddr as *mut u8, mem_size)
//             };
//
//             // Copy file data
//             if file_size > 0 {
//                 reader.read_at(offset, &mut dest[..file_size])?;
//             }
//
//             // Zero out remaining memory (e.g., .bss section)
//             if mem_size > file_size {
//                 dest[file_size..].fill(0);
//             }
//
//             // Set permissions (simplified)
//             // In your kernel, configure page tables for RX (code) or RW (data)
//         }
//     }
//
//     // Find the init function (via entry point or symbol table)
//     let entry_point = header.e_entry as usize;
//     if entry_point == 0 {
//         return Err(LoaderError::InvalidEntryPoint);
//     }
//
//     // Create driver struct
//     let driver = Driver {
//         init: unsafe { core::mem::transmute(entry_point) },
//     };
//
//     // Call init
//     let result = unsafe { (driver.init)() };
//     if result != 0 {
//         return Err(LoaderError::DriverError(
//             DriverError::InitializationFailed,
//         ));
//     }
//
//     Ok(driver)
// }
