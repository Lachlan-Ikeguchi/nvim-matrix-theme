#ifndef GLYPHS_H
#define GLYPHS_H

/* Enum constants exercise @constant; the count is @number. */
typedef enum {
    GLYPH_ASCII = 0,
    GLYPH_KATAKANA = 1,
    GLYPH_MIXED = 2,
    GLYPH_SET_COUNT = 3,
} glyph_set_t;

/*
 * Returns a NUL-terminated UTF-8 glyph drawn from the given pool.
 * The returned pointer is static and valid until the next call.
 */
const char *glyph_next(unsigned *state, glyph_set_t set);

#endif /* GLYPH_H */
