$(info -> Building for $(TARGET), dev)

# Default development settings for all targets (override as needed)
CFLAGS += -g -D_VIOLET_DEV -D_VIOLET_TARGET=\"$(TARGET)\" -D_VIOLET_BUILD=\"dev\" -D_VIOLET_TARGET_$(TARGET)
LDFLAGS += -g