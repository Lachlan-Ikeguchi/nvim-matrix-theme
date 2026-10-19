/*
 * matrix-c-demo: a cmatrix clone written to browse treesitter colours.
 * Build against ncursesw; run it in a UTF-8 locale for katakana.
 */

#ifndef _XOPEN_SOURCE
#define _XOPEN_SOURCE 700
#endif

#include "rain.h"
#include "glyphs.h"

#include <curses.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

/* Named colours map to init_pair indices; the table exercises @constant. */
typedef enum {
    COLOR_SLOT_GREEN = 1,
    COLOR_SLOT_RED,
    COLOR_SLOT_BLUE,
    COLOR_SLOT_YELLOW,
    COLOR_SLOT_MAGENTA,
    COLOR_SLOT_CYAN,
    COLOR_SLOT_WHITE,
    COLOR_SLOT_BLACK,
} color_slot_t;

/* Bold modes, mirroring cmatrix's -b/-B/-n flags. */
typedef enum {
    BOLD_HEAD,
    BOLD_ALL,
    BOLD_NONE,
} bold_mode_t;

static const struct {
    const char *name;
    int slot;
} color_table[] = {
    { "green",    COLOR_SLOT_GREEN },
    { "red",      COLOR_SLOT_RED },
    { "blue",     COLOR_SLOT_BLUE },
    { "yellow",   COLOR_SLOT_YELLOW },
    { "magenta",  COLOR_SLOT_MAGENTA },
    { "cyan",     COLOR_SLOT_CYAN },
    { "white",    COLOR_SLOT_WHITE },
    { "black",    COLOR_SLOT_BLACK },
};

static unsigned advance(unsigned *state)
{
    /* xorshift32, shared shape with rain.c and glyphs.c. */
    *state ^= *state << 13;
    *state ^= *state >> 17;
    *state ^= *state << 5;
    return *state;
}

static void usage(FILE *out, const char *prog)
{
    static const char *const text[] = {
        "usage: %s [-a] [-b|-B|-n] [-C colour] [-s speed] [-u usec]",
        "  -a         asynchronous scroll (streams advance at varying rates)",
        "  -b         all glyphs bold",
        "  -B         bold lead glyph only (default)",
        "  -n         no bold at all",
        "  -C colour  green (default), red, blue, yellow, magenta, cyan, white, black",
        "  -s speed   1 (slow) to 10 (fast), default 4",
        "  -u usec    frame delay in microseconds, default 80000",
        "  -h         this help",
        "  -V         version",
        "Keys: q quit, p pause, any other key resumes.",
    };
    size_t i;

    for (i = 0; i < sizeof(text) / sizeof(text[0]); i++) {
        if (i == 0) {
            fprintf(out, text[i], prog);
            fputc('\n', out);
        } else {
            fprintf(out, "%s\n", text[i]);
        }
    }
}

static int color_slot(const char *name, int *slot)
{
    size_t i;

    for (i = 0; i < sizeof(color_table) / sizeof(color_table[0]); i++) {
        if (strcmp(name, color_table[i].name) == 0) {
            *slot = color_table[i].slot;
            return 0;
        }
    }

    return -1;
}

static void draw_column(rain_t *rain, int col, int bold_mode, int pair)
{
    drop_t *drop = &rain->drops[col];
    int trail_attr;
    int row;

    if (drop->head < 0) {
        return;
    }

    trail_attr = COLOR_PAIR(pair);
    if (bold_mode == BOLD_ALL) {
        trail_attr |= A_BOLD;
    }

    /* Erase the cell falling off the end of the trail. */
    row = drop->head - drop->length;
    if (row >= 0 && row < rain->rows) {
        mvaddch(row, col, ' ');
    }

    if (drop->head < rain->rows) {
        /* The lead glyph is white, like cmatrix; the trail keeps the hue. */
        int head_attr = COLOR_PAIR(COLOR_SLOT_WHITE);

        if (bold_mode != BOLD_NONE) {
            head_attr |= A_BOLD;
        }

        mvaddstr(drop->head, col, glyph_next(&drop->state, GLYPH_MIXED));

        /* Repaint the previous head cell in the trail colour. */
        if (drop->head > 0) {
            attron(trail_attr);
            mvaddstr(drop->head - 1, col, glyph_next(&drop->state, GLYPH_MIXED));
            attroff(trail_attr);
        }

        attron(head_attr);
        mvaddstr(drop->head, col, glyph_next(&drop->state, GLYPH_MIXED));
        attroff(head_attr);
    }

    /* cmatrix flickers mid-trail glyphs; repaint one random cell per frame. */
    if (drop->length > 2) {
        row = drop->head - 2 - (int)(advance(&drop->state) % (unsigned)(drop->length - 2));
        if (row >= 0 && row < rain->rows) {
            attron(trail_attr);
            mvaddstr(row, col, glyph_next(&drop->state, GLYPH_MIXED));
            attroff(trail_attr);
        }
    }
}

int main(int argc, char **argv)
{
    const char *prog = argc > 0 ? argv[0] : "matrix";
    rain_t rain;
    unsigned long delay_us = 80000UL;
    int speed = RAIN_DEFAULT_SPEED;
    int bold_mode = BOLD_HEAD;
    int async = 0;
    int slot = COLOR_SLOT_GREEN;
    int opt;
    int ch;
    int running = 1;
    int col;

    memset(&rain, 0, sizeof(rain));
    rain.running = 1;

    while ((opt = getopt(argc, argv, "abBC:hs:u:V")) != -1) {
        char *end = NULL;

        switch (opt) {
        case 'a':
            async = 1;
            break;
        case 'b':
            bold_mode = BOLD_ALL;
            break;
        case 'B':
            bold_mode = BOLD_HEAD;
            break;
        case 'n':
            bold_mode = BOLD_NONE;
            break;
        case 'C':
            if (color_slot(optarg, &slot) != 0) {
                fprintf(stderr, "%s: unknown colour '%s'\n", prog, optarg);
                return EXIT_FAILURE;
            }
            break;
        case 's':
            /* strtoul exercises @function.builtin and @function.call. */
            {
                unsigned long parsed = strtoul(optarg, &end, 10);

                if (end == optarg || parsed < RAIN_MIN_SPEED || parsed > RAIN_MAX_SPEED) {
                    fprintf(stderr, "%s: speed must be %d-%d\n",
                            prog, RAIN_MIN_SPEED, RAIN_MAX_SPEED);
                    return EXIT_FAILURE;
                }
                speed = (int)parsed;
            }
            break;
        case 'u':
            {
                unsigned long parsed = strtoul(optarg, &end, 10);

                if (end == optarg || parsed == 0) {
                    fprintf(stderr, "%s: bad frame delay\n", prog);
                    return EXIT_FAILURE;
                }
                delay_us = parsed;
            }
            break;
        case 'h':
            usage(stdout, prog);
            return EXIT_SUCCESS;
        case 'V':
            printf("%s %s\n", prog, RAIN_VERSION);
            return EXIT_SUCCESS;
        default:
            usage(stderr, prog);
            return EXIT_FAILURE;
        }
    }

    /* Speed scales the frame delay: 1 is slowest, RAIN_MAX_SPEED fastest. */
    delay_us = delay_us * (unsigned long)(RAIN_MAX_SPEED + 1 - speed) /
               (2 * RAIN_MAX_SPEED);

    setlocale(LC_ALL, "");

    initscr();
    keypad(stdscr, TRUE);
    nodelay(stdscr, TRUE);
    curs_set(0);
    noecho();

    if (has_colors()) {
        start_color();
        init_pair(COLOR_SLOT_GREEN, COLOR_GREEN, COLOR_BLACK);
        init_pair(COLOR_SLOT_RED, COLOR_RED, COLOR_BLACK);
        init_pair(COLOR_SLOT_BLUE, COLOR_BLUE, COLOR_BLACK);
        init_pair(COLOR_SLOT_YELLOW, COLOR_YELLOW, COLOR_BLACK);
        init_pair(COLOR_SLOT_MAGENTA, COLOR_MAGENTA, COLOR_BLACK);
        init_pair(COLOR_SLOT_CYAN, COLOR_CYAN, COLOR_BLACK);
        init_pair(COLOR_SLOT_WHITE, COLOR_WHITE, COLOR_BLACK);
        /* Black flips the video: black glyphs on white, like cmatrix. */
        init_pair(COLOR_SLOT_BLACK, COLOR_BLACK, COLOR_WHITE);
    }

    if (rain_resize(&rain, COLS, LINES) != 0) {
        endwin();
        fprintf(stderr, "%s: out of memory\n", prog);
        return EXIT_FAILURE;
    }

    while (running) {
        rain_step(&rain, async);

        for (col = 0; col < rain.cols; col++) {
            draw_column(&rain, col, bold_mode, slot);
        }

        refresh();

        napms((int)(delay_us / 1000UL));

        ch = getch();
        if (ch == 'q' || ch == 'Q') {
            running = 0;
        } else if (ch == 'p' || ch == ' ') {
            rain_toggle(&rain);
        } else if (ch == KEY_RESIZE) {
            clear();
            if (rain_resize(&rain, COLS, LINES) != 0) {
                running = 0;
            }
        }
    }

    endwin();

    free(rain.drops);

    return EXIT_SUCCESS;
}
