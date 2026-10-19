local matrix = require("matrix.colors")

local theme = {}

theme.loadSyntax = function()
    -- Syntax highlight groups
    local syntax = {
        -- Monochrome
        SpecialChar = { fg = matrix.mono_1 },      -- special character in a constant
        PreCondit = { fg = matrix.mono_2 },        -- preprocessor #if, #else, #endif, etc.
        PreProc = { fg = matrix.mono_2 },          -- generic Preprocessor
        Include = { fg = matrix.mono_2 },          -- preprocessor #include
        Define = { fg = matrix.mono_2 },           -- preprocessor #define
        Macro = { fg = matrix.mono_2 },            -- same as Define
        Comment = { fg = matrix.mono_3, style = "italic" }, -- comments
        Ignore = { fg = matrix.mono_4 },            -- left blank, hidden
        Conceal = { fg = matrix.none, bg = matrix.mono_5 },

        -- Red
        Error = { fg = matrix.red, style = "bold,underline" }, -- any erroneous construct

        -- Amber
        Todo = { fg = matrix.amber, style = "bold,italic" }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- Green (descending brightness)
        Identifier = { fg = matrix.green_1 },              -- any variable name
        String = { fg = matrix.green_2, style = "italic" }, -- any string
        Character = { fg = matrix.green_2 },               -- any character constant: 'c', '\n'
        Float = { fg = matrix.green_2 },                   -- a floating point constant: 2.3e10
        Number = { fg = matrix.green_2 },                  -- a number constant: 5
        Boolean = { fg = matrix.green_2 },                 -- a boolean constant: TRUE, false
        Delimiter = { fg = matrix.green_2 },               -- character that needs attention like , or .
        Special = { fg = matrix.green_2 },                 -- any special symbol
        Type = { fg = matrix.green_3 },                    -- int, long, char, etc.
        Typedef = { fg = matrix.green_3 },                 -- A typedef
        Structure = { fg = matrix.green_4 },               -- struct, union, enum, etc.
        Operator = { fg = matrix.green_5 },                -- sizeof, "+", "*", etc.
        StorageClass = { fg = matrix.green_6 },            -- static, register, volatile, etc.
        Statement = { fg = matrix.green_6 },               -- any statement
        Label = { fg = matrix.green_6 },                   -- case, default, etc.
        Exception = { fg = matrix.green_6 },               -- try, catch, throw
        Keyword = { fg = matrix.green_6, style = "italic" }, -- for, do, while, etc.
        Repeat = { fg = matrix.green_6, style = "italic" }, -- any other keyword
        Conditional = { fg = matrix.green_7, style = "italic" }, -- if, then, else, endif, switch, etc.

        -- Turquoise (descending brightness)
        Function = { fg = matrix.turquoise_1, style = "italic" }, -- function names
        Underlined = { fg = matrix.turquoise_1, style = "underline" }, -- text that stands out, HTML links
        SpecialComment = { fg = matrix.turquoise_2 },            -- special things inside a comment
        Debug = { fg = matrix.turquoise_3 },                     -- debugging statements
        Constant = { fg = matrix.turquoise_3 },                  -- any constant
        Tag = { fg = matrix.turquoise_3 },                       -- you can use CTRL-] on this

        htmlLink = { fg = matrix.turquoise_1, style = "underline" },

        htmlH1 = { fg = matrix.turquoise_1, style = "bold" },
        htmlH2 = { fg = matrix.turquoise_2, style = "bold" },
        htmlH3 = { fg = matrix.turquoise_3, style = "bold" },
        htmlH4 = { fg = matrix.amber, style = "bold" },
        htmlH5 = { fg = matrix.red, style = "bold" },

        markdownH1 = { fg = matrix.turquoise_1, style = "bold" },
        markdownH2 = { fg = matrix.turquoise_2, style = "bold" },
        markdownH3 = { fg = matrix.turquoise_3, style = "bold" },

        markdownH1Delimiter = { fg = matrix.turquoise_1, style = "bold" },
        markdownH2Delimiter = { fg = matrix.turquoise_2, style = "bold" },
        markdownH3Delimiter = { fg = matrix.turquoise_3, style = "bold" },
    }
    return syntax
end

theme.loadEditor = function()
    -- Editor highlight groups

    local editor = {
        -- Monochrome
        EndOfBuffer = { fg = matrix.mono_3 },
        Folded = { fg = matrix.mono_3, style = "italic" },
        LineNr = { fg = matrix.mono_3 },
        NonText = { fg = matrix.mono_4 },

        -- Red
        MatchParen = { fg = matrix.red, style = "bold" },
        IncSearch = { fg = matrix.red, bg = matrix.red },
        ErrorMsg = { fg = matrix.red },

        -- Amber
        WarningMsg = { fg = matrix.amber }, 

        -- Green (descending brightness)
        FoldColumn = { fg = matrix.green_4 },
        NormalFloat = { fg = matrix.green_2, bg = matrix.green_8 }, -- normal text and background color
        FloatBorder = { fg = matrix.green_2, bg = matrix.green_8 }, -- normal text and background color
        Cursor = { fg = matrix.green_7, style = "reverse" }, -- the character under the cursor
        CursorIM = { fg = matrix.green_6, style = "reverse" }, -- like Cursor, but used when in IME mode
        Directory = { fg = matrix.green_4, bg = matrix.none }, -- directory names (and other special names in listings)
        CursorLineNr = { fg = matrix.green_7 },
        ModeMsg = { fg = matrix.green_7 },
        MoreMsg = { fg = matrix.green_7 },
        Pmenu = { fg = matrix.green_7, bg = matrix.green_2 },
        PmenuSel = { fg = matrix.green_7, bg = matrix.red },
        PmenuSbar = { fg = matrix.green_7, bg = matrix.green_2 },
        PmenuThumb = { fg = matrix.green_7, bg = matrix.green_7 },
        QuickFixLine = { fg = matrix.green_7, style = "reverse" },
        qfLineNr = { fg = matrix.green_7, style = "reverse" },
        Search = { fg = matrix.red, bg = matrix.green_5, style = "reverse" },
        SpecialKey = { fg = matrix.green_7 },
        StatusLine = { fg = matrix.green_7, bg = matrix.green_2 },
        StatusLineNC = { fg = matrix.green_7, bg = matrix.mono_4 },
        StatusLineTerm = { fg = matrix.green_7, bg = matrix.green_2 },
        StatusLineTermNC = { fg = matrix.green_7, bg = matrix.mono_4 },
        TabLineFill = { fg = matrix.green_7, bg = matrix.none },
        TablineSel = { fg = matrix.mono_4, bg = matrix.green_7 },
        Tabline = { fg = matrix.green_7, bg = matrix.mono_4 },
        Visual = { fg = matrix.none, bg = matrix.green_2 },
        VisualNOS = { fg = matrix.none, bg = matrix.green_2 },
        CursorColumn = { fg = matrix.none, bg = matrix.mono_4},
        CursorLine = { fg = matrix.none, bg = matrix.mono_4},
        ToolbarLine = { fg = matrix.green_7, bg = matrix.mono_4 },
        ToolbarButton = { fg = matrix.green_7, style = "bold" },
        NormalMode = { fg = matrix.green_7, style = "reverse" },
        InsertMode = { fg = matrix.turquoise_2, style = "reverse" },
        ReplacelMode = { fg = matrix.turquoise_3, style = "reverse" },
        VisualMode = { fg = matrix.green_7, style = "reverse" },
        CommandMode = { fg = matrix.green_7, style = "reverse" },
        Warnings = { fg = matrix.turquoise_1 },

        -- Turquoise (descending brightness)
        Title = { fg = matrix.turquoise_2, style = "bold" },
        Question = { fg = matrix.turquoise_2 },
        SpellBad = { fg = matrix.turquoise_3, style = "italic,undercurl" },
        SpellCap = { fg = matrix.green_4, style = "italic,undercurl" },
        SpellLocal = { fg = matrix.green_3, style = "italic,undercurl" },
        SpellRare = { fg = matrix.green_7, style = "italic,undercurl" },
        WildMenu = { fg = matrix.mono_2, style = "bold" },

        -- health
        healthError = { fg = matrix.red },
        healthWarning = { fg = matrix.amber },
        healthSuccess = { fg = matrix.green_1 },

        -- dashboard
        DashboardShortCut = { fg = matrix.green_4 },
        DashboardHeader = { fg = matrix.green_7 },
        DashboardCenter = { fg = matrix.green_3 },
        DashboardFooter = { fg = matrix.turquoise_2, style = "italic" },

        -- BufferLine
        BufferLineIndicatorSelected = { fg = matrix.mono_5 },
        BufferLineFill = { bg = matrix.mono_5 },
    }

    editor.Normal = { fg = matrix.green_2, bg = matrix.none }
    editor.SignColumn = { fg = matrix.green_2, bg = matrix.none }

    editor.VertSplit = { fg = matrix.green_2 }
    return editor
end

theme.loadTerminal = function()
    -- Terminal colors grouped by categories where relevant.
    -- (Original assigned many to same green; preserve grouping for clarity.)

    -- Monochrome / base
    vim.g.terminal_color_0 = matrix.green_2
    vim.g.terminal_color_7 = matrix.green_2
    vim.g.terminal_color_8 = matrix.green_2
    vim.g.terminal_color_15 = matrix.green_2

    -- Red
    vim.g.terminal_color_1 = matrix.green_2
    vim.g.terminal_color_9 = matrix.green_2

    -- Amber
    vim.g.terminal_color_3 = matrix.green_2
    vim.g.terminal_color_11 = matrix.green_2

    -- Green (descending brightness)
    vim.g.terminal_color_2 = matrix.green_2
    vim.g.terminal_color_10 = matrix.green_2
    vim.g.terminal_color_4 = matrix.green_2
    vim.g.terminal_color_12 = matrix.green_2
    vim.g.terminal_color_5 = matrix.green_2
    vim.g.terminal_color_13 = matrix.green_2
    vim.g.terminal_color_6 = matrix.green_2
    vim.g.terminal_color_14 = matrix.green_2
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
        ["@comment"] = { fg = matrix.mono_3, style = "italic" }, -- comments
        ["@attribute"] = { fg = matrix.mono_2 },        -- attributes/annotations (pre-processor / macro)

        -- Red
        ["@error"] = { fg = matrix.red }, -- For syntax/parser errors.

        -- Amber
        -- (none: amber is for caution/todo, not syntax)

        -- Green (descending brightness)
        ["@variable"] = { fg = matrix.green_1, }, -- variables
        ["@variable.builtin"] = { fg = matrix.green_1, style = "bold" },
        ["@variable.parameter"] = { fg = matrix.green_1, style = "underline" },
        ["@variable.member"] = { fg = matrix.green_1, style = "italic" },
        ["@property"] = { fg = matrix.green_1, style = "italic" },
        ["@module"] = { fg = matrix.green_1, style = "italic" },
        ["@string.special.symbol"] = { fg = matrix.green_1 }, -- identifiers referring to symbols or atoms

        ["@string"] = { fg = matrix.green_2, style = "italic" }, -- values
        ["@character"] = { fg = matrix.green_2, style = "italic" },
        ["@string.escape"] = { fg = matrix.green_2, style = "italic" },
        ["@string.regexp"] = { fg = matrix.green_2, style = "italic" },
        ["@number"] = { fg = matrix.green_2 },
        ["@number.float"] = { fg = matrix.green_2 },
        ["@boolean"] = { fg = matrix.green_2, style = "bold" },
        ["@punctuation.delimiter"] = { fg = matrix.green_2 }, -- delimiters
        ["@punctuation.bracket"] = { fg = matrix.green_2 },
        ["@punctuation.special"] = { fg = matrix.green_2 },

        ["@type"] = { fg = matrix.green_3 },  -- types
        ["@type.builtin"] = { fg = matrix.green_3 },
        ["@constructor"] = { fg = matrix.green_4 }, -- structs

        ["@operator"] = { fg = matrix.green_5 }, -- operators
        ["@keyword.operator"] = { fg = matrix.green_5, style = "italic" },

        ["@keyword"] = { fg = matrix.green_6, style = "italic" }, -- keywords
        ["@keyword.function"] = { fg = matrix.green_6, style = "italic" },
        ["@keyword.return"] = { fg = matrix.green_6, style = "italic" },
        ["@keyword.import"] = { fg = matrix.green_6 },
        ["@keyword.repeat"] = { fg = matrix.green_6, style = "italic" },
        ["@keyword.exception"] = { fg = matrix.green_6 },
        ["@label"] = { fg = matrix.green_6 },

        ["@keyword.conditional"] = { fg = matrix.green_7, style = "italic" }, -- conditionals

        -- Turquoise (descending brightness, heading steps)
        ["@function"] = { fg = matrix.turquoise_1, style = "italic" }, -- functions
        ["@function.builtin"] = { fg = matrix.turquoise_1, style = "italic" },
        ["@function.method"] = { fg = matrix.turquoise_1, style = "italic" },
        ["@function.macro"] = { fg = matrix.turquoise_1 },
        ["@markup.heading"] = { fg = matrix.turquoise_1, style = "bold" }, -- headings
        ["@markup.link"] = { fg = matrix.turquoise_1 },
        ["@markup.underline"] = { fg = matrix.turquoise_1, style = "underline" },
        ["@markup.link.url"] = { fg = matrix.turquoise_2 }, -- highlighted links
        ["@constant"] = { fg = matrix.turquoise_3 },  -- constants
        ["@constant.builtin"] = { fg = matrix.turquoise_3, style = "bold" },
        ["@constant.macro"] = { fg = matrix.turquoise_3, style = "bold" },
        ["@tag"] = { fg = matrix.turquoise_3 }, -- tags
        ["@tag.delimiter"] = { fg = matrix.turquoise_3 },

        -- Default colour for anything not otherwise specified
        ["@markup"] = { fg = matrix.green_2 },
        ["@markup.raw"] = { fg = matrix.green_2 },
    }

    return treesitter
end

theme.loadLSP = function()
    -- Lsp highlight groups
    local lsp = {
        -- Monochrome

        -- Red / Amber / Green / Turquoise grouped for clarity

        -- Turquoise (errors/warnings mapped)
        LspDiagnosticsDefaultError = { fg = matrix.turquoise_3 },                    -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError = { fg = matrix.turquoise_3 },                       -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError = { fg = matrix.turquoise_3 },                   -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError = { fg = matrix.turquoise_3 },                -- Virtual text "Error"
        LspDiagnosticsUnderlineError = { style = "undercurl", sp = matrix.turquoise_3 }, -- used to underline "Error" diagnostics.

        LspDiagnosticsDefaultWarning = { fg = matrix.turquoise_1 },                  -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning = { fg = matrix.turquoise_1 },                     -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning = { fg = matrix.turquoise_1 },                 -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning = { fg = matrix.turquoise_1 },              -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = matrix.turquoise_1 }, -- used to underline "Warning" diagnostics.

        -- Red (information)
        LspDiagnosticsDefaultInformation = { fg = matrix.red },                  -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation = { fg = matrix.red },                     -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation = { fg = matrix.red },                 -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation = { fg = matrix.red },              -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = matrix.red }, -- used to underline "Information" diagnostics.

        -- Green (hints / references)
        LspDiagnosticsDefaultHint = { fg = matrix.green_7 },              -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint = { fg = matrix.green_7 },                 -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint = { fg = matrix.green_7 },             -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint = { fg = matrix.green_7 },          -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint = { style = "undercurl", sp = matrix.red }, -- used to underline "Hint" diagnostics.
        LspReferenceText = { fg = matrix.green_7, bg = matrix.mono_4 }, -- used for highlighting "text" references
        LspReferenceRead = { fg = matrix.green_7, bg = matrix.mono_4 }, -- used for highlighting "read" references
        LspReferenceWrite = { fg = matrix.green_7, bg = matrix.mono_4 }, -- used for highlighting "write" references

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
        diffOldFile = { fg = matrix.amber },
        diffIndexLine = { fg = matrix.green_7 },
        diffFile = { fg = matrix.green_4 },
        diffLine = { fg = matrix.green_7 },
        diffNewFile = { fg = matrix.mono_2 },

        -- GitSigns
        GitSignsAdd = { fg = matrix.turquoise_2 },
        GitSignsAddNr = { fg = matrix.turquoise_2 },
        GitSignsAddLn = { fg = matrix.turquoise_2 },
        GitSignsChange = { fg = matrix.turquoise_1 },
        GitSignsChangeNr = { fg = matrix.turquoise_1 },
        GitSignsChangeLn = { fg = matrix.turquoise_1 },
        GitSignsDelete = { fg = matrix.turquoise_3 },
        GitSignsDeleteNr = { fg = matrix.turquoise_3 },
        GitSignsDeleteLn = { fg = matrix.turquoise_3 },

        -- Telescope
        TelescopePromptBorder = { fg = matrix.green_3 },
        TelescopeResultsBorder = { fg = matrix.green_7 },
        TelescopePreviewBorder = { fg = matrix.turquoise_2 },
        TelescopeSelectionCaret = { fg = matrix.green_7 },
        TelescopeSelection = { fg = matrix.green_7 },
        TelescopeMatching = { fg = matrix.green_3 },

        -- Cmp
        CmpItemKind = { fg = matrix.turquoise_1 },
        CmpItemAbbrMatch = { fg = matrix.green_6, style = "bold" },
        CmpItemAbbrMatchFuzzy = { fg = matrix.green_6, style = "bold" },
        CmpItemAbbr = { fg = matrix.green_7 },
        CmpItemMenu = { fg = matrix.turquoise_2 },

        -- Indent Blankline
        IndentBlanklineChar = { fg = matrix.green_7 },
        IndentBlanklineContextChar = { fg = matrix.red },
    }

    return plugins
end

return theme
