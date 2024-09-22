OUTPUT_FORMAT(elf32-i386)
/* OUTPUT_FORMAT(binary) */
ENTRY(_start);
KERNEL_PHYSICAL_START = 0x100000;
KERNEL_PHYSICAL_END = 0; /* Replaced at the end of file */

KERNEL_VIRTUAL_OFFSET = 0xC0000000;

KERNEL_STACK_SIZE = 4096;
KERNEL_STACK_TOP = 0;

PAGE_SIZE = 0x1000;

MAX_PHYSICAL_MEMORY_SIZE = 32 * 1024 * 1024;

/* Size of structure in MemoryMap */
PAGE_REC_SIZE = 16;

/*fixme: memory map size should be determined at runtime*/
MEMORY_MAP_SIZE = MAX_PHYSICAL_MEMORY_SIZE / PAGE_SIZE * PAGE_REC_SIZE;


/* Replace with env args */
CONSOLE_WIDTH = 80;
CONSOLE_HEIGHT = 60;

SECTIONS
{
	/* Link the kernel at this address: "." means the current address */
	/*  The kernel must be aligne to this offset to ensure that
	 *  lower addresses are accessed directly */

	. = ALIGN(8);

	. = (KERNEL_PHYSICAL_START + KERNEL_VIRTUAL_OFFSET);
	/* . = (KERNEL_PHYSICAL_START); */

	PROVIDE(LOADER_START = .);

	.loader : AT(KERNEL_PHYSICAL_START) {
	    KEEP(*(.multiboot2_header));
	    *(.loader)
	    *(.loader_data)
	}

	PROVIDE(LOADER_END = .);
	LOADER_SIZE = LOADER_END - LOADER_START;

	. = ALIGN(PAGE_SIZE);

	PROVIDE(START_OFFSET = .);
	/* .text : AT(KERNEL_PHYSICAL_START) { */
	.text : {
	    *(.text  .text.* .stub .gnu.linkonce.t.*)
	}

        . = ALIGN(PAGE_SIZE);
	.rodata : {
	    PROVIDE(etext = .);	/* Define the 'etext' symbol to this value */
	    *(.rodata .rodata.* .gnu.linkonce.r.*)
	}

	. = ALIGN(PAGE_SIZE);
	.symbol_table : {
	    PROVIDE(symbol_table_start = .);
	    *(.symbol_table .symbol_table.*)
	}
	PROVIDE(symbol_table_end = .);

        . = ALIGN(PAGE_SIZE);
        .symbol_table_strings : {
            PROVIDE(symtab_strings = .);
            *(.symbol_table_strings .symbol_table_strings.*)
        }

	/* Adjust the address for the data segment to the next page */

	/* Conventionally, Unix linkers provide pseudo-symbols
	 * etext, edata, and end, at the end of the text, data, and bss.
	 * For the kernel mapping, we need the address at the beginning
	 * of the data section, but that's not one of the conventional
	 * symbols, because the convention started before there was a
	 * read-only rodata section between text and data. */

	/* The data segment */
	. = ALIGN(PAGE_SIZE);
	.data : {
	    PROVIDE(data = .);
		*(.data)
	}
	. = ALIGN(PAGE_SIZE);
	.bss : {
	    PROVIDE(edata = .);
		*(.bss)
		. += KERNEL_STACK_SIZE;
		KERNEL_STACK_TOP = .;
		
		MEMORY_MAP = .;
		. += MEMORY_MAP_SIZE;
	}

       . = ALIGN(PAGE_SIZE);
       .heap : { . = . + SIZEOF(.bss); }
       PROVIDE(END_OFFSET = .);
       
       /DISCARD/ : {
       	*(.eh_frame .note.GNU-stack)
       }

       BINARY_SIZE = edata - START_OFFSET + LOADER_SIZE;
       KERNEL_SIZE = END_OFFSET - START_OFFSET + LOADER_SIZE;

       KERNEL_PHYSICAL_END = KERNEL_PHYSICAL_START + KERNEL_SIZE;
}
