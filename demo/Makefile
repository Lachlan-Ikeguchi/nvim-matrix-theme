# matrix-c-demo -- a cmatrix clone for browsing treesitter colours
CC      ?= gcc
CFLAGS  ?= -std=c11 -Wall -Wextra -O2
CFLAGS  += $(shell pkg-config --cflags ncursesw 2>/dev/null)
# Nix clang wrappers do not search /usr/include by default; ncursesw
# headers include "ncursesw/ncurses_dll.h" relative to it.
CFLAGS  += -I/usr/include
LDLIBS  := $(shell pkg-config --libs ncursesw 2>/dev/null || echo -lncursesw)
BUILD   := build

SRC := src/main.c src/rain.c src/glyphs.c
OBJ := $(SRC:src/%.c=$(BUILD)/%.o)
BIN := $(BUILD)/matrix

all: $(BIN)

$(BIN): $(OBJ) | $(BUILD)
	$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)

build/%.o: src/%.c include/glyphs.h include/rain.h | $(BUILD)
	$(CC) $(CFLAGS) -Iinclude -c $< -o $@

$(BUILD):
	mkdir -p $(BUILD)

clean:
	rm -rf $(BUILD)

.PHONY: all clean
