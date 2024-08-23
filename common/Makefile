# Get all C source files, excluding those in unwanted arch paths
CC_FILES := $(shell find $(SRC_DIR) -name '*.c')

# Map source files to object files
EXE_OBJS := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(CC_FILES))

# Debug print to verify files
$(info CC_FILES = $(CC_FILES))
$(info EXE_OBJS = $(EXE_OBJS))

# Phony targets
.PHONY: all clean setup

# Default target to build the executable
all: setup $(TARGET_EXE)

# Create necessary directories
setup:
	@echo "-> Setting up environment for building \"$(TARGET)\""
	@mkdir -p $(BIN_DIR) $(OBJ_DIR)

# Link object files into the final executable
$(TARGET_EXE): $(EXE_OBJS)
	@echo "-> Linking $@"
	@$(LD_EXE) $(LD_EXE_FLAGS) -o $@ $^

# Compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	@echo "-> Compiling $<"
	$(CC_EXE) $(CC_EXE_FLAGS) -c -o $@ $<

# Clean up build artifacts
clean:
	@echo "Cleaning up..."
	@rm -rf $(OBJ_DIR) $(BIN_DIR) $(TARGET_EXE)
