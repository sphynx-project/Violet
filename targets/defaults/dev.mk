# Default development settings for all targets (override as needed)
CFLAGS += -g -D_VIOLET_DEV -D_VIOLET_TARGET_$(TARGET)
LDFLAGS += -g