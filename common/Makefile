# Get CC files, aka C compiler files, aka source files
CC_FILES := $(shell find $(SRC_DIR) -name '*.c')
EXE_OBJS := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(CC_FILES))

# Add flags
CC_EXE_FLAGS += -I$(PWD)/external

# Phony targets
.PHONY: all clean setup

# Default target
all: setup $(TARGET_EXE)

# Create necessary directories
setup:
	@echo "-> Setting up env for building \"common\""
	@mkdir -p $(BIN_DIR) $(OBJ_DIR)

# Link the obj's into violet EFI app
$(TARGET_EXE): $(EXE_OBJS)
	@printf "\tLD\t\t$@\n"
	@$(LD_EXE) $(LD_EXE_FLAGS) -o $@ $^

# Compile src's
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	@printf "\tCC\t\t$@\n"
	@$(CC_EXE) $(CC_EXE_FLAGS) -c -o $@ $<

# Clean up files
clean:
	@rm -rf $(OBJ_DIR) $(BIN_DIR) $(TARGET_EXE)