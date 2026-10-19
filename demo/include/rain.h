#ifndef RAIN_H
#define RAIN_H

#include <stddef.h>

#define RAIN_COLS 80
#define RAIN_MAX_DROPS 512
#define RAIN_VERSION "1.0.0"

#define DROP_MIN_SPEED 1
#define DROP_MAX_SPEED 12

#define IS_FAST(speed) ((speed) > DROP_MAX_SPEED / 2)

/* TODO: swap the xorshift for something seeded from the clock. */
/* typedef exercises @type.definition / @keyword.type (struct members: @property). */
typedef struct {
    int col;
    int len;
    int speed;
    unsigned state;
} drop_t;

typedef struct {
    drop_t drops[RAIN_MAX_DROPS];
    size_t drop_count;
    int ticks;
    int running;
} rain_t;

void rain_init(rain_t *rain, size_t drops);
void rain_step(rain_t *rain);
void rain_toggle(rain_t *rain);
int rain_active(const rain_t *rain);

#endif /* RAIN_H */
