# Neovim Matrix Theme

=====================

## Principles

- Instead of hue contrast, prefer value and form contrast to spare hue for where it matters.
- Maximise syntax highlighting value by having a lean set of variations to be able to deduce what it is at a glance.

## Language Targets

- C
- C++
- Rust
- Lua
- Julia
- Python
- LaTeX
- Markdown

### Syntax Highlighting (ordered: hue -> value -> bold -> italic -> normal)

- Preprocessors: `turquoise_2`
- Headings:
  - 1: `turquoise_1, bold`
  - 2: `turquoise_1`
  - 3: `turquoise_1, italic`
  - 4: `turquoise_3, bold`
  - 5: `turquoise_3`
  - 6: `turquoise_3, italic`
- Types: `green_1, bold`
- Functions: `green_1, italic`
- Namespaces: `green_1`
- Keywords: `green_2, bold`
- Values: `green_2, italic`
  - Special Chars: `mono_1`
- Variables: `green_2`
  - Field: `green_3, italic`
- Delimiters: `green_3, bold`
- Operators: `green_3`

## Palette

### Monochrome

Complementary palette

- `#ffffff`
- `#bfbfbf`
- `#808080`: all comments
- `#505050`: all dim
- `#000000`

### Red

- `#ff3030`: all errors

### Amber

- `#ffbf00`: all warnings

### Green

Primary palette

- `#00f000`
- `#00d500`
- `#00b900`
- `#009e00`
- `#008200`
- `#006700`
- `#004b00`
- `#003000`

### Turquoise

Secondary palette

- `#00d0d0`
- `#00b0b0`: all info
- `#009090`

### Modifiers

- `bold`
- `italic`
- `underline`: all diagnostics
- `strikethrough`
