# Common directory paths
SRC_DIR ?= src
INCLUDE_DIR ?= include
BIN_DIR ?= bin
OBJ_DIR ?= build

# Compiler and linker
CC_EXE ?= clang
LD_EXE ?= $(CC_EXE)

# Common build settings
CFLAGS ?= -I$(INCLUDE_DIR)
LDFLAGS ?=

# Common output settings
TARGET_EXE ?= $(COMMON_DIR)/$(BIN_DIR)/violet_$(TARGET).efi

# Emulator settings
EMU_x86_64_BOOT_FILE ?= BOOTX64.efi
EMU_x86_64_BIOS ?= /usr/share/ovmf/x64/OVMF.fd
EMU_i386_BOOT_FILE ?= BOOTIA32.efi
EMU_i386_BIOS ?= /usr/share/ovmf/ia32/OVMF.fd
EMU_BOOT_IMG ?= boot.img