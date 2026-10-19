#include "rain.h"

#include <stdlib.h>

/* Macro call exercises @function.macro. */
#define CLAMP(x, lo, hi) ((x) < (lo) ? (lo) : ((x) > (hi) ? (hi) : (x)))

static unsigned advance(unsigned *state)
{
    *state ^= *state << 13;
    *state ^= *state >> 17;
    *state ^= *state << 5;
    return *state;
}

static void drop_start(drop_t *drop, rain_t *rain)
{
    /* Streams spawn mid-air so the screen fills without a visible wave. */
    drop->head = (int)(advance(&drop->state) % (unsigned)rain->rows);
    drop->length = 3 + (int)(advance(&drop->state) % (unsigned)(rain->rows * 3 / 4));
    drop->speed = 1;
}

int rain_resize(rain_t *rain, int cols, int rows)
{
    drop_t *drops;
    int i;

    if (cols <= 0 || rows <= 0) {
        return -1;
    }

    drops = realloc(rain->drops, (size_t)cols * sizeof(*drops));
    if (drops == NULL) {
        return -1;
    }

    /* Newly visible columns start idle; each keeps its own xorshift seed. */
    for (i = rain->cols; i < cols; i++) {
        drops[i].head = -1;
        drops[i].length = 0;
        drops[i].speed = 1;
        drops[i].state = (unsigned)(i * 747796405u + 2891336453u);
    }

    rain->drops = drops;
    rain->cols = cols;
    rain->rows = rows;

    return 0;
}

void rain_step(rain_t *rain, int async)
{
    int col;

    if (!rain->running) {
        return;
    }

    for (col = 0; col < rain->cols; col++) {
        drop_t *drop = &rain->drops[col];

        if (async) {
            /* Vary scroll rate so streams decouple from the frame clock. */
            drop->speed = CLAMP(1 + (int)(advance(&drop->state) % 3), 1, 3);
        }

        if (drop->head < 0) {
            if (advance(&drop->state) % 7 == 0) {
                drop_start(drop, rain);
            }
            continue;
        }

        drop->head += drop->speed;

        /* The tail leaves the screen: idle for a random gap, then respawn. */
        if (drop->head - drop->length >= rain->rows &&
            advance(&drop->state) % 2 == 0) {
            drop->head = -1;
        }
    }

    rain->ticks++;
}

void rain_toggle(rain_t *rain)
{
    rain->running = !rain->running;
}

int rain_active(const rain_t *rain)
{
    return rain->running && rain->drops != NULL;
}
