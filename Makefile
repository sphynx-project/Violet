# Disable certain make flags
MAKEFLAGS += --no-print-directory

# Set build mode
BUILD_KIND ?= dev

# Default directories
CONF_DIR ?= config
TARGET_DIR ?= targets
TOOLS_DIR ?= tools

# Default settings
TARGET ?= x86_64
COMMON_DIR ?= common
TARGET_EXE ?= $(BIN_DIR)/violet_$(TARGET).efi

# Path configurations
GENERIC_CONF_PATH := $(CONF_DIR)/generic.mk
TARGET_CONF_PATH := $(TARGET_DIR)/$(TARGET).mk

# Include generic settings
include $(GENERIC_CONF_PATH)

# Include target-specific settings
include $(TARGET_CONF_PATH)

# Setup PHONY targets
.PHONY: all setup build_common clean deps

# Default target
all: setup $(TARGET_EXE)

# Setup environment for building
setup:
	@echo "-> Setting up env for building for $(TARGET)"

# Build common components
export
build_common:
	@echo "-> Building Violet for $(TARGET)"
	@$(MAKE) -C $(COMMON_DIR)

$(TARGET_EXE): build_common

$(EMU_BOOT_IMG): $(TARGET_EXE)
	@echo "-> Creating \"$(EMU_BOOT_IMG)\""
	@dd if=/dev/zero of=$(EMU_BOOT_IMG) bs=1M count=64
	@mkfs.fat -F 32 -n EFI_SYSTEM $(EMU_BOOT_IMG)
	@mkdir -p mnt
	@sudo mount -o loop $(EMU_BOOT_IMG) mnt
	@sudo mkdir -p mnt/EFI/BOOT
	@sudo cp $(COMMON_DIR)/$(TARGET_EXE) mnt/EFI/BOOT/$(EMU_$(TARGET)_BOOT_FILE)
	@sudo cp test.txt mnt/
	@sudo umount mnt
	@rm -rf mnt

test: $(EMU_BOOT_IMG)
	@echo "-> Running bootable UEFI image with QEMU"
	@qemu-system-$(TARGET) -m 2G -bios $(EMU_$(TARGET)_BIOS) -drive if=virtio,format=raw,file=$(EMU_BOOT_IMG) $(EMU_FLAGS)


# Clean all build outputs
clean:
	@$(MAKE) -C $(COMMON_DIR) clean
