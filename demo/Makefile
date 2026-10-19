# matrix-c-demo -- throwaway project for browsing treesitter colours
CC      ?= gcc
CFLAGS  ?= -std=c11 -Wall -Wextra -O2
BUILD   := build

SRC := src/main.c src/rain.c src/glyphs.c
OBJ := $(SRC:src/%.c=$(BUILD)/%.o)
BIN := $(BUILD)/rain

all: $(BIN)

$(BIN): $(OBJ) | $(BUILD)
	$(CC) $(CFLAGS) -o $@ $^

build/%.o: src/%.c include/glyphs.h include/rain.h | $(BUILD)
	$(CC) $(CFLAGS) -Iinclude -c $< -o $@

$(BUILD):
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD)

.PHONY: all clean
