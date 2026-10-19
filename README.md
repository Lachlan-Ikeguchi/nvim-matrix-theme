# Neovim matrix theme
=====================

## Scheme
### Monochrome
5 palette gradient from `#ffffff` to `#000000`
`#ffffff`: special characters
`#bfbfbf`: pre-processor / macros, wildmenu
`#808080`: comments (italic), line numbers
`#404040`: ignored text, end-of-buffer, inactive statusline, cursor line background
`#000000`: background

### Red
`#ff5050`: errors (bold, underlined), matching parenthesis, LSP information diagnostics

### Amber
`#ffbf00`: caution, todo (bold, italic), warnings, `diffOldFile`

### Green
8 palette gradient from `#00f000` to `#003000`
`#00f000`: variables, identifiers
`#00d500`: values, strings, numbers, delimiters, default color for anything not specified
`#00b900`: types
`#009e00`: structs, constructors
`#008200`: operators
`#006700`: keywords (statements, storage classes, labels)
`#004b00`: conditionals, hints, mode messages
`#003000`: floating window background

### Turquoise
3 palette gradient from `#00d0d0` to `#009090`, heading steps brightest at `#00d0d0`
`#00d0d0`: functions (italic), headings, links, LSP warnings
`#00b0b0`: special comments, headings H2, insert mode, title
`#009090`: constants, tags, debug statements, LSP errors, `SpellBad`, headings H3
