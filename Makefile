PROJECT_PATH := $(shell pwd)
ASM_PROJECT_PATH := /home/Paval/Triggers/ASM/petOS
ASM_LOADER_SOURCES_PATH := ${ASM_PROJECT_PATH}/Boot#specify the folder in which loader sources are storing
ASM_ENTRY_PATH := ${ASM_PROJECT_PATH}/System/Kernel
ASM_CONFIG_FILE := $(ASM_PROJECT_PATH)/Boot/Boot.asm
ASM_BUILDER := ${ASM_PROJECT_PATH}/out/build/compiler_script.sh#the compiler task in project
IMAGE_BUILDER := ${ASM_PROJECT_PATH}/out/build/image_builder.sh#the script that builds project search file in specific layout and build bootable image

SCRIPTS_PATH := build
TARGET_LOADER_PATH := target/loader#loader comprises from 2 parts: MBR.bin and OsLoader.bin
TARGET_APPS_PATH := target/apps
TARGET_KERNEL_PATH := target/kernel#the cargo stores file here
TARGET_IMAGES_PATH := target/images
TARGET_LOGS_PATH := target/logs
TARGET_LIB_PATH := target/target/release
TARGET_FILE_SYSTEM_PATH := target/file-system
#TARGET_LIB_ENTRY := ${TARGET_KERNEL_PATH}/entry.o
TARGET_IMAGE := $(TARGET_IMAGES_PATH)/petos.iso
LIBS := #additional libraries to pass linker
MAP_FILE := ${TARGET_LOGS_PATH}/mapping-info.txt
#tools
CARGO := cargo
MKDIR := mkdir -p
LD := ld #should be installed in system
OBJCOPY := objcopy
STRIP := strip
OBJDUMP := objdump
RM := rm -f
MAKE := make
BOCHS = build/bochs-debug.sh
#configuration properties
LD_SCRIPT = $(SCRIPTS_PATH)/kernel.ld
LD_FLAGS := -n --gc-sections
LD_FLAGS += -Map=$(MAP_FILE)
LD_FLAGS += -T $(LD_SCRIPT)
LD_FLAGS += -z max-page-size=0x1000
LD_FLAGS += -melf_i386
TARGET_SPEC := $(SCRIPTS_PATH)/target.json
FILE_SYSTEM_BUILD_SCRIPT := $(SCRIPTS_PATH)/FileSystem.xml
CARGO_FLAGS := -Z build-std=core,compiler_builtins
CARGO_FLAGS += -Z build-std-features=compiler-builtins-mem
.PHONY: all image clean kernel entry loader layout debug unlock-debug PHONY
all: test image
clean:
	rm -rf target/
test:
	$(CARGO) test --target=i686-unknown-linux-gnu
debug: image unlock-debug
	$(BOCHS)
unlock-debug:
	$(RM) $(TARGET_IMAGES_PATH)/*.lock
image: $(TARGET_IMAGE)
$(TARGET_IMAGE): $(ASM_CONFIG_FILE) $(TARGET_KERNEL_PATH)/kernel.o
	@cp --remove-destination $(TARGET_KERNEL_PATH)/kernel.o  $(ASM_PROJECT_PATH)/System/Kernel.bin
	$(IMAGE_BUILDER)
	@cp $(ASM_PROJECT_PATH)/target/Boot.iso $(TARGET_IMAGE)
	@cp $(ASM_PROJECT_PATH)/target/Boot.img $(TARGET_IMAGES_PATH)/petos.img
rebuild-kernel:
	@rm $(TARGET_KERNEL_PATH)/kernel.o
	@make kernel
kernel: $(TARGET_KERNEL_PATH)/kernel.o
$(TARGET_KERNEL_PATH)/kernel.o: src $(LD_SCRIPT) $(TARGET_SPEC) $(TARGET_KERNEL_PATH)/entry.o
	$(CARGO) build $(CARGO_FLAGS) --target=$(TARGET_SPEC) --release
	@cp --preserve $(TARGET_LIB_PATH)/libpet_os.a $(TARGET_KERNEL_PATH)/kernel.a
	$(LD) $(LD_FLAGS) -o $@ $(TARGET_KERNEL_PATH)/entry.o $(TARGET_KERNEL_PATH)/kernel.a
entry: $(TARGET_KERNEL_PATH)/entry.o
$(TARGET_KERNEL_PATH)/entry.o: $(ASM_ENTRY_PATH)/entry.asm
	$(ASM_BUILDER) ${ASM_ENTRY_PATH}/entry.asm $@
loader: layout
	$(ASM_BUILDER) ${ASM_LOADER_SOURCES_PATH}/OsLoader.asm ${TARGET_LOADER_PATH}/OsLoader.bin
	$(ASM_BUILDER) ${ASM_LOADER_SOURCES_PATH}/MBR.asm ${TARGET_LOADER_PATH}/MBR.bin
layout:
	$(MKDIR) ${TARGET_LOADER_PATH} ${TARGET_APPS_PATH} ${TARGET_KERNEL_PATH} ${TARGET_IMAGES_PATH} ${TARGET_LOGS_PATH} ${TARGET_LIB_PATH} ${TARGET_FILE_SYSTEM_PATH}