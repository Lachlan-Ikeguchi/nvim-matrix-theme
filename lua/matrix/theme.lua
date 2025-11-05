local matrix = require("matrix.colors")

local theme = {}

theme.loadSyntax = function()
    -- Syntax highlight groups
    local syntax = {
        -- Monochrome
        PreCondit = { fg = matrix.matrix_light_1 },   -- preprocessor #if, #else, #endif, etc.
        SpecialChar = { fg = matrix.matrix_light_2 }, -- special character in a constant
        Ignore = { fg = matrix.matrix_dark_2 },       -- left blank, hidden
        Conceal = { fg = matrix.none, bg = matrix.matrix_dark_1 },

        -- Red
        Error = { fg = matrix.matrix_red, bg = matrix.none, style = "bold,underline" }, -- any erroneous construct

        -- Amber
        Todo = { fg = matrix.matrix_amber, bg = matrix.none, style = "bold,italic" }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

        -- Green (ascending brightness)
        Type = { fg = matrix.matrix_green_1 },         -- int, long, char, etc.
        StorageClass = { fg = matrix.matrix_green_1 }, -- static, register, volatile, etc.
        Structure = { fg = matrix.matrix_green_1 },    -- struct, union, enum, etc.
        Statement = { fg = matrix.matrix_green_1 },    -- any statement
        Label = { fg = matrix.matrix_green_1 },        -- case, default, etc.
        Operator = { fg = matrix.matrix_green_1 },     -- sizeof, "+", "*", etc.
        Exception = { fg = matrix.matrix_green_1 },    -- try, catch, throw
        PreProc = { fg = matrix.matrix_green_1 },      -- generic Preprocessor
        Include = { fg = matrix.matrix_green_1 },      -- preprocessor #include
        Special = { fg = matrix.matrix_green_1 },      -- any special symbol
        Tag = { fg = matrix.matrix_green_1 },          -- you can use CTRL-] on this
        Define = { fg = matrix.matrix_green_1 },       -- preprocessor #define
        Macro = { fg = matrix.matrix_green_1 },        -- same as Define
        Typedef = { fg = matrix.matrix_green_1 },      -- A typedef
        Identifier = { fg = matrix.matrix_green_1 },   -- any variable name
        Delimiter = { fg = matrix.matrix_green_5 },    -- character that needs attention like , or .
        Function = { fg = matrix.matrix_green_5 },     -- normal function names
        Character = { fg = matrix.matrix_green_7 },    -- any character constant: 'c', '\n'
        Number = { fg = matrix.matrix_green_7 },       -- a number constant: 5
        Boolean = { fg = matrix.matrix_green_7 },      -- a boolean constant: TRUE, false
        Float = { fg = matrix.matrix_green_7 },        -- a floating point constant: 2.3e10

        -- Turquoise (ascending brightness)
        Constant = { fg = matrix.matrix_turquoise_1 },                                          -- any constant
        Debug = { fg = matrix.matrix_turquoise_1 },                                             -- debugging statements
        Underlined = { fg = matrix.matrix_turquoise_2, bg = matrix.none, style = "underline" }, -- text that stands out, HTML links
        SpecialComment = { fg = matrix.matrix_turquoise_2 },                                    -- special things inside a comment

        htmlLink = { fg = matrix.matrix_turquoise_3, style = "underline" },

        htmlH1 = { fg = matrix.matrix_turquoise_3, style = "bold" },
        htmlH2 = { fg = matrix.matrix_turquoise_2, style = "bold" },
        htmlH3 = { fg = matrix.matrix_turquoise_1, style = "bold" },
        htmlH4 = { fg = matrix.matrix_red, style = "bold" },
        htmlH5 = { fg = matrix.matrix_amber, style = "bold" },

        markdownH1 = { fg = matrix.matrix_turquoise_3, style = "bold" },
        markdownH2 = { fg = matrix.matrix_turquoise_2, style = "bold" },
        markdownH3 = { fg = matrix.matrix_turquoise_1, style = "bold" },

        markdownH1Delimiter = { fg = matrix.matrix_turquoise_3 },
        markdownH2Delimiter = { fg = matrix.matrix_turquoise_2 },
        markdownH3Delimiter = { fg = matrix.matrix_turquoise_1 },
    }

    -- Italic comments & related groups
    if vim.g.matrix_italic == false then
        -- Monochrome / Green / Turquoise as plain text (no italic)
        syntax.Comment = { fg = matrix.matrix_gray }        -- normal comments
        syntax.Conditional = { fg = matrix.matrix_green_1 } -- normal if, then, else, endif, switch, etc.
        syntax.Function = { fg = matrix.matrix_green_5 }    -- normal function names
        syntax.Identifier = { fg = matrix.matrix_green_1 }  -- any variable name
        syntax.Keyword = { fg = matrix.matrix_green_1 }     -- normal for, do, while, etc.
        syntax.Repeat = { fg = matrix.matrix_green_1 }      -- normal any other keyword
        syntax.String = { fg = matrix.matrix_turquoise_2 }  -- any string
    else
        -- Monochrome / Green / Turquoise with italic
        syntax.Comment = { fg = matrix.matrix_gray, bg = matrix.none, style = "italic" }        -- italic comments
        syntax.Conditional = { fg = matrix.matrix_green_1, bg = matrix.none, style = "italic" } -- italic if, then, else, endif, switch, etc.
        syntax.Function = { fg = matrix.matrix_green_5, bg = matrix.none, style = "italic" }    -- italic function names
        syntax.Identifier = { fg = matrix.matrix_green_1, bg = matrix.none, style = "italic" }  -- any variable name
        syntax.Keyword = { fg = matrix.matrix_green_1, bg = matrix.none, style = "italic" }     -- italic for, do, while, etc.
        syntax.Repeat = { fg = matrix.matrix_green_1, bg = matrix.none, style = "italic" }      -- italic any other keyword
        syntax.String = { fg = matrix.matrix_turquoise_2, bg = matrix.none, style = "italic" }  -- any string
    end

    return syntax
end

theme.loadEditor = function()
    -- Editor highlight groups

    local editor = {
        -- Monochrome
        EndOfBuffer = { fg = matrix.matrix_dark_2 },
        ErrorMsg = { fg = matrix.none },
        Folded = { fg = matrix.matrix_gray, bg = matrix.none, style = "italic" },
        FoldColumn = { fg = matrix.matrix_green_4 },
        LineNr = { fg = matrix.matrix_gray },
        NonText = { fg = matrix.matrix_dark_2 },

        -- Red
        MatchParen = { fg = matrix.matrix_turquoise_3, bg = matrix.none, style = "bold" },
        IncSearch = { fg = matrix.matrix_green_3, bg = matrix.matrix_red },

        -- Amber
        WarningMsg = { fg = matrix.matrix_turquoise_3 },

        -- Green (ascending brightness)
        NormalFloat = { fg = matrix.matrix_green_1, bg = matrix.float },                -- normal text and background color
        FloatBorder = { fg = matrix.matrix_green_1, bg = matrix.float },                -- normal text and background color
        Cursor = { fg = matrix.matrix_green_1, bg = matrix.none, style = "reverse" },   -- the character under the cursor
        CursorIM = { fg = matrix.matrix_green_2, bg = matrix.none, style = "reverse" }, -- like Cursor, but used when in IME mode
        Directory = { fg = matrix.matrix_green_4, bg = matrix.none },                   -- directory names (and other special names in listings)
        CursorLineNr = { fg = matrix.matrix_green_1 },
        ModeMsg = { fg = matrix.matrix_green_1 },
        MoreMsg = { fg = matrix.matrix_green_1 },
        Pmenu = { fg = matrix.matrix_green_1, bg = matrix.matrix_green_6 },
        PmenuSel = { fg = matrix.matrix_green_1, bg = matrix.matrix_red },
        PmenuSbar = { fg = matrix.matrix_green_1, bg = matrix.matrix_green_6 },
        PmenuThumb = { fg = matrix.matrix_green_1, bg = matrix.matrix_green_1 },
        QuickFixLine = { fg = matrix.matrix_green_1, bg = matrix.none, style = "reverse" },
        qfLineNr = { fg = matrix.matrix_green_1, bg = matrix.none, style = "reverse" },
        Search = { fg = matrix.matrix_red, bg = matrix.matrix_green_3, style = "reverse" },
        SpecialKey = { fg = matrix.matrix_green_1 },
        StatusLine = { fg = matrix.matrix_green_1, bg = matrix.matrix_green_6 },
        StatusLineNC = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },
        StatusLineTerm = { fg = matrix.matrix_green_1, bg = matrix.matrix_green_6 },
        StatusLineTermNC = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },
        TabLineFill = { fg = matrix.matrix_green_1, bg = matrix.none },
        TablineSel = { fg = matrix.matrix_dark_2, bg = matrix.matrix_green_1 },
        Tabline = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },
        Visual = { fg = matrix.none, bg = matrix.matrix_green_6 },
        VisualNOS = { fg = matrix.none, bg = matrix.matrix_green_6 },
        CursorColumn = { fg = matrix.none, bg = matrix.cursorlinefg },
        CursorLine = { fg = matrix.none, bg = matrix.cursorlinefg },
        ToolbarLine = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },
        ToolbarButton = { fg = matrix.matrix_green_1, bg = matrix.none, style = "bold" },
        NormalMode = { fg = matrix.matrix_green_1, bg = matrix.none, style = "reverse" },
        InsertMode = { fg = matrix.matrix_turquoise_2, bg = matrix.none, style = "reverse" },
        ReplacelMode = { fg = matrix.matrix_turquoise_1, bg = matrix.none, style = "reverse" },
        VisualMode = { fg = matrix.matrix_green_1, bg = matrix.none, style = "reverse" },
        CommandMode = { fg = matrix.matrix_green_1, bg = matrix.none, style = "reverse" },
        Warnings = { fg = matrix.matrix_turquoise_3 },

        -- Turquoise (ascending brightness)
        Title = { fg = matrix.matrix_turquoise_2, bg = matrix.none, style = "bold" },
        Question = { fg = matrix.matrix_turquoise_2 },
        SpellBad = { fg = matrix.matrix_turquoise_1, bg = matrix.none, style = "italic,undercurl" },
        SpellCap = { fg = matrix.matrix_green_4, bg = matrix.none, style = "italic,undercurl" },
        SpellLocal = { fg = matrix.matrix_green_5, bg = matrix.none, style = "italic,undercurl" },
        SpellRare = { fg = matrix.matrix_green_1, bg = matrix.none, style = "italic,undercurl" },
        WildMenu = { fg = matrix.matrix_light_1, bg = matrix.none, style = "bold" },

        -- health
        healthError = { fg = matrix.matrix_red },
        healthSuccess = { fg = matrix.matrix_turquoise_2 },
        healthWarning = { fg = matrix.matrix_amber },

        -- dashboard
        DashboardShortCut = { fg = matrix.matrix_green_4 },
        DashboardHeader = { fg = matrix.matrix_green_1 },
        DashboardCenter = { fg = matrix.matrix_green_5 },
        DashboardFooter = { fg = matrix.matrix_turquoise_2, style = "italic" },

        -- BufferLine
        BufferLineIndicatorSelected = { fg = matrix.matrix_dark_1 },
        BufferLineFill = { bg = matrix.matrix_dark_1 },
    }

    -- Options:

    -- Set transparent background
    if vim.g.matrix_disable_background then
        editor.Normal = { fg = matrix.matrix_green_1, bg = matrix.none } -- normal text and background color
        editor.SignColumn = { fg = matrix.matrix_green_1, bg = matrix.none }
    else
        editor.Normal = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_1 } -- normal text and background color
        editor.SignColumn = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_1 }
    end

    -- Remove window split borders
    if vim.g.matrix_borders then
        editor.VertSplit = { fg = matrix.matrix_green_6 }
    else
        editor.VertSplit = { fg = matrix.matrix_dark_1 }
    end

    return editor
end

theme.loadTerminal = function()
    -- Terminal colors grouped by categories where relevant.
    -- (Original assigned many to same green; preserve grouping for clarity.)

    -- Monochrome / base
    vim.g.terminal_color_0 = matrix.matrix_green_6
    vim.g.terminal_color_7 = matrix.matrix_green_6
    vim.g.terminal_color_8 = matrix.matrix_green_6
    vim.g.terminal_color_15 = matrix.matrix_green_6

    -- Red
    vim.g.terminal_color_1 = matrix.matrix_green_6
    vim.g.terminal_color_9 = matrix.matrix_green_6

    -- Amber
    vim.g.terminal_color_3 = matrix.matrix_green_6
    vim.g.terminal_color_11 = matrix.matrix_green_6

    -- Green (ascending brightness)
    vim.g.terminal_color_2 = matrix.matrix_green_6
    vim.g.terminal_color_10 = matrix.matrix_green_6
    vim.g.terminal_color_4 = matrix.matrix_green_6
    vim.g.terminal_color_12 = matrix.matrix_green_6
    vim.g.terminal_color_5 = matrix.matrix_green_6
    vim.g.terminal_color_13 = matrix.matrix_green_6
    vim.g.terminal_color_6 = matrix.matrix_green_6
    vim.g.terminal_color_14 = matrix.matrix_green_6
end

theme.loadTreeSitter = function()
    -- TreeSitter highlight groups
    local treesitter = {
        -- Monochrome
        TSError = { fg = matrix.matrix_red }, -- For syntax/parser errors.

        -- Red
        TSEmphasis = { fg = matrix.matrix_red },                                -- For text to be represented with emphasis.
        TSTitle = { fg = matrix.matrix_red, bg = matrix.none, style = "bold" }, -- Text that is part of a title.

        -- Amber
        -- (none specifically amber in original TreeSitter mapping)

        -- Green (ascending brightness)
        TSText = { fg = matrix.matrix_green_1 },                         -- For strings considered text in a markup language.
        TSConstructor = { fg = matrix.matrix_green_1 },                  -- For constructor calls and definitions.
        TSVariableBuiltin = { fg = matrix.matrix_green_1, style = "bold" },
        TSBoolean = { fg = matrix.matrix_green_1, style = "bold" },      -- For booleans.
        TSType = { fg = matrix.matrix_green_1 },                         -- For types.
        TSTypeBuiltin = { fg = matrix.matrix_green_1 },                  -- For builtin types.
        TSTag = { fg = matrix.matrix_green_1 },                          -- Tags like html tag names.
        TSOperator = { fg = matrix.matrix_green_1 },                     -- For any operator.
        TSFuncMacro = { fg = matrix.matrix_green_4 },                    -- For macro defined functions
        TSConstBuiltin = { fg = matrix.matrix_green_4, style = "bold" }, -- For builtin constants.
        TSConstMacro = { fg = matrix.matrix_green_4, style = "bold" },   -- For constants defined by macros.
        TSMethod = { fg = matrix.matrix_green_4 },                       -- For method calls and definitions.
        TSField = { fg = matrix.matrix_green_1 },                        -- For fields in literals
        TSParameter = { fg = matrix.matrix_red },                        -- For parameters of a function.
        TSParameterReference = { fg = matrix.matrix_red },               -- For references to parameters of a function.
        TSPunctDelimiter = { fg = matrix.matrix_green_5 },               -- For delimiters ie: `.`
        TSPunctBracket = { fg = matrix.matrix_green_5 },                 -- For brackets and parens.
        TSPunctSpecial = { fg = matrix.matrix_green_5 },                 -- For special punctuation.
        TSLiteral = { fg = matrix.matrix_green_1 },                      -- Literal text.

        -- Turquoise (ascending brightness)
        TSAnnotation = { fg = matrix.matrix_turquoise_1 },                                   -- For attributes/annotations.
        TSConst = { fg = matrix.matrix_light_2 },                                            -- For constants (mapped to light_2)
        TSFloat = { fg = matrix.matrix_turquoise_3 },                                        -- For floats
        TSNumber = { fg = matrix.matrix_turquoise_3 },                                       -- For all numbers
        TSAttribute = { fg = matrix.matrix_turquoise_3 },                                    -- (unstable) TODO: docs
        TSVariable = { fg = matrix.matrix_light_2, style = "bold" },                         -- Any variable name that does not have another highlight.
        TSException = { fg = matrix.matrix_turquoise_3 },                                    -- For exception related keywords.
        TSInclude = { fg = matrix.matrix_green_1 },                                          -- For includes / use / require
        TSLabel = { fg = matrix.matrix_turquoise_3 },                                        -- For labels
        TSSymbol = { fg = matrix.matrix_turquoise_3 },                                       -- For identifiers referring to symbols or atoms.
        TSTagDelimiter = { fg = matrix.matrix_turquoise_3 },                                 -- Tag delimiter like `<` `>` `/`
        TSTextReference = { fg = matrix.matrix_turquoise_3 },                                -- FIXME
        TSUnderline = { fg = matrix.matrix_green_1, bg = matrix.none, style = "underline" }, -- Underline
        TSURI = { fg = matrix.matrix_turquoise_2 },                                          -- Any URI like a link or email.
        TSAnnotationAlt = { fg = matrix.matrix_light_1 },                                    -- alternate annotation mapping (preserve original light_1 mapping as alt)
    }

    if vim.g.matrix_italic == false then
        -- Comments
        treesitter.TSComment = { fg = matrix.matrix_gray }
        -- Conditionals
        treesitter.TSConditional = { fg = matrix.matrix_green_1 } -- For keywords related to conditionals.
        -- Function names
        treesitter.TSFunction = { fg = matrix.matrix_green_5 }    -- For function (calls and definitions).
        treesitter.TSFuncBuiltin = { fg = matrix.matrix_green_5 }
        -- Namespaces and property accessors
        treesitter.TSNamespace = { fg = matrix.matrix_green_1 } -- For identifiers referring to modules and namespaces.
        treesitter.TSProperty = { fg = matrix.matrix_red }      -- Same as `TSField`
        -- Language keywords
        treesitter.TSKeyword = { fg = matrix.matrix_green_1 }   -- For keywords that don't fall in other categories.
        treesitter.TSKeywordFunction = { fg = matrix.matrix_green_5 }
        treesitter.TSKeywordReturn = { fg = matrix.matrix_green_5 }
        treesitter.TSKeywordOperator = { fg = matrix.matrix_green_5 }
        treesitter.TSRepeat = { fg = matrix.matrix_green_1 }           -- For keywords related to loops.
        -- Strings
        treesitter.TSString = { fg = matrix.matrix_turquoise_2 }       -- For strings.
        treesitter.TSStringRegex = { fg = matrix.matrix_green_4 }      -- For regexes.
        treesitter.TSStringEscape = { fg = matrix.matrix_turquoise_3 } -- For escape characters within a string.
        treesitter.TSCharacter = { fg = matrix.matrix_turquoise_2 }    -- For characters.
    else
        -- Italic variants
        treesitter.TSComment = { fg = matrix.matrix_gray, style = "italic" }
        treesitter.TSConditional = { fg = matrix.matrix_green_1, style = "italic" }
        treesitter.TSFunction = { fg = matrix.matrix_green_5, style = "italic" }
        treesitter.TSMethod = { fg = matrix.matrix_green_4, style = "italic" }
        treesitter.TSFuncBuiltin = { fg = matrix.matrix_green_5, style = "italic" }
        treesitter.TSNamespace = { fg = matrix.matrix_green_1, style = "italic" }
        treesitter.TSField = { fg = matrix.matrix_green_1, style = "italic" }
        treesitter.TSProperty = { fg = matrix.matrix_red, style = "italic" }
        treesitter.TSKeyword = { fg = matrix.matrix_green_1, style = "italic" }
        treesitter.TSKeywordFunction = { fg = matrix.matrix_green_5, style = "italic" }
        treesitter.TSKeywordReturn = { fg = matrix.matrix_green_5, style = "italic" }
        treesitter.TSKeywordOperator = { fg = matrix.matrix_green_5, style = "italic" }
        treesitter.TSRepeat = { fg = matrix.matrix_green_1, style = "italic" }
        treesitter.TSString = { fg = matrix.matrix_turquoise_2, style = "italic" }
        treesitter.TSStringRegex = { fg = matrix.matrix_green_4, style = "italic" }
        treesitter.TSStringEscape = { fg = matrix.matrix_turquoise_3, style = "italic" }
        treesitter.TSCharacter = { fg = matrix.matrix_turquoise_2, style = "italic" }
    end

    return treesitter
end

theme.loadLSP = function()
    -- Lsp highlight groups
    local lsp = {
        -- Monochrome

        -- Red / Amber / Green / Turquoise grouped for clarity

        -- Turquoise (errors/warnings mapped)
        LspDiagnosticsDefaultError = { fg = matrix.matrix_turquoise_1 },                          -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError = { fg = matrix.matrix_turquoise_1 },                             -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError = { fg = matrix.matrix_turquoise_1 },                         -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError = { fg = matrix.matrix_turquoise_1 },                      -- Virtual text "Error"
        LspDiagnosticsUnderlineError = { style = "undercurl", sp = matrix.matrix_turquoise_1 },   -- used to underline "Error" diagnostics.

        LspDiagnosticsDefaultWarning = { fg = matrix.matrix_turquoise_3 },                        -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning = { fg = matrix.matrix_turquoise_3 },                           -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning = { fg = matrix.matrix_turquoise_3 },                       -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning = { fg = matrix.matrix_turquoise_3 },                    -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = matrix.matrix_turquoise_3 }, -- used to underline "Warning" diagnostics.

        -- Red (information)
        LspDiagnosticsDefaultInformation = { fg = matrix.matrix_red },                        -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation = { fg = matrix.matrix_red },                           -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation = { fg = matrix.matrix_red },                       -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation = { fg = matrix.matrix_red },                    -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = matrix.matrix_red }, -- used to underline "Information" diagnostics.

        -- Green (hints / references)
        LspDiagnosticsDefaultHint = { fg = matrix.matrix_green_1 },                    -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint = { fg = matrix.matrix_green_1 },                       -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint = { fg = matrix.matrix_green_1 },                   -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint = { fg = matrix.matrix_green_1 },                -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint = { style = "undercurl", sp = matrix.matrix_red }, -- used to underline "Hint" diagnostics.
        LspReferenceText = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },  -- used for highlighting "text" references
        LspReferenceRead = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },  -- used for highlighting "read" references
        LspReferenceWrite = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 }, -- used for highlighting "write" references

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
        -- Monochrome
        FernBranchText = { fg = matrix.matrix_gray },

        -- Red
        NeogitBranch = { fg = matrix.matrix_red },
        LightspeedShortcut = { fg = matrix.matrix_red, style = "bold" },
        LightspeedShortcutOverlapped = { fg = matrix.matrix_red, style = "bold,underline" },
        LspSagaHoverBorder = { fg = matrix.matrix_red },
        LspSagaCodeActionTitle = { fg = matrix.matrix_red },

        -- Amber
        diffOldFile = { fg = matrix.yelow },                             -- note: original key 'yelow' kept
        WhichKeyDesc = { fg = matrix.matrix_green_4, style = "italic" }, -- group placement makes sense in context

        -- Green (ascending brightness)
        LspTroubleText = { fg = matrix.matrix_green_1 },
        LspTroubleCount = { fg = matrix.matrix_green_1, bg = matrix.matrix_red },
        LspTroubleNormal = { fg = matrix.matrix_green_1, bg = matrix.sidebar },

        diffIndexLine = { fg = matrix.matrix_green_1 },
        diffFile = { fg = matrix.matrix_green_4 },
        diffLine = { fg = matrix.matrix_green_7 },
        diffNewFile = { fg = matrix.matrix_light_1 },

        GitGutterAdd = { fg = matrix.matrix_turquoise_2 },
        GitGutterChange = { fg = matrix.matrix_turquoise_3 },
        GitGutterDelete = { fg = matrix.matrix_turquoise_1 },

        -- GitSigns
        GitSignsAdd = { fg = matrix.matrix_turquoise_2 },
        GitSignsAddNr = { fg = matrix.matrix_turquoise_2 },
        GitSignsAddLn = { fg = matrix.matrix_turquoise_2 },
        GitSignsChange = { fg = matrix.matrix_turquoise_3 },
        GitSignsChangeNr = { fg = matrix.matrix_turquoise_3 },
        GitSignsChangeLn = { fg = matrix.matrix_turquoise_3 },
        GitSignsDelete = { fg = matrix.matrix_turquoise_1 },
        GitSignsDeleteNr = { fg = matrix.matrix_turquoise_1 },
        GitSignsDeleteLn = { fg = matrix.matrix_turquoise_1 },

        -- Telescope
        TelescopePromptBorder = { fg = matrix.matrix_green_5 },
        TelescopeResultsBorder = { fg = matrix.matrix_green_1 },
        TelescopePreviewBorder = { fg = matrix.matrix_turquoise_2 },
        TelescopeSelectionCaret = { fg = matrix.matrix_green_1 },
        TelescopeSelection = { fg = matrix.matrix_green_1 },
        TelescopeMatching = { fg = matrix.matrix_green_5 },

        -- NvimTree (folder/file related)
        NvimTreeRootFolder = { fg = matrix.matrix_green_4, style = "bold" },
        NvimTreeGitDirty = { fg = matrix.matrix_turquoise_3 },
        NvimTreeGitNew = { fg = matrix.matrix_turquoise_2 },
        NvimTreeImageFile = { fg = matrix.matrix_turquoise_3 },
        NvimTreeExecFile = { fg = matrix.matrix_turquoise_2 },
        NvimTreeSpecialFile = { fg = matrix.matrix_green_1, style = "underline" },
        NvimTreeFolderName = { fg = matrix.matrix_red },
        NvimTreeEmptyFolderName = { fg = matrix.matrix_dark_2 },
        NvimTreeFolderIcon = { fg = matrix.matrix_green_1 },
        NvimTreeIndentMarker = { fg = matrix.matrix_dark_2 },

        -- WhichKey
        WhichKey = { fg = matrix.matrix_green_1, style = "bold" },
        WhichKeyGroup = { fg = matrix.matrix_green_1 },
        WhichKeySeperator = { fg = matrix.matrix_green_1 },
        WhichKeyFloating = { bg = matrix.float },
        WhichKeyFloat = { bg = matrix.float },

        -- LspSaga / Diagnostic mappings
        DiagnosticError = { fg = matrix.matrix_turquoise_1 },
        DiagnosticWarning = { fg = matrix.matrix_turquoise_3 },
        DiagnosticInformation = { fg = matrix.matrix_red },
        DiagnosticHint = { fg = matrix.matrix_green_1 },
        DiagnosticTruncateLine = { fg = matrix.matrix_green_1 },
        LspFloatWinNormal = { bg = matrix.matrix_green_6 },
        LspFloatWinBorder = { fg = matrix.matrix_green_1 },
        LspSagaBorderTitle = { fg = matrix.matrix_green_5 },
        LspSagaRenameBorder = { fg = matrix.matrix_turquoise_2 },
        LspSagaDefPreviewBorder = { fg = matrix.matrix_turquoise_2 },
        LspSagaCodeActionBorder = { fg = matrix.matrix_green_4 },
        LspSagaFinderSelection = { fg = matrix.matrix_turquoise_2 },
        LspSagaCodeActionContent = { fg = matrix.matrix_green_1 },
        LspSagaSignatureHelpBorder = { fg = matrix.matrix_light_2 },
        ReferencesCount = { fg = matrix.matrix_green_1 },
        DefinitionCount = { fg = matrix.matrix_green_1 },
        DefinitionIcon = { fg = matrix.matrix_green_4 },
        ReferencesIcon = { fg = matrix.matrix_green_4 },
        TargetWord = { fg = matrix.matrix_green_5 },

        -- Sneak
        Sneak = { fg = matrix.matrix_dark_1, bg = matrix.matrix_green_1 },
        SneakScope = { bg = matrix.matrix_dark_2 },

        -- Cmp
        CmpItemKind = { fg = matrix.matrix_turquoise_3 },
        CmpItemAbbrMatch = { fg = matrix.matrix_green_2, style = "bold" },
        CmpItemAbbrMatchFuzzy = { fg = matrix.matrix_green_2, style = "bold" },
        CmpItemAbbr = { fg = matrix.matrix_green_1 },
        CmpItemMenu = { fg = matrix.matrix_turquoise_2 },

        -- Indent Blankline
        IndentBlanklineChar = { fg = matrix.matrix_green_7 },
        IndentBlanklineContextChar = { fg = matrix.matrix_red },

        -- Illuminate
        illuminatedWord = { bg = matrix.matrix_green_7 },
        illuminatedCurWord = { bg = matrix.matrix_green_7 },

        -- nvim-dap
        DapBreakpoint = { fg = matrix.matrix_turquoise_2 },
        DapStopped = { fg = matrix.matrix_turquoise_3 },

        -- nvim-dap-ui
        DapUIVariable = { fg = matrix.matrix_green_1 },
        DapUIScope = { fg = matrix.matrix_green_5 },
        DapUIType = { fg = matrix.matrix_green_1 },
        DapUIValue = { fg = matrix.matrix_green_1 },
        DapUIModifiedValue = { fg = matrix.matrix_green_5 },
        DapUIDecoration = { fg = matrix.matrix_green_5 },
        DapUIThread = { fg = matrix.matrix_green_5 },
        DapUIStoppedThread = { fg = matrix.matrix_green_5 },
        DapUIFrameName = { fg = matrix.matrix_green_1 },
        DapUISource = { fg = matrix.matrix_green_1 },
        DapUILineNumber = { fg = matrix.matrix_green_5 },
        DapUIFloatBorder = { fg = matrix.matrix_green_5 },
        DapUIWatchesEmpty = { fg = matrix.matrix_turquoise_1 },
        DapUIWatchesValue = { fg = matrix.matrix_green_5 },
        DapUIWatchesError = { fg = matrix.matrix_turquoise_1 },
        DapUIBreakpointsPath = { fg = matrix.matrix_green_5 },
        DapUIBreakpointsInfo = { fg = matrix.matrix_green_5 },
        DapUIBreakpointsCurrentLine = { fg = matrix.matrix_green_5 },
        DapUIBreakpointsLine = { fg = matrix.matrix_green_5 },

        -- Hop
        HopNextKey = { fg = matrix.matrix_green_1, style = "bold" },
        HopNextKey1 = { fg = matrix.matrix_green_5, style = "bold" },
        HopNextKey2 = { fg = matrix.matrix_green_1 },
        HopUnmatched = { fg = matrix.matrix_green_7 },

        -- nvim-ts-rainbow
        rainbowcol1 = { fg = matrix.matrix_turquoise_3 },
        rainbowcol2 = { fg = matrix.matrix_light_2 },
        rainbowcol3 = { fg = matrix.matrix_turquoise_1 },
        rainbowcol4 = { fg = matrix.matrix_green_4 },
        rainbowcol5 = { fg = matrix.matrix_green_5 },
        rainbowcol6 = { fg = matrix.matrix_turquoise_3 },
        rainbowcol7 = { fg = matrix.matrix_light_2 },

        -- lightspeed
        LightspeedLabel = { fg = matrix.matrix_green_5, style = "bold" },
        LightspeedLabelOverlapped = { fg = matrix.matrix_green_5, style = "bold,underline" },
        LightspeedLabelDistant = { fg = matrix.matrix_turquoise_3, style = "bold" },
        LightspeedLabelDistantOverlapped = { fg = matrix.matrix_turquoise_3, style = "bold,underline" },
        LightspeedMaskedChar = { fg = matrix.matrix_green_1, bg = matrix.matrix_green_6, style = "bold" },
        LightspeedGreyWash = { fg = matrix.matrix_gray },
        LightspeedUnlabeledMatch = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },
        LightspeedOneCharMatch = { fg = matrix.matrix_green_5, style = "bold,reverse" },
        LightspeedUniqueChar = { style = "bold,underline" },

        -- copilot
        CopilotLabel = { fg = matrix.matrix_green_7, bg = matrix.none },

        -- Statusline
        StatusLineDull = { fg = matrix.matrix_green_7, bg = matrix.matrix_dark_2 },
        StatusLineAccent = { fg = matrix.matrix_dark_1, bg = matrix.matrix_light_2 },
    }

    -- Options:

    -- Disable nvim-tree background
    if vim.g.matrix_disable_background then
        plugins.NvimTreeNormal = { fg = matrix.matrix_green_1, bg = matrix.none }
    else
        plugins.NvimTreeNormal = { fg = matrix.matrix_green_1, bg = matrix.sidebar }
    end

    if vim.g.matrix_enable_sidebar_background then
        plugins.NvimTreeNormal = { fg = matrix.matrix_green_1, bg = matrix.sidebar }
    else
        plugins.NvimTreeNormal = { fg = matrix.matrix_green_1, bg = matrix.none }
    end

    return plugins
end

return theme
