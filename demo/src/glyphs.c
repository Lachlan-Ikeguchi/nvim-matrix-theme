#include "glyphs.h"

/* Tables of string literals exercise @string; escapes exercise @string.escape. */
static const char *const ascii_pool = "01abcdefXYZ#$%&{}";
static const char *const katakana_pool =
    "\xe3\x82\xa2\xe3\x82\xab\xe3\x82\xb5\xe3\x82\xbf\xe3\x83\x8a"
    "\xe3\x83\x8f\xe3\x83\x9e\xe3\x83\xa4\xe3\x83\xa9\xe3\x83\xaf";

static unsigned next(unsigned *state)
{
    /* xorshift32: operators everywhere exercise @operator. */
    *state ^= *state << 13;
    *state ^= *state >> 17;
    *state ^= *state << 5;
    return *state;
}

char glyph_head(unsigned seed)
{
    /* char literals exercise @character, @number. */
    return seed % 2 == 0 ? '@' : '#';
}

const char *glyph_next(unsigned seed, glyph_set_t set)
{
    const char *pool;
    unsigned idx;

    switch (set) {
    case GLYPH_ASCII:
        pool = ascii_pool;
        break;
    case GLYPH_KATAKANA:
        pool = katakana_pool;
        break;
    case GLYPH_MIXED:
        /* Ternary exercises @keyword.conditional.ternary. */
        pool = seed % 2 ? ascii_pool : katakana_pool;
        break;
    default:
        pool = ascii_pool;
        break;
    }

    idx = next(&seed) % 16;
    return &pool[idx];
}
