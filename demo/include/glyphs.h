#ifndef GLYPHS_H
#define GLYPHS_H

/* Enum constants exercise @constant; the count is @number. */
typedef enum {
    GLYPH_ASCII = 0,
    GLYPH_KATAKANA = 1,
    GLYPH_MIXED = 2,
    GLYPH_SET_COUNT = 3,
} glyph_set_t;

/* Function declarations exercise @type, @variable.parameter, @punctuation. */
const char *glyph_next(unsigned seed, glyph_set_t set);
char glyph_head(unsigned seed);

#endif /* GLYPHS_H */
