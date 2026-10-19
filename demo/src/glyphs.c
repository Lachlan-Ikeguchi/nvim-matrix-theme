#include "glyphs.h"

/* Tables of string literals exercise @string; UTF-8 escapes exercise @string.escape. */
static const char *const katakana[] = {
    "\xe3\x82\xa2", "\xe3\x82\xa4", "\xe3\x82\xa6", "\xe3\x82\xa8",
    "\xe3\x82\xaa", "\xe3\x82\xab", "\xe3\x82\xad", "\xe3\x82\xaf",
    "\xe3\x82\xb1", "\xe3\x82\xb3", "\xe3\x82\xb5", "\xe3\x82\xb7",
    "\xe3\x82\xb9", "\xe3\x82\xbb", "\xe3\x82\xbf", "\xe3\x83\x81",
    "\xe3\x83\x84", "\xe3\x83\x86", "\xe3\x83\x8a", "\xe3\x83\x8b",
    "\xe3\x83\x8c", "\xe3\x83\x8d", "\xe3\x83\x8f", "\xe3\x83\x92",
    "\xe3\x83\x95", "\xe3\x83\x98", "\xe3\x83\x9e", "\xe3\x83\x9f",
    "\xe3\x83\xa0", "\xe3\x83\xa1", "\xe3\x83\xa2", "\xe3\x83\xa4",
    "\xe3\x83\xa6", "\xe3\x83\xa8", "\xe3\x83\xaa", "\xe3\x83\xab",
    "\xe3\x83\xac", "\xe3\x83\xad", "\xe3\x83\xaf", "\xe3\x83\xb3",
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
};

static const char *const ascii[] = {
    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
    "a", "b", "c", "d", "e", "f", "g", "h", "i", "j",
    "k", "l", "m", "n", "o", "p", "q", "r", "s", "t",
    "u", "v", "w", "x", "y", "z",
    "!", "#", "$", "%", "&", "*", "+", "-", "<", "=", ">", "?", "@", "~",
};

#define POOL_COUNT(pool) (sizeof(pool) / sizeof(pool[0]))

static unsigned advance(unsigned *state)
{
    /* xorshift32: operators everywhere exercise @operator. */
    *state ^= *state << 13;
    *state ^= *state >> 17;
    *state ^= *state << 5;
    return *state;
}

const char *glyph_next(unsigned *state, glyph_set_t set)
{
    const char *const *pool;
    unsigned count;

    switch (set) {
    case GLYPH_ASCII:
        pool = ascii;
        count = POOL_COUNT(ascii);
        break;
    case GLYPH_KATAKANA:
        pool = katakana;
        count = POOL_COUNT(katakana);
        break;
    case GLYPH_MIXED:
    default:
        /* Ternary exercises @keyword.conditional.ternary. */
        pool = advance(state) % 2 ? ascii : katakana;
        count = advance(state) % 2 ? POOL_COUNT(ascii) : POOL_COUNT(katakana);
        break;
    }

    return pool[advance(state) % count];
}
