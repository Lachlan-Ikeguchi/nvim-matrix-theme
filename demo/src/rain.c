#include "rain.h"

#include <stdio.h>

/* Macro call exercises @function.macro. */
#define CLAMP(x, lo, hi) ((x) < (lo) ? (lo) : ((x) > (hi) ? (hi) : (x)))

static unsigned advance(unsigned *state)
{
    *state ^= *state << 13;
    *state ^= *state >> 17;
    *state ^= *state << 5;
    return *state;
}

static void drop_reset(drop_t *drop, rain_t *rain)
{
    drop->col = (int)(advance(&rain->drops[0].state) % RAIN_COLS);
    drop->len = 4 + (int)(advance(&rain->drops[0].state) % 24);
    drop->speed = CLAMP(1 + (int)(advance(&rain->drops[0].state) % 12),
                        DROP_MIN_SPEED, DROP_MAX_SPEED);
    drop->state = advance(&rain->drops[0].state);
}

void rain_init(rain_t *rain, size_t drops)
{
    size_t i;

    if (drops > RAIN_MAX_DROPS) {
        drops = RAIN_MAX_DROPS;
    }

    rain->drop_count = drops;
    rain->ticks = 0;
    rain->running = 1;

    for (i = 0; i < drops; i++) {
        drop_reset(&rain->drops[i], rain);
    }
}

void rain_step(rain_t *rain)
{
    size_t i;

    if (!rain->running) {
        return;
    }

    for (i = 0; i < rain->drop_count; i++) {
        drop_t *drop = &rain->drops[i];

        drop->state += (unsigned)drop->speed;
        drop->col = (drop->col + drop->speed) % RAIN_COLS;

        if (drop->len > 32 && IS_FAST(drop->speed)) {
            drop->len = 4;
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
    return rain->running && rain->drop_count > 0;
}
