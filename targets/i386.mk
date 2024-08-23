# Target-specific configuration
EXE_TARGET ?= i386-windows-unknown

# Target-specific compiler and linker flags
CC_EXE_FLAGS ?= -target $(EXE_TARGET) -ffreestanding -fshort-wchar \
                -Wno-unused-command-line-argument -Wno-void-pointer-to-int-cast \
                -Wno-int-to-void-pointer-cast -Wno-int-to-pointer-cast $(CFLAGS)

LD_EXE_FLAGS ?= -target $(EXE_TARGET) -nostdlib \
                -Wl,-entry:_violet_$(TARGET)_$(BUILD_KIND)_entry \
                -Wl,-subsystem:efi_application -fuse-ld=lld-link $(LDFLAGS)

# Include the generic settings for this build type
include $(TARGET_DIR)/defaults/$(BUILD_KIND).mk
