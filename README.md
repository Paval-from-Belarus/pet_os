PetOS - IA-32 Microkernel Operating System

PetOS is a microkernel-based operating system targeting the IA-32 architecture, written in Rust and Assembly (FASM).
It features an asynchronous kernel API for both kernel and userspace components, emphasizing modularity and minimalism. 
This file provides an overview of the project structure, build process, and system requirements for development.
Project Characteristics

Asynchronous Kernel API: Provides async interfaces for both kernel and userspace, enabling efficient, non-blocking operations.
Microkernel Implementation: The kernel is minimal, with most functionality (e.g., drivers) implemented in userspace for modularity and isolation.
Rust and Assembly: Built primarily in Rust for safety and performance, with low-level components written in Assembly using the FASM assembler.
Customizable via Linker Script: The kernel's memory layout and structure are defined in kernel.ld, allowing fine-tuned configuration.
Build Automation with Cargo-Make: Uses cargo-make for streamlined build tasks, defined in Makefile.toml.

Project Structure
The repository is organized as follows:

kernel/: Contains the core kernel source code, implementing the microkernel functionality.
kernel_types/: Defines common data models and types shared across kernel, macros, and userspace.
kernel_macro/: Includes procedural and simple macros to reduce boilerplate code for kernel components.
kernel-lib/: Provides the runtime for kernel components in userspace and the userspace API for interacting with the kernel.
drivers/: Contains userspace drivers (no in-kernel drivers), implementing hardware interactions in a modular fashion.
asm/: Holds Assembly source code (FASM) for low-level operations, such as boot entry and hardware interrupts. This directory is somewhat rudimentary.
scripts/: Stores scripts and configuration files, including the linker script (kernel.ld), GRUB configuration (grub.cfg), and build scripts (e.g., build_drivers.sh).

Build Process with Cargo-Make
The build process is managed by cargo-make, with tasks defined in Makefile.toml. Below is an explanation of each task:

layout: Creates necessary directories for build artifacts, including images/, logs/, and shared/ under the target/ directory.
prune: Cleans the build environment by running cargo clean for both the main workspace and the drivers/ workspace, removing previous build artifacts.
asm: Compiles Assembly source files (interceptors.asm, entry_grub.asm, ata_disk.asm) using the FASM compiler (via Wine) and outputs object files to target/shared/.
check: Runs cargo check to verify the Rust code without generating binaries, using a custom target specification (target.json) and enabling core, alloc, and compiler builtins.
kernel_bin: Builds the Rust kernel code into a static library (libkernel.a) using cargo build --release, with custom target and driver configurations (VGA, keyboard, ATA).
drivers: Executes the build_drivers.sh script to compile userspace drivers (VGA, keyboard, ATA) and place outputs in target/drivers/.
fix: Runs cargo fix to apply automatic code fixes to the Rust codebase, using the same target and build settings as kernel_bin.
kernel: Links the kernel by combining Assembly object files (interceptors.o, entry.o, ata_disk.o) and the kernel library (libkernel.a) using the linker script (kernel.ld). It generates kernel.bin, strips symbols for size optimization, and verifies the Multiboot2 header.
create_hdd_image: Creates a 10 MiB disk image (petos.img) using dd and sets up a primary, bootable partition using fdisk.
image: Sets up the disk image by creating a FAT32 filesystem, mounting it, installing GRUB2, and copying the kernel binary (kernel.bin) and GRUB configuration (grub.cfg) to the image. Requires sudo for mounting and GRUB installation.
unlock-image: Removes the target/.lock file if it exists, ensuring no stale locks interfere with subsequent tasks.
debug: Runs the image and unlock-image tasks, then launches Bochs with the debugger enabled using the bochs-config.bxrc configuration.
run: Runs the image and unlock-image tasks, then launches Bochs without the debugger using the bochs-config.bxrc configuration.

Linker Script (kernel.ld)
The linker script (kernel.ld) defines the memory layout for the kernel:

Output Format: Targets elf32-i386 for IA-32 compatibility.
Entry Point: Sets _start as the kernel's entry point.
Memory Layout:
Kernel is loaded at physical address 0x100000 with a virtual offset of 0xC0000000.
Sections are aligned to 4 KiB pages (PAGE_SIZE = 0x1000).
Includes .text (code, including Multiboot2 header), .rodata (read-only data), .symbol_table, .symbol_table_strings, .data, .bss (uninitialized data), and .heap.
Defines a stack (KERNEL_STACK_SIZE = 0x2000) and a memory map (MEMORY_MAP_SIZE for 64 MiB max physical memory).


Symbols: Provides symbols like START_OFFSET, END_OFFSET, etext, edata, KERNEL_SIZE, and KERNEL_PHYSICAL_END for runtime use.
Discards: Removes unnecessary sections (e.g., .eh_frame, .note.GNU-stack) to reduce binary size.

The linker script ensures proper alignment and placement of kernel sections, critical for booting and runtime stability.
System Requirements
To develop and build petOS, the following dependencies are required on Fedora Linux (versions 40-41):

Bochs: Emulator for running and testing the OS image.sudo dnf install bochs


Bochs Debugger: For debugging the OS in Bochs.sudo dnf install bochs-debugger


Wine: To run the FASM assembler (fasm.exe) on Linux.sudo dnf install wine


Rust Ecosystem: Install Rust 1.88 (nightly) via rustup.curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup install nightly-2025-07-15
rustup default nightly-2025-07-15


Cargo-Make: Build automation tool for managing tasks.cargo install cargo-make


Binutils:
GRUB: For creating bootable images.sudo dnf install grub2-tools


GCC: For compiling and linking (includes ld).sudo dnf install gcc


ldd: For dependency analysis (part of glibc).sudo dnf install glibc




fdisk: For partitioning the disk image.sudo dnf install util-linux


mkfs.fat: For creating FAT32 filesystems.sudo dnf install dosfstools



Development Environment

OS: Fedora Linux 40 or 41
Rust Version: 1.88 (nightly, set via rustup)
Build Tool: cargo-make
Assembler: FASM (run via Wine)
Emulator: Bochs (with or without debugger)

Getting Started

Install Dependencies: Follow the system requirements section to install all necessary tools.
Clone the Repository:git clone <repository-url>
cd petOS


Build the Kernel:cargo make kernel


Create the Disk Image:cargo make image

Run the OS in Bochs:cargo make run

Debug the OS:cargo make debug



Notes

The asm/ directory is rudimentary and may require additional refinement for production use.
Ensure sudo privileges are available for the image task, as it involves mounting and GRUB installation.
The kernel is Multiboot2-compliant, verified during the kernel task.
Customize the kernel's memory layout by modifying kernel.ld as needed.
