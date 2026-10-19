/*
 * matrix-c-demo: a terminal-free simulation of Matrix-style rain,
 * useful only for staring at colours.
 *
 * Function bodies exercise @keyword.repeat, @keyword.conditional,
 * @keyword.return, @keyword.operator (sizeof), @variable.builtin (NULL),
 * and @function.builtin (printf).
 */

#include "rain.h"
#include "glyphs.h"

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
    size_t drops = 64;
    rain_t rain;
    char *end = NULL;
    int i;

    if (argc > 1) {
        /* strtoul/printf exercise @function.builtin and @function.call. */
        unsigned long parsed = strtoul(argv[1], &end, 10);

        if (end == argv[1] || parsed == 0) {
            fprintf(stderr, "usage: %s [drops <= %d]\n", argv[0], RAIN_MAX_DROPS);
            return EXIT_FAILURE;
        }

        drops = (size_t)parsed;
    }

    if (sizeof(rain) > 4096) {
        fprintf(stderr, "rain_t is suspiciously large (%zu bytes)\n", sizeof(rain));
    }

    rain_init(&rain, drops);

    for (i = 0; i < 3; i++) {
        int j;

        rain_step(&rain);

        for (j = 0; j < (int)rain.drop_count; j++) {
            const drop_t *drop = &rain.drops[j];
            const char *glyph = glyph_next(drop->state, GLYPH_MIXED);

            printf("tick %d: drop %d col %d len %d speed %d glyph %c%c\n",
                   rain.ticks, j, drop->col, drop->len, drop->speed,
                   glyph[0], glyph[0] ? glyph[1] : '\0');
        }

        printf("--- version %s, %zu drops, running=%d ---\n",
               RAIN_VERSION, rain.drop_count, rain_active(&rain));
    }

    rain_toggle(&rain);

    return rain_active(&rain) ? EXIT_SUCCESS : EXIT_SUCCESS;
}
