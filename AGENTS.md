# AGENTS.md - Living Documentation for Colour Verification

**Purpose:** This file serves as living documentation for agents working on colour verification and related tasks in the nvim-matrix-theme repository. All agents should update this file with their findings, fixes, and learnings.

---

## 📋 Table of Contents

1. [Colour Categories](#colour-categories)
2. [Verification History](#verification-history)
3. [Known Issues](#known-issues)
4. [Fixes Applied](#fixes-applied)
5. [Current Status](#current-status)
6. [Section Documentation Status](#section-documentation-status)
7. [Guidelines for Agents](#guidelines-for-agents)

---

## 🎨 Colour Categories

The theme uses a structured colour palette with the following categories, as defined in `lua/matrix/colours.lua`:

### Monochrome (5-step gradient: #ffffff → #000000)
- `matrix_light_1 = "#ffffff"` — variables, special characters
- `matrix_light_2 = "#bfbfbf"` — pre-processor / macro
- `matrix_gray = "#808080"` — comments
- `matrix_dark_1 = "#404040"`
- `matrix_dark_2 = "#000000"` — background

### Red
- `matrix_red = "#ff0000"` — error, deleted (git)

### Amber
- `matrix_amber = "#ffbf00"` — caution, todo, changed (git)

### Green (7-step gradient: #00ff00 → #003200)
- `matrix_green_1 = "#00ff00"` — values
- `matrix_green_2 = "#00dd00"` — delimiters, added (git), default colour
- `matrix_green_3 = "#00bb00"` — types
- `matrix_green_4 = "#009a00"` — structs
- `matrix_green_5 = "#007800"` — operators
- `matrix_green_6 = "#005600"` — key-word
- `matrix_green_7 = "#003200"` — conditional

### Turquoise (3-step gradient: #009090 → #004040)
- `matrix_turquoise_1 = "#009090"` — constant
- `matrix_turquoise_2 = "#006868"` — highlight
- `matrix_turquoise_3 = "#004040"` — functions

### Special
- `none = "NONE"` — transparent/none
- `sidebar` — derived from matrix_dark_1 or matrix_dark_2 based on options
- `float` — derived from matrix_dark_1 or matrix_dark_2 based on options
- `cursorlinefg` — derived from matrix_dark_1 or matrix_dark_2 based on options

---

## 📜 Verification History

### 2026-07-05 - Comprehensive Spelling Standardization

**Agent:** Mistral Vibe

**Task:** Fix spelling errors from "color" to "colour" (British English) throughout the codebase.

**Scope:** Comprehensive change affecting:
- File names: `colors.lua` → `colours.lua`, `colors/` directory → `colours/`
- Module references: `matrix.colors` → `matrix.colours`
- Variable names: `terminal_color_X` → `terminal_colour_X` (all 16 terminal colors)
- Function names: `onColorScheme` → `onColourScheme`, `loadColorSet` → `loadColourSet`
- Function parameters: `color` → `colour`, `colorSet` → `colourSet`
- All comments and documentation

**Vim API Preserved:** The following Vim/Neovim built-in variables and commands were kept unchanged to maintain compatibility:
- `vim.g.colors_name`
- `vim.o.termguicolors`
- `colorscheme` (Vim command)
- `ColorScheme` (Vim autocmd event)

**Files Modified:**
- `lua/matrix/colors.lua` → `lua/matrix/colours.lua`
- `colors/matrix.vim` → `colours/matrix.vim`
- `lua/matrix/util.lua`
- `lua/matrix/theme.lua`
- `lua/matrix/init.lua`
- `lua/lualine/themes/matrix.lua`
- `AGENTS.md`
- `README.md`

**Commit:** `99b84d7` - fix(colours): change all spelling from color to colour (British English)

---

### 2026-07-05 - Colourscheme Loading Compatibility Fix

**Agent:** Mistral Vibe

**Task:** Fix colorscheme loading issue after British English spelling changes.

**Problem:** After renaming `colors/matrix.vim` to `colours/matrix.vim` in commit `99b84d7`, the command `vim.cmd [[colorscheme matrix]]` returned "cannot find color scheme 'matrix'" because Vim/Neovim only looks for colorschemes in `colors/` directories in the runtimepath.

**Solution:** Created a compatibility `colors/` directory with a `matrix.vim` file that has identical content to `colours/matrix.vim`. This maintains:
- British English spelling for all internal code (files in `colours/` directory and `lua/matrix/colours.lua` module)
- Vim/Neovim compatibility via the standard `colors/` directory path

**Files Modified:**
- Created `colors/matrix.vim` (new file, same content as `colours/matrix.vim`)

**Testing:**
- `vim.cmd [[colorscheme matrix]]` now loads successfully
- `vim.g.colors_name` equals "matrix"
- `require('matrix.colours')` returns the correct colour palette
- Both `source colors/matrix.vim` and `source colours/matrix.vim` work correctly

**Commit:** (pending) fix(colours): add colors/ compatibility directory for Vim colorscheme loading

---

### 2025-07-05 - Initial Colour Verification

**Agent:** Initial verification agent

**Task:** Double check that the colours are as documented.

**Findings:**
- Colours are documented in `lua/matrix/theme.lua` via section headers (Monochrome, Red, Amber, Green, Turquoise)
- Multiple mismatches found where colour assignments did not match documented categories
- One undefined variable (`matrix.yelow`) causing potential nil errors

**Initial Issues Identified:**
1. Terminal colours section: All 16 terminal colours used `matrix.matrix_green_2` despite section headers indicating Monochrome, Red, Amber, and Green categories
2. TreeSitter section: Multiple items used colours from wrong categories
3. Plugins section: `diffOldFile` used undefined `matrix.yelow`; other items used wrong categories
4. Editor section: `FoldColumn`, `Search`, status line items used wrong categories
5. Syntax section: HTML headings (h4, h5) used wrong categories

**Fixes Applied:** 14 changes to `lua/matrix/theme.lua` (see Fixes Applied section below)

---

## ⚠️ Known Issues

### Resolved Issues (2025-07-05)
All issues listed below have been fixed:

| Issue | Location | Description | Fix Applied |
|-------|----------|-------------|-------------|
| Undefined variable | theme.lua:405 | `matrix.yelow` not defined | Changed to `matrix.matrix_amber` |
| Colour mismatch | theme.lua:406 | Amber section used green_4 | Changed to `matrix.matrix_amber` |
| Colour mismatch | theme.lua:416 | Green section used light_2 | Changed to `matrix.matrix_green_2` |
| Colour mismatch | theme.lua:106 | Monochrome section used green_4 | Changed to `matrix.matrix_gray` |
| Colour mismatch | theme.lua:133 | Green section used red | Changed to `matrix.matrix_green_1` |
| Colour mismatch | theme.lua:135-138 | Green section used dark_1 | Changed to `matrix.matrix_green_2` |
| Colour mismatch | theme.lua:140-141 | Green section used dark_1 | Changed to green colours |
| Colour mismatch | theme.lua:149-153 | Green section used turquoise | Changed to green colours |
| Colour mismatch | theme.lua:177 | BufferLine section used dark_2 | Changed to `matrix.matrix_turquoise_3` |
| Terminal colours | theme.lua:205-226 | All used green_2 | Reassigned to category-appropriate colours |
| Section mismatch | theme.lua:235 | TSError in Monochrome used red | Moved to Red section |
| Colour mismatch | theme.lua:256-257 | Green section used red | Changed to `matrix.matrix_green_7` |
| Colour mismatch | theme.lua:265-271 | Turquoise section used wrong colours | Changed to turquoise colours |
| Colour mismatch | theme.lua:276, 278 | Turquoise section used wrong colours | Changed to turquoise colours |
| Colour mismatch | theme.lua:54-55 | Turquoise section used amber/red | Changed to turquoise colours |

### Outstanding Issues

None at this time. The following sections do not have colour category documentation and therefore cannot be verified:

- TreeSitter italic/non-italic conditional blocks (lines 281-322)
- LSP section (lines 329-386) - uses descriptive headers like "Turquoise (errors/warnings mapped)" rather than category headers
- Plugins section (lines 391-575) - uses plugin-specific headers like "Neogit", "GitSigns", etc.

---

## ✅ Fixes Applied

### 2025-07-05 - Colour Category Alignment

**File:** `lua/matrix/theme.lua`

**Changes:**

1. **Lines 405-406** (Plugins section - Amber):
   ```lua
   -- Before:
   diffOldFile = { fg = matrix.yelow }
   WhichKeyDesc = { fg = matrix.matrix_green_4, style = "italic" }
   
   -- After:
   diffOldFile = { fg = matrix.matrix_amber }
   WhichKeyDesc = { fg = matrix.matrix_amber, style = "italic" }
   ```

2. **Line 416** (Plugins section - Green):
   ```lua
   -- Before: diffNewFile = { fg = matrix.matrix_light_2 }
   -- After:  diffNewFile = { fg = matrix.matrix_green_2 }
   ```

3. **Line 106** (Editor section - Monochrome):
   ```lua
   -- Before: FoldColumn = { fg = matrix.matrix_green_4 }
   -- After:  FoldColumn = { fg = matrix.matrix_gray }
   ```

4. **Line 133** (Editor section - Green):
   ```lua
   -- Before: Search = { fg = matrix.matrix_red, bg = matrix.matrix_green_5, style = "reverse" }
   -- After:  Search = { fg = matrix.matrix_green_1, bg = matrix.matrix_green_5, style = "reverse" }
   ```

5. **Lines 135-138** (Editor section - Green):
   ```lua
   -- Before: StatusLine* = { fg = ..., bg = matrix.matrix_dark_1 }
   -- After:  StatusLine* = { fg = ..., bg = matrix.matrix_green_2 }
   ```

6. **Lines 140-141** (Editor section - Green):
   ```lua
   -- Before: TablineSel = { fg = matrix.matrix_dark_1, bg = ... }
   --         Tabline = { fg = ..., bg = matrix.matrix_dark_1 }
   -- After:  TablineSel = { fg = matrix.matrix_green_1, bg = ... }
   --         Tabline = { fg = ..., bg = matrix.matrix_green_2 }
   ```

7. **Lines 149-153** (Editor section - Green):
   ```lua
   -- Before: InsertMode/ReplacelMode/VisualMode/CommandMode/Warnings used turquoise
   -- After:  All use green category colours
   ```

8. **Line 177** (Editor section - BufferLine):
   ```lua
   -- Before: BufferLineFill = { bg = matrix.matrix_dark_2 }
   -- After:  BufferLineFill = { bg = matrix.matrix_turquoise_3 }
   ```

9. **Lines 205-226** (Terminal colours section):
   ```lua
   -- Before: All terminal colours = matrix.matrix_green_2
   -- After:  
   --   Monochrome: matrix_dark_2, matrix_light_2, matrix_dark_1, matrix_light_1
   --   Red: matrix_red
   --   Amber: matrix_amber
   --   Green: matrix_green_1 through matrix_green_7
   ```

10. **Line 235** (TreeSitter section - Red):
    ```lua
    -- Before: TSError in Monochrome section = matrix.matrix_red
    -- After:  TSError moved to Red section = matrix.matrix_red
    ```

11. **Lines 256-257** (TreeSitter section - Green):
    ```lua
    -- Before: TSParameter, TSParameterReference = matrix.matrix_red
    -- After:  TSParameter, TSParameterReference = matrix.matrix_green_7
    ```

12. **Lines 265-271** (TreeSitter section - Turquoise):
    ```lua
    -- Before: TSConst, TSVariable, TSInclude used light_1 or green_7
    -- After:  All use turquoise_3
    ```

13. **Lines 276, 278** (TreeSitter section - Turquoise):
    ```lua
    -- Before: TSUnderline = green_7, TSAnnotationAlt = light_2
    -- After:  TSUnderline = turquoise_1, TSAnnotationAlt = turquoise_2
    ```

14. **Lines 54-55** (Syntax section - Turquoise):
    ```lua
    -- Before: htmlH4 = amber, htmlH5 = red
    -- After:  htmlH4 = turquoise_1, htmlH5 = turquoise_2
    ```

---

## ✅ Current Status

### Verified Sections (All colours match documented categories)

- ✅ **Syntax section** (lines 6-53 in theme.lua)
  - Monochrome: SpecialChar, Special, Delimiter, Identifier, PreCondit, PreProc, Include, Define, Macro, Ignore, Conceal
  - Red: Error
  - Amber: Todo
  - Green: Character, Float, Number, Boolean, Type, Typedef, Structure, Operator, StorageClass, Statement, Label, Exception, Tag
  - Turquoise: Constant, Underlined, SpecialComment, Function, Debug, htmlLink, htmlH1-H5, markdownH1-H3, markdownH1Delimiter-H3Delimiter

- ✅ **Editor section** (lines 103-177 in theme.lua)
  - Monochrome: EndOfBuffer, Folded, FoldColumn, LineNr, NonText
  - Red: MatchParen, IncSearch, ErrorMsg
  - Amber: WarningMsg
  - Green: NormalFloat, FloatBorder, Cursor, CursorIM, Directory, CursorLineNr, ModeMsg, MoreMsg, Pmenu, PmenuSel, PmenuSbar, PmenuThumb, QuickFixLine, qfLineNr, Search, SpecialKey, StatusLine, StatusLineNC, StatusLineTerm, StatusLineTermNC, TabLineFill, TablineSel, Tabline, Visual, VisualNOS, CursorColumn, CursorLine, ToolbarLine, ToolbarButton, NormalMode, InsertMode, ReplacelMode, VisualMode, CommandMode, Warnings
  - Turquoise: Title, Question, SpellBad, SpellCap, SpellLocal, SpellRare, WildMenu, healthError, healthWarning, healthSuccess, DashboardShortCut, DashboardHeader, DashboardCenter, DashboardFooter, BufferLineIndicatorSelected, BufferLineFill

- ✅ **Terminal colours section** (lines 205-226 in theme.lua)
  - Monochrome: terminal_colour_0, 7, 8, 15
  - Red: terminal_colour_1, 9
  - Amber: terminal_colour_3, 11
  - Green: terminal_colour_2, 4, 5, 6, 10, 12, 13, 14

- ✅ **TreeSitter main section** (lines 233-279 in theme.lua)
  - Red: TSError, TSEmphasis, TSTitle
  - Green: TSText, TSConstructor, TSVariableBuiltin, TSBoolean, TSType, TSTypeBuiltin, TSTag, TSOperator, TSFuncMacro, TSConstBuiltin, TSConstMacro, TSMethod, TSField, TSParameter, TSParameterReference, TSPunctDelimiter, TSPunctBracket, TSPunctSpecial, TSLiteral
  - Turquoise: TSAnnotation, TSConst, TSFloat, TSNumber, TSAttribute, TSVariable, TSException, TSInclude, TSLabel, TSSymbol, TSTagDelimiter, TSTextReference, TSUnderline, TSURI, TSAnnotationAlt

### Unverified Sections (No colour category documentation)

The following sections use descriptive comments rather than colour category headers (Monochrome/Red/Amber/Green/Turquoise), so they cannot be automatically verified:

- TreeSitter conditional blocks (lines 281-322): Uses comments like "Comments", "Conditionals", "Function names"
- LSP section (lines 329-386): Uses comments like "Turquoise (errors/warnings mapped)", "Red (information)", "Green (hints / references)"
- Plugins section (lines 391-575): Uses plugin-specific comments like "Neogit", "GitSigns", "Telescope", etc.

These sections may still have colour mismatches but lack the explicit colour category documentation needed for verification.

---

## 📊 Section Documentation Status

| Section | Colour Category Headers | Status | Notes |
|---------|-------------------------|--------|-------|
| Syntax | Yes | ✅ Verified | All colours match documentation |
| Editor | Yes | ✅ Verified | All colours match documentation |
| Terminal colours | Yes | ✅ Verified | All colours match documentation |
| TreeSitter (main) | Yes | ✅ Verified | All colours match documentation |
| TreeSitter (italic) | No | ⚠️ Unverified | Uses descriptive headers |
| LSP | Partial | ⚠️ Unverified | Uses mixed header types |
| Plugins | No | ⚠️ Unverified | Uses plugin-specific headers |

---

## 🤖 Guidelines for Agents

### General Requirements

**UPDATE FREQUENTLY:** Update this AGENTS.md file after EVERY action, finding, or change. Do not batch updates - document incrementally as you work.

**DO NOT PUSH CHANGES:** Never push changes to remote repositories. Always leave commits for human review and approval before pushing.

**USE PROPER BRITISH ENGLISH:** Always use British English spelling (e.g., "colour" not "color", "behaviour" not "behavior") in all code, comments, documentation, and file names.

### Commit Style

**ALWAYS use Conventional Commits format:**
- `fix(scope): description` - for bug fixes
- `feat(scope): description` - for new features
- `docs(scope): description` - for documentation changes
- `refactor(scope): description` - for code refactoring
- `chore(scope): description` - for maintenance tasks

Scope should be the file or component being changed (e.g., `colours`, `theme`, `terminal`).

**Commit message example:**
```
fix(colours): align terminal colour assignments with documented categories

- Changed terminal_colour_0 from green_2 to dark_2 (Monochrome)
- Changed terminal_colour_1 from green_2 to red (Red)

Generated by Mistral Vibe.
Co-Authored-By: Mistral Vibe <vibe@mistral.ai>
```

### When Working on Colour-Related Tasks

1. **Always check this file first** - Review the Colour Categories, Verification History, and Known Issues sections before starting work.

2. **Update this file IMMEDIATELY with your findings** - Document after each action:
   - What you checked
   - What issues you found
   - What fixes you applied
   - What the current status is

3. **Follow the existing format** - Use the same structure and style as previous entries.

4. **Be specific** - Include:
   - File names and line numbers
   - Exact code before and after changes
   - The reasoning behind your changes

5. **Date and timestamp your entries** - Always include the date and time of your work.

6. **Mark issues as resolved or outstanding** - Use clear status indicators (✅, ⚠️, ❌)

7. **Commit after each logical change** - Do not wait until the end. Commit with conventional commit messages.

### How to Verify Colours Are As Documented

1. Identify sections with colour category headers (Monochrome, Red, Amber, Green, Turquoise)
2. For each highlight group in the section, check the colour variable used
3. Verify the colour variable belongs to the documented category:
   - Monochrome: light_1, light_2, gray, dark_1, dark_2
   - Red: red
   - Amber: amber
   - Green: green_1 through green_7
   - Turquoise: turquoise_1 through turquoise_3
4. If a mismatch is found, either:
   - Change the colour to match the section, OR
   - Move the highlight group to the correct section
5. **DOCUMENT IMMEDIATELY** in this file

### How to Add New Colour Categories

If you add new colour categories to the palette:

1. **Update AGENTS.md first** - Document the new category before making changes
2. Add the category to the Colour Categories section
3. Define the colour variables in `lua/matrix/colours.lua`
4. Update the section headers in theme files
5. Document the new category and its purpose
6. **Commit with conventional commit message**
7. Update verification guidelines

### Update Frequency Rules

- Update AGENTS.md **before** making changes (document your plan)
- Update AGENTS.md **after** each change (document what was done)
- Update AGENTS.md **after** each commit (log the commit in Update Log)
- No change is too small to document
- When in doubt, update more frequently

---

## 📝 Update Log

| Date | Time | Agent | Task | Changes |
|------|------|-------|------|---------|
| 2025-07-05 | ~20:00 | Initial agent | Double check colours are as documented | Created this file, identified 14+ mismatches, applied fixes to theme.lua |
| 2025-07-05 | ~20:30 | Initial agent | Commit colour fixes | Committed 14 fixes to theme.lua and created AGENTS.md living documentation |
| 2025-07-05 | ~20:35 | Initial agent | Update guidelines | Added conventional commit style requirement and frequent update requirement to AGENTS.md |
| 2026-07-05 | ~21:00 | Mistral Vibe | Fix spelling errors | Comprehensive spelling fix: Changed all "color" to "colour" (British English) throughout codebase including file names, variable names, function names, module references, and documentation. Preserved Vim API variables (colors_name, termguicolors, colorscheme, ColorScheme). |
| 2026-07-05 | ~22:00 | Mistral Vibe | Fix colorscheme loading | Added `colors/matrix.vim` compatibility wrapper to maintain Vim/Neovim colorscheme loading while preserving British English spelling in `colours/` directory. Both `colorscheme matrix` and direct sourcing of either file work correctly. |

---

**Last Updated:** 2026-07-05 22:00
