#!/bin/bash
export INCLUDE="/home/Paval/Triggers/Rust/Embedded/pet_os/asm"
FASM_COMPILER="/home/Paval/Triggers/ASM/fasm/fasm.exe"
wine ${FASM_COMPILER} $1 $2