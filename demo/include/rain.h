#ifndef RAIN_H
#define RAIN_H

#include <stddef.h>

#define RAIN_VERSION "2.0.0"

#define RAIN_MIN_SPEED 1
#define RAIN_MAX_SPEED 10
#define RAIN_DEFAULT_SPEED 4

#define RAIN_MIN_FRAME_MS 10
#define RAIN_MAX_FRAME_MS 500
#define RAIN_DEFAULT_FRAME_MS 80

#define RAIN_DEFAULT_COLOR "green"

/* typedef exercises @type.definition / @keyword.type (struct members: @property). */
typedef struct {
    int head;     /* row of the leading glyph, -1 while the column idles */
    int length;   /* trail length in rows */
    int speed;    /* rows advanced per frame (async scrolls vary this) */
    unsigned state; /* per-column xorshift seed */
} drop_t;

typedef struct {
    drop_t *drops;  /* one per terminal column, NULL before rain_resize */
    int cols;
    int rows;
    int running;
    unsigned long ticks;
} rain_t;

/* Returns 0 on success. rain must be zero-initialised by the caller. */
int rain_resize(rain_t *rain, int cols, int rows);

/* Advances every stream one frame. Exercises @keyword.conditional. */
void rain_step(rain_t *rain, int async);

/* Toggles the pause flag ('q' still quits; any other key resumes). */
void rain_toggle(rain_t *rain);

int rain_active(const rain_t *rain);

#endif /* RAIN_H */
