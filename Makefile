CC = clang
CFLAGS = -std=c23 -Wall -Wextra -Wpedantic -Werror -g -fsanitize=address,undefined
LDFLAGS = -lm
LDLIBS_TEST = -lcriterion

SRC_DIR = src
TEST_DIR = tests
BIN_DIR = bin
INPUT_DIR = inputs

DAY ?= 01
MAIN_SRC = $(SRC_DIR)/day$(DAY).c
TEST_SRC = $(TEST_DIR)/test_day$(DAY).c

TARGET = $(BIN_DIR)/day$(DAY)
TEST_TARGET = $(BIN_DIR)/test_day$(DAY)

.PHONY: all run test clean

all: $(TARGET)

$(TARGET): $(MAIN_SRC)
	@mkdir -p $(BIN_DIR) # Ensure bin directory exists
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

run: $(TARGET)
	@echo "Running day $(DAY)..."
	@# Check if the input file exists before trying to run
	@[ -f $(INPUT_DIR)/day$(DAY).txt ] && ./$< < $(INPUT_DIR)/day$(DAY).txt || ./$<
	@echo "---"

test: $(TEST_TARGET)
	@echo "Running tests for day $(DAY)..."
	@./$<
	@echo "---"

$(TEST_TARGET): $(MAIN_SRC) $(TEST_SRC)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS) $(LDLIBS_TEST)
	@echo "Built test suite: $@"

clean:
	@echo "Cleaning up..."
	@rm -rf $(BIN_DIR)
