local matrix = require("matrix.colors")

local theme = {}

theme.loadSyntax = function()
    -- Syntax highlight groups
    local syntax = {
        -- Monochrome
        SpecialChar = { fg = matrix.matrix_light_1 },      -- special character in a constant
        PreCondit = { fg = matrix.matrix_light_2 },        -- preprocessor #if, #else, #endif, etc.
        PreProc = { fg = matrix.matrix_light_2 },          -- generic Preprocessor
        Include = { fg = matrix.matrix_light_2 },          -- preprocessor #include
        Define = { fg = matrix.matrix_light_2 },           -- preprocessor #define
        Macro = { fg = matrix.matrix_light_2 },            -- same as Define
        Comment = { fg = matrix.matrix_gray, style = "italic" }, -- comments
        Ignore = { fg = matrix.matrix_dark_1 },            -- left blank, hidden
        Conceal = { fg = matrix.none, bg = matrix.matrix_dark_2 },

        -- Red
        Error = { fg = matrix.matrix_red, style = "bold,underline" }, -- any erroneous construct

        -- Amber
        Todo = { fg = matrix.matrix_amber, style = "bold,italic" }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- Green (descending brightness)
        Identifier = { fg = matrix.matrix_green_1 },              -- any variable name
        String = { fg = matrix.matrix_green_2, style = "italic" }, -- any string
        Character = { fg = matrix.matrix_green_2 },               -- any character constant: 'c', '\n'
        Float = { fg = matrix.matrix_green_2 },                   -- a floating point constant: 2.3e10
        Number = { fg = matrix.matrix_green_2 },                  -- a number constant: 5
        Boolean = { fg = matrix.matrix_green_2 },                 -- a boolean constant: TRUE, false
        Delimiter = { fg = matrix.matrix_green_2 },               -- character that needs attention like , or .
        Special = { fg = matrix.matrix_green_2 },                 -- any special symbol
        Type = { fg = matrix.matrix_green_3 },                    -- int, long, char, etc.
        Typedef = { fg = matrix.matrix_green_3 },                 -- A typedef
        Structure = { fg = matrix.matrix_green_4 },               -- struct, union, enum, etc.
        Operator = { fg = matrix.matrix_green_5 },                -- sizeof, "+", "*", etc.
        StorageClass = { fg = matrix.matrix_green_6 },            -- static, register, volatile, etc.
        Statement = { fg = matrix.matrix_green_6 },               -- any statement
        Label = { fg = matrix.matrix_green_6 },                   -- case, default, etc.
        Exception = { fg = matrix.matrix_green_6 },               -- try, catch, throw
        Keyword = { fg = matrix.matrix_green_6, style = "italic" }, -- for, do, while, etc.
        Repeat = { fg = matrix.matrix_green_6, style = "italic" }, -- any other keyword
        Conditional = { fg = matrix.matrix_green_7, style = "italic" }, -- if, then, else, endif, switch, etc.

        -- Turquoise (descending brightness)
        Function = { fg = matrix.matrix_turquoise_1, style = "italic" }, -- function names
        Underlined = { fg = matrix.matrix_turquoise_1, style = "underline" }, -- text that stands out, HTML links
        SpecialComment = { fg = matrix.matrix_turquoise_2 },            -- special things inside a comment
        Debug = { fg = matrix.matrix_turquoise_3 },                     -- debugging statements
        Constant = { fg = matrix.matrix_turquoise_3 },                  -- any constant
        Tag = { fg = matrix.matrix_turquoise_3 },                       -- you can use CTRL-] on this

        htmlLink = { fg = matrix.matrix_turquoise_1, style = "underline" },

        htmlH1 = { fg = matrix.matrix_turquoise_1, style = "bold" },
        htmlH2 = { fg = matrix.matrix_turquoise_2, style = "bold" },
        htmlH3 = { fg = matrix.matrix_turquoise_3, style = "bold" },
        htmlH4 = { fg = matrix.matrix_amber, style = "bold" },
        htmlH5 = { fg = matrix.matrix_red, style = "bold" },

        markdownH1 = { fg = matrix.matrix_turquoise_1, style = "bold" },
        markdownH2 = { fg = matrix.matrix_turquoise_2, style = "bold" },
        markdownH3 = { fg = matrix.matrix_turquoise_3, style = "bold" },

        markdownH1Delimiter = { fg = matrix.matrix_turquoise_1, style = "bold" },
        markdownH2Delimiter = { fg = matrix.matrix_turquoise_2, style = "bold" },
        markdownH3Delimiter = { fg = matrix.matrix_turquoise_3, style = "bold" },
    }
    return syntax
end

theme.loadEditor = function()
    -- Editor highlight groups

    local editor = {
        -- Monochrome
        EndOfBuffer = { fg = matrix.matrix_dark_1 },
        Folded = { fg = matrix.matrix_gray, style = "italic" },
        FoldColumn = { fg = matrix.matrix_green_4 },
        LineNr = { fg = matrix.matrix_gray },
        NonText = { fg = matrix.matrix_dark_1 },

        -- Red
        MatchParen = { fg = matrix.matrix_red, style = "bold" },
        IncSearch = { fg = matrix.matrix_red, bg = matrix.matrix_red },
        ErrorMsg = { fg = matrix.matrix_red },

        -- Amber
        WarningMsg = { fg = matrix.matrix_amber },

        -- Green (descending brightness)
        NormalFloat = { fg = matrix.matrix_green_7, bg = matrix.float }, -- normal text and background color
        FloatBorder = { fg = matrix.matrix_green_7, bg = matrix.float }, -- normal text and background color
        Cursor = { fg = matrix.matrix_green_7, style = "reverse" }, -- the character under the cursor
        CursorIM = { fg = matrix.matrix_green_6, style = "reverse" }, -- like Cursor, but used when in IME mode
        Directory = { fg = matrix.matrix_green_4, bg = matrix.none }, -- directory names (and other special names in listings)
        CursorLineNr = { fg = matrix.matrix_green_7 },
        ModeMsg = { fg = matrix.matrix_green_7 },
        MoreMsg = { fg = matrix.matrix_green_7 },
        Pmenu = { fg = matrix.matrix_green_7, bg = matrix.matrix_green_2 },
        PmenuSel = { fg = matrix.matrix_green_7, bg = matrix.matrix_red },
        PmenuSbar = { fg = matrix.matrix_green_7, bg = matrix.matrix_green_2 },
        PmenuThumb = { fg = matrix.matrix_green_7, bg = matrix.matrix_green_7 },
        QuickFixLine = { fg = matrix.matrix_green_7, style = "reverse" },
        qfLineNr = { fg = matrix.matrix_green_7, style = "reverse" },
        Search = { fg = matrix.matrix_red, bg = matrix.matrix_green_5, style = "reverse" },
        SpecialKey = { fg = matrix.matrix_green_7 },
        StatusLine = { fg = matrix.matrix_green_7, bg = matrix.matrix_green_2 },
        StatusLineNC = { fg = matrix.matrix_green_7, bg = matrix.matrix_dark_1 },
        StatusLineTerm = { fg = matrix.matrix_green_7, bg = matrix.matrix_green_2 },
        StatusLineTermNC = { fg = matrix.matrix_green_7, bg = matrix.matrix_dark_1 },
        TabLineFill = { fg = matrix.matrix_green_7, bg = matrix.none },
        TablineSel = { fg = matrix.matrix_dark_1, bg = matrix.matrix_green_7 },
        Tabline = { fg = matrix.matrix_green_7, bg = matrix.matrix_dark_1 },
        Visual = { fg = matrix.none, bg = matrix.matrix_green_2 },
        VisualNOS = { fg = matrix.none, bg = matrix.matrix_green_2 },
        CursorColumn = { fg = matrix.none, bg = matrix.cursorlinefg },
        CursorLine = { fg = matrix.none, bg = matrix.cursorlinefg },
        ToolbarLine = { fg = matrix.matrix_green_7, bg = matrix.matrix_dark_1 },
        ToolbarButton = { fg = matrix.matrix_green_7, style = "bold" },
        NormalMode = { fg = matrix.matrix_green_7, style = "reverse" },
        InsertMode = { fg = matrix.matrix_turquoise_2, style = "reverse" },
        ReplacelMode = { fg = matrix.matrix_turquoise_3, style = "reverse" },
        VisualMode = { fg = matrix.matrix_green_7, style = "reverse" },
        CommandMode = { fg = matrix.matrix_green_7, style = "reverse" },
        Warnings = { fg = matrix.matrix_turquoise_1 },

        -- Turquoise (descending brightness)
        Title = { fg = matrix.matrix_turquoise_2, style = "bold" },
        Question = { fg = matrix.matrix_turquoise_2 },
        SpellBad = { fg = matrix.matrix_turquoise_3, style = "italic,undercurl" },
        SpellCap = { fg = matrix.matrix_green_4, style = "italic,undercurl" },
        SpellLocal = { fg = matrix.matrix_green_3, style = "italic,undercurl" },
        SpellRare = { fg = matrix.matrix_green_7, style = "italic,undercurl" },
        WildMenu = { fg = matrix.matrix_light_2, style = "bold" },

        -- health
        healthError = { fg = matrix.matrix_red },
        healthWarning = { fg = matrix.matrix_amber },
        healthSuccess = { fg = matrix.matrix_green_1 },

        -- dashboard
        DashboardShortCut = { fg = matrix.matrix_green_4 },
        DashboardHeader = { fg = matrix.matrix_green_7 },
        DashboardCenter = { fg = matrix.matrix_green_3 },
        DashboardFooter = { fg = matrix.matrix_turquoise_2, style = "italic" },

        -- BufferLine
        BufferLineIndicatorSelected = { fg = matrix.matrix_dark_2 },
        BufferLineFill = { bg = matrix.matrix_dark_2 },
    }

    editor.Normal = { fg = matrix.matrix_green_2, bg = matrix.none }
    editor.SignColumn = { fg = matrix.matrix_green_2, bg = matrix.none }

    editor.VertSplit = { fg = matrix.matrix_green_2 }
    return editor
end

theme.loadTerminal = function()
    -- Terminal colors grouped by categories where relevant.
    -- (Original assigned many to same green; preserve grouping for clarity.)

    -- Monochrome / base
    vim.g.terminal_color_0 = matrix.matrix_green_2
    vim.g.terminal_color_7 = matrix.matrix_green_2
    vim.g.terminal_color_8 = matrix.matrix_green_2
    vim.g.terminal_color_15 = matrix.matrix_green_2

    -- Red
    vim.g.terminal_color_1 = matrix.matrix_green_2
    vim.g.terminal_color_9 = matrix.matrix_green_2

    -- Amber
    vim.g.terminal_color_3 = matrix.matrix_green_2
    vim.g.terminal_color_11 = matrix.matrix_green_2

    -- Green (descending brightness)
    vim.g.terminal_color_2 = matrix.matrix_green_2
    vim.g.terminal_color_10 = matrix.matrix_green_2
    vim.g.terminal_color_4 = matrix.matrix_green_2
    vim.g.terminal_color_12 = matrix.matrix_green_2
    vim.g.terminal_color_5 = matrix.matrix_green_2
    vim.g.terminal_color_13 = matrix.matrix_green_2
    vim.g.terminal_color_6 = matrix.matrix_green_2
    vim.g.terminal_color_14 = matrix.matrix_green_2
end

theme.loadTreeSitter = function()
    -- TreeSitter highlight groups using modern capture-based names
    -- ("@keyword", "@string", ...). Colours follow the documented palette
    -- roles in colors.lua, mirroring loadSyntax:
    --   variables=green_1, values/delimiters=green_2, types=green_3,
    --   structs=green_4, operators=green_5, keywords=green_6,
    --   conditionals=green_7, functions=turquoise_1, constants/tags=turquoise_3,
    --   comments=gray, pre-processor/macro=light_2, errors=red.
    local treesitter = {
        -- Monochrome
        ["@comment"] = { fg = matrix.matrix_gray, style = "italic" }, -- comments
        ["@attribute"] = { fg = matrix.matrix_light_2 },        -- attributes/annotations (pre-processor / macro)

        -- Red
        ["@error"] = { fg = matrix.matrix_red }, -- For syntax/parser errors.

        -- Amber
        -- (none: amber is for caution/todo, not syntax)

        -- Green (descending brightness)
        ["@variable"] = { fg = matrix.matrix_green_1, }, -- variables
        ["@variable.builtin"] = { fg = matrix.matrix_green_1, style = "bold" },
        ["@variable.parameter"] = { fg = matrix.matrix_green_1, style = "underline" },
        ["@variable.member"] = { fg = matrix.matrix_green_1, style = "italic" },
        ["@property"] = { fg = matrix.matrix_green_1, style = "italic" },
        ["@module"] = { fg = matrix.matrix_green_1, style = "italic" },
        ["@string.special.symbol"] = { fg = matrix.matrix_green_1 }, -- identifiers referring to symbols or atoms

        ["@string"] = { fg = matrix.matrix_green_2, style = "italic" }, -- values
        ["@character"] = { fg = matrix.matrix_green_2, style = "italic" },
        ["@string.escape"] = { fg = matrix.matrix_green_2, style = "italic" },
        ["@string.regexp"] = { fg = matrix.matrix_green_2, style = "italic" },
        ["@number"] = { fg = matrix.matrix_green_2 },
        ["@number.float"] = { fg = matrix.matrix_green_2 },
        ["@boolean"] = { fg = matrix.matrix_green_2, style = "bold" },
        ["@punctuation.delimiter"] = { fg = matrix.matrix_green_2 }, -- delimiters
        ["@punctuation.bracket"] = { fg = matrix.matrix_green_2 },
        ["@punctuation.special"] = { fg = matrix.matrix_green_2 },

        ["@type"] = { fg = matrix.matrix_green_3 },  -- types
        ["@type.builtin"] = { fg = matrix.matrix_green_3 },
        ["@constructor"] = { fg = matrix.matrix_green_4 }, -- structs

        ["@operator"] = { fg = matrix.matrix_green_5 }, -- operators
        ["@keyword.operator"] = { fg = matrix.matrix_green_5, style = "italic" },

        ["@keyword"] = { fg = matrix.matrix_green_6, style = "italic" }, -- keywords
        ["@keyword.function"] = { fg = matrix.matrix_green_6, style = "italic" },
        ["@keyword.return"] = { fg = matrix.matrix_green_6, style = "italic" },
        ["@keyword.import"] = { fg = matrix.matrix_green_6 },
        ["@keyword.repeat"] = { fg = matrix.matrix_green_6, style = "italic" },
        ["@keyword.exception"] = { fg = matrix.matrix_green_6 },
        ["@label"] = { fg = matrix.matrix_green_6 },

        ["@keyword.conditional"] = { fg = matrix.matrix_green_7, style = "italic" }, -- conditionals

        -- Turquoise (descending brightness, heading steps)
        ["@function"] = { fg = matrix.matrix_turquoise_1, style = "italic" }, -- functions
        ["@function.builtin"] = { fg = matrix.matrix_turquoise_1, style = "italic" },
        ["@function.method"] = { fg = matrix.matrix_turquoise_1, style = "italic" },
        ["@function.macro"] = { fg = matrix.matrix_turquoise_1 },
        ["@markup.heading"] = { fg = matrix.matrix_turquoise_1, style = "bold" }, -- headings
        ["@markup.link"] = { fg = matrix.matrix_turquoise_1 },
        ["@markup.underline"] = { fg = matrix.matrix_turquoise_1, style = "underline" },
        ["@markup.link.url"] = { fg = matrix.matrix_turquoise_2 }, -- highlighted links
        ["@constant"] = { fg = matrix.matrix_turquoise_3 },  -- constants
        ["@constant.builtin"] = { fg = matrix.matrix_turquoise_3, style = "bold" },
        ["@constant.macro"] = { fg = matrix.matrix_turquoise_3, style = "bold" },
        ["@tag"] = { fg = matrix.matrix_turquoise_3 }, -- tags
        ["@tag.delimiter"] = { fg = matrix.matrix_turquoise_3 },

        -- Default colour for anything not otherwise specified
        ["@markup"] = { fg = matrix.matrix_green_2 },
        ["@markup.raw"] = { fg = matrix.matrix_green_2 },
    }

    return treesitter
end

theme.loadLSP = function()
    -- Lsp highlight groups
    local lsp = {
        -- Monochrome

        -- Red / Amber / Green / Turquoise grouped for clarity

        -- Turquoise (errors/warnings mapped)
        LspDiagnosticsDefaultError = { fg = matrix.matrix_turquoise_3 },                    -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError = { fg = matrix.matrix_turquoise_3 },                       -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError = { fg = matrix.matrix_turquoise_3 },                   -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError = { fg = matrix.matrix_turquoise_3 },                -- Virtual text "Error"
        LspDiagnosticsUnderlineError = { style = "undercurl", sp = matrix.matrix_turquoise_3 }, -- used to underline "Error" diagnostics.

        LspDiagnosticsDefaultWarning = { fg = matrix.matrix_turquoise_1 },                  -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning = { fg = matrix.matrix_turquoise_1 },                     -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning = { fg = matrix.matrix_turquoise_1 },                 -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning = { fg = matrix.matrix_turquoise_1 },              -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = matrix.matrix_turquoise_1 }, -- used to underline "Warning" diagnostics.

        -- Red (information)
        LspDiagnosticsDefaultInformation = { fg = matrix.matrix_red },                  -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation = { fg = matrix.matrix_red },                     -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation = { fg = matrix.matrix_red },                 -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation = { fg = matrix.matrix_red },              -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = matrix.matrix_red }, -- used to underline "Information" diagnostics.

        -- Green (hints / references)
        LspDiagnosticsDefaultHint = { fg = matrix.matrix_green_7 },              -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint = { fg = matrix.matrix_green_7 },                 -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint = { fg = matrix.matrix_green_7 },             -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint = { fg = matrix.matrix_green_7 },          -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint = { style = "undercurl", sp = matrix.matrix_red }, -- used to underline "Hint" diagnostics.
        LspReferenceText = { fg = matrix.matrix_green_7, bg = matrix.matrix_dark_1 }, -- used for highlighting "text" references
        LspReferenceRead = { fg = matrix.matrix_green_7, bg = matrix.matrix_dark_1 }, -- used for highlighting "read" references
        LspReferenceWrite = { fg = matrix.matrix_green_7, bg = matrix.matrix_dark_1 }, -- used for highlighting "write" references

        -- Diagnostic links (Neovim diagnostics)
        DiagnosticError = { link = "LspDiagnosticsDefaultError" },
        DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
        DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
        DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
        DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
        DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
        DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
        DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
        DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
        DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
        DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
        DiagnosticSignError = { link = "LspDiagnosticsSignError" },
        DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
        DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
        DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
        DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
        DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
        DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
        DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
        DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
    }

    return lsp
end

theme.loadPlugins = function()
    -- Plugins highlight groups
    local plugins = {
        diffOldFile = { fg = matrix.matrix_amber },
        diffIndexLine = { fg = matrix.matrix_green_7 },
        diffFile = { fg = matrix.matrix_green_4 },
        diffLine = { fg = matrix.matrix_green_7 },
        diffNewFile = { fg = matrix.matrix_light_2 },

        -- GitSigns
        GitSignsAdd = { fg = matrix.matrix_turquoise_2 },
        GitSignsAddNr = { fg = matrix.matrix_turquoise_2 },
        GitSignsAddLn = { fg = matrix.matrix_turquoise_2 },
        GitSignsChange = { fg = matrix.matrix_turquoise_1 },
        GitSignsChangeNr = { fg = matrix.matrix_turquoise_1 },
        GitSignsChangeLn = { fg = matrix.matrix_turquoise_1 },
        GitSignsDelete = { fg = matrix.matrix_turquoise_3 },
        GitSignsDeleteNr = { fg = matrix.matrix_turquoise_3 },
        GitSignsDeleteLn = { fg = matrix.matrix_turquoise_3 },

        -- Telescope
        TelescopePromptBorder = { fg = matrix.matrix_green_3 },
        TelescopeResultsBorder = { fg = matrix.matrix_green_7 },
        TelescopePreviewBorder = { fg = matrix.matrix_turquoise_2 },
        TelescopeSelectionCaret = { fg = matrix.matrix_green_7 },
        TelescopeSelection = { fg = matrix.matrix_green_7 },
        TelescopeMatching = { fg = matrix.matrix_green_3 },

        -- Cmp
        CmpItemKind = { fg = matrix.matrix_turquoise_1 },
        CmpItemAbbrMatch = { fg = matrix.matrix_green_6, style = "bold" },
        CmpItemAbbrMatchFuzzy = { fg = matrix.matrix_green_6, style = "bold" },
        CmpItemAbbr = { fg = matrix.matrix_green_7 },
        CmpItemMenu = { fg = matrix.matrix_turquoise_2 },

        -- Indent Blankline
        IndentBlanklineChar = { fg = matrix.matrix_green_7 },
        IndentBlanklineContextChar = { fg = matrix.matrix_red },
    }

    return plugins
end

return theme
