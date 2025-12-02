CC = clang
CFLAGS = -std=c23 -Wall -Wextra -Wpedantic -Werror -g -fsanitize=address,undefined
LDFLAGS = -lm

SRC_DIR = src
BIN_DIR = bin
INPUT_DIR = inputs

DAY ?= 01
MAIN_SRC = $(SRC_DIR)/day$(DAY).c

TARGET = $(BIN_DIR)/day$(DAY)

.PHONY: all run clean

all: $(TARGET)

$(TARGET): $(MAIN_SRC)
	@mkdir -p $(BIN_DIR) # Ensure bin directory exists
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

run: $(TARGET)
	@echo "Running day $(DAY)..."
	@# Check if the input file exists before trying to run
	@[ -f $(INPUT_DIR)/day$(DAY).txt ] && ./$< < $(INPUT_DIR)/day$(DAY).txt || ./$<
	@echo "---"

clean:
	@echo "Cleaning up..."
	@rm -rf $(BIN_DIR)
