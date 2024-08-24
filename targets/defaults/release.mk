$(info -> Building for $(TARGET), release)

# Default release settings for all targets (override as needed)
CFLAGS += -D_VIOLET_TARGET=\"$(TARGET)\" -D_VIOLET_BUILD=\"release\" -D_VIOLET_TARGET_$(TARGET)
LDFLAGS +=