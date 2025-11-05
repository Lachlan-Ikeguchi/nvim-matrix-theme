local matrix = require("matrix.colors")

local theme = {}

theme.loadSyntax = function()
    -- Syntax highlight groups
    local syntax = {
        Type = { fg = matrix.matrix_turquoise_1 },                                        -- int, long, char, etc.
        StorageClass = { fg = matrix.matrix_turquoise_1 },                                -- static, register, volatile, etc.
        Structure = { fg = matrix.matrix_turquoise_1 },                                   -- struct, union, enum, etc.
        Constant = { fg = matrix.matrix_green_1 },                                        -- any constant
        Character = { fg = matrix.matrix_turquoise_4 },                                   -- any character constant: 'c', '\n'
        Number = { fg = matrix.matrix_turquoise_5 },                                      -- a number constant: 5
        Boolean = { fg = matrix.matrix_turquoise_1 },                                     -- a boolean constant: TRUE, false
        Float = { fg = matrix.matrix_turquoise_5 },                                       -- a floating point constant: 2.3e10
        Statement = { fg = matrix.matrix_turquoise_1 },                                   -- any statement
        Label = { fg = matrix.matrix_turquoise_1 },                                       -- case, default, etc.
        Operator = { fg = matrix.matrix_turquoise_1 },                                    -- sizeof", "+", "*", etc.
        Exception = { fg = matrix.matrix_turquoise_1 },                                   -- try, catch, throw
        PreProc = { fg = matrix.matrix_turquoise_1 },                                     -- generic Preprocessor
        Include = { fg = matrix.matrix_turquoise_1 },                                     -- preprocessor #include
        Define = { fg = matrix.matrix_turquoise_1 },                                      -- preprocessor #define
        Macro = { fg = matrix.matrix_turquoise_1 },                                       -- same as Define
        Typedef = { fg = matrix.matrix_turquoise_1 },                                     -- A typedef
        PreCondit = { fg = matrix.matrix_light_2 },                                       -- preprocessor #if, #else, #endif, etc.
        Special = { fg = matrix.matrix_green_1 },                                         -- any special symbol
        SpecialChar = { fg = matrix.matrix_light_2 },                                     -- special character in a constant
        Tag = { fg = matrix.matrix_green_1 },                                             -- you can use CTRL-] on this
        Delimiter = { fg = matrix.matrix_green_3 },                                       -- character that needs attention like , or .
        SpecialComment = { fg = matrix.matrix_green_5 },                                  -- special things inside a comment
        Debug = { fg = matrix.matrix_turquoise_3 },                                       -- debugging statements
        Underlined = { fg = matrix.matrix_turquoise_4, bg = matrix.none, style = "underline" }, -- text that stands out, HTML links
        Ignore = { fg = matrix.matrix_dark_2 },                                           -- left blank, hidden
        Error = { fg = matrix.matrix_turquoise_3, bg = matrix.none, style = "bold,underline" }, -- any erroneous construct
        Todo = { fg = matrix.matrix_light_2, bg = matrix.none, style = "bold,italic" },   -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
        Conceal = { fg = matrix.none, bg = matrix.matrix_dark_1 },

        htmlLink = { fg = matrix.matrix_turquoise_4, style = "underline" },
        htmlH1 = { fg = matrix.matrix_green_5, style = "bold" },
        htmlH2 = { fg = matrix.matrix_turquoise_3, style = "bold" },
        htmlH3 = { fg = matrix.matrix_turquoise_4, style = "bold" },
        htmlH4 = { fg = matrix.matrix_turquoise_5, style = "bold" },
        htmlH5 = { fg = matrix.matrix_turquoise_1, style = "bold" },
        markdownH1 = { fg = matrix.matrix_green_5, style = "bold" },
        markdownH2 = { fg = matrix.matrix_turquoise_3, style = "bold" },
        markdownH3 = { fg = matrix.matrix_turquoise_4, style = "bold" },
        markdownH1Delimiter = { fg = matrix.matrix_green_5 },
        markdownH2Delimiter = { fg = matrix.matrix_turquoise_3 },
        markdownH3Delimiter = { fg = matrix.matrix_turquoise_4 },
    }

    -- Italic comments
    if vim.g.matrix_italic == false then
        syntax.Comment = { fg = matrix.matrix_gray }                                          -- normal comments
        syntax.Conditional = { fg = matrix.matrix_turquoise_1 }                               -- normal if, then, else, endif, switch, etc.
        syntax.Function = { fg = matrix.matrix_green_5 }                                      -- normal function names
        syntax.Identifier = { fg = matrix.matrix_turquoise_1 }                                -- any variable name
        syntax.Keyword = { fg = matrix.matrix_turquoise_1 }                                   -- normal for, do, while, etc.
        syntax.Repeat = { fg = matrix.matrix_turquoise_1 }                                    -- normal any other keyword
        syntax.String = { fg = matrix.matrix_turquoise_4 }                                    -- any string
    else
        syntax.Comment = { fg = matrix.matrix_gray, bg = matrix.none, style = "italic" }      -- italic comments
        syntax.Conditional = { fg = matrix.matrix_turquoise_1, bg = matrix.none, style = "italic" } -- italic if, then, else, endif, switch, etc.
        syntax.Function = { fg = matrix.matrix_green_5, bg = matrix.none, style = "italic" }  -- italic funtion names
        syntax.Identifier = { fg = matrix.matrix_turquoise_1, bg = matrix.none, style = "italic" } -- any variable name
        syntax.Keyword = { fg = matrix.matrix_turquoise_1, bg = matrix.none, style = "italic" } -- italic for, do, while, etc.
        syntax.Repeat = { fg = matrix.matrix_turquoise_1, bg = matrix.none, style = "italic" } -- italic any other keyword
        syntax.String = { fg = matrix.matrix_turquoise_4, bg = matrix.none, style = "italic" } -- any string
    end

    return syntax
end

theme.loadEditor = function()
    -- Editor highlight groups

    local editor = {
        NormalFloat = { fg = matrix.matrix_green_1, bg = matrix.float },                -- normal text and background color
        FloatBorder = { fg = matrix.matrix_green_1, bg = matrix.float },                -- normal text and background color
        ColorColumn = { fg = matrix.none, bg = matrix.matrix_dark_2 },                  --  used for the columns set with 'colorcolumn'
        Conceal = { fg = matrix.matrix_dark_2 },                                        -- placeholder characters substituted for concealed text (see 'conceallevel')
        Cursor = { fg = matrix.matrix_green_1, bg = matrix.none, style = "reverse" },   -- the character under the cursor
        CursorIM = { fg = matrix.matrix_green_2, bg = matrix.none, style = "reverse" }, -- like Cursor, but used when in IME mode
        Directory = { fg = matrix.matrix_green_4, bg = matrix.none },                   -- directory names (and other special names in listings)
        DiffAdd = { fg = matrix.matrix_turquoise_4, bg = matrix.none, style = "reverse" }, -- diff mode: Added line
        DiffChange = { fg = matrix.matrix_light_2, bg = matrix.none, style = "reverse" }, --  diff mode: Changed line
        DiffDelete = { fg = matrix.matrix_turquoise_3, bg = matrix.none, style = "reverse" }, -- diff mode: Deleted line
        DiffText = { fg = matrix.matrix_turquoise_5, bg = matrix.none, style = "reverse" }, -- diff mode: Changed text within a changed line
        EndOfBuffer = { fg = matrix.matrix_dark_2 },
        ErrorMsg = { fg = matrix.none },
        Folded = { fg = matrix.matrix_gray, bg = matrix.none, style = "italic" },
        FoldColumn = { fg = matrix.matrix_green_4 },
        IncSearch = { fg = matrix.matrix_green_3, bg = matrix.matrix_turquoise_2 },
        LineNr = { fg = matrix.matrix_gray },
        CursorLineNr = { fg = matrix.matrix_green_1 },
        MatchParen = { fg = matrix.matrix_turquoise_5, bg = matrix.none, style = "bold" },
        ModeMsg = { fg = matrix.matrix_green_1 },
        MoreMsg = { fg = matrix.matrix_green_1 },
        NonText = { fg = matrix.matrix_dark_2 },
        Pmenu = { fg = matrix.matrix_green_1, bg = matrix.matrix_green_6 },
        PmenuSel = { fg = matrix.matrix_green_1, bg = matrix.matrix_turquoise_2 },
        PmenuSbar = { fg = matrix.matrix_green_1, bg = matrix.matrix_green_6 },
        PmenuThumb = { fg = matrix.matrix_green_1, bg = matrix.matrix_green_1 },
        Question = { fg = matrix.matrix_turquoise_4 },
        QuickFixLine = { fg = matrix.matrix_green_1, bg = matrix.none, style = "reverse" },
        qfLineNr = { fg = matrix.matrix_green_1, bg = matrix.none, style = "reverse" },
        Search = { fg = matrix.matrix_turquoise_2, bg = matrix.matrix_green_3, style = "reverse" },
        SpecialKey = { fg = matrix.matrix_turquoise_1 },
        SpellBad = { fg = matrix.matrix_turquoise_3, bg = matrix.none, style = "italic,undercurl" },
        SpellCap = { fg = matrix.matrix_green_4, bg = matrix.none, style = "italic,undercurl" },
        SpellLocal = { fg = matrix.matrix_green_5, bg = matrix.none, style = "italic,undercurl" },
        SpellRare = { fg = matrix.matrix_turquoise_1, bg = matrix.none, style = "italic,undercurl" },
        StatusLine = { fg = matrix.matrix_green_1, bg = matrix.matrix_green_6 },
        StatusLineNC = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },
        StatusLineTerm = { fg = matrix.matrix_green_1, bg = matrix.matrix_green_6 },
        StatusLineTermNC = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },
        TabLineFill = { fg = matrix.matrix_green_1, bg = matrix.none },
        TablineSel = { fg = matrix.matrix_dark_2, bg = matrix.matrix_turquoise_1 },
        Tabline = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },
        Title = { fg = matrix.matrix_turquoise_4, bg = matrix.none, style = "bold" },
        Visual = { fg = matrix.none, bg = matrix.matrix_green_6 },
        VisualNOS = { fg = matrix.none, bg = matrix.matrix_green_6 },
        WarningMsg = { fg = matrix.matrix_turquoise_5 },
        WildMenu = { fg = matrix.matrix_light_1, bg = matrix.none, style = "bold" },
        CursorColumn = { fg = matrix.none, bg = matrix.cursorlinefg },
        CursorLine = { fg = matrix.none, bg = matrix.cursorlinefg },
        ToolbarLine = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },
        ToolbarButton = { fg = matrix.matrix_green_1, bg = matrix.none, style = "bold" },
        NormalMode = { fg = matrix.matrix_green_1, bg = matrix.none, style = "reverse" },
        InsertMode = { fg = matrix.matrix_turquoise_4, bg = matrix.none, style = "reverse" },
        ReplacelMode = { fg = matrix.matrix_turquoise_3, bg = matrix.none, style = "reverse" },
        VisualMode = { fg = matrix.matrix_turquoise_1, bg = matrix.none, style = "reverse" },
        CommandMode = { fg = matrix.matrix_green_1, bg = matrix.none, style = "reverse" },
        Warnings = { fg = matrix.matrix_turquoise_5 },

        healthError = { fg = matrix.matrix_turquoise_3 },
        healthSuccess = { fg = matrix.matrix_turquoise_4 },
        healthWarning = { fg = matrix.matrix_turquoise_5 },

        -- dashboard
        DashboardShortCut = { fg = matrix.matrix_green_4 },
        DashboardHeader = { fg = matrix.matrix_turquoise_1 },
        DashboardCenter = { fg = matrix.matrix_green_5 },
        DashboardFooter = { fg = matrix.matrix_turquoise_4, style = "italic" },

        -- BufferLine
        BufferLineIndicatorSelected = { fg = matrix.matrix_dark_1 },
        BufferLineFill = { bg = matrix.matrix_dark_1 },
    }

    -- Options:

    --Set transparent background
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
    vim.g.terminal_color_0 = matrix.matrix_dark_2
    vim.g.terminal_color_1 = matrix.matrix_turquoise_3
    vim.g.terminal_color_2 = matrix.matrix_turquoise_4
    vim.g.terminal_color_3 = matrix.matrix_light_2
    vim.g.terminal_color_4 = matrix.matrix_turquoise_1
    vim.g.terminal_color_5 = matrix.matrix_turquoise_5
    vim.g.terminal_color_6 = matrix.matrix_green_5
    vim.g.terminal_color_7 = matrix.matrix_green_2
    vim.g.terminal_color_8 = matrix.matrix_green_7
    vim.g.terminal_color_9 = matrix.matrix_turquoise_3
    vim.g.terminal_color_10 = matrix.matrix_turquoise_4
    vim.g.terminal_color_11 = matrix.matrix_light_2
    vim.g.terminal_color_12 = matrix.matrix_turquoise_1
    vim.g.terminal_color_13 = matrix.matrix_turquoise_5
    vim.g.terminal_color_14 = matrix.matrix_green_4
    vim.g.terminal_color_15 = matrix.matrix_green_3
end

theme.loadTreeSitter = function()
    -- TreeSitter highlight groups

    local treesitter = {
        TSAnnotation = { fg = matrix.matrix_light_1 },                                 -- For C++/Dart attributes, annotations thatcan be attached to the code to denote some kind of meta information.
        TSConstructor = { fg = matrix.matrix_turquoise_1 },                            -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
        TSConstant = { fg = matrix.matrix_light_2 },                                   -- For constants
        TSFloat = { fg = matrix.matrix_turquoise_5 },                                  -- For floats
        TSNumber = { fg = matrix.matrix_turquoise_5 },                                 -- For all number

        TSAttribute = { fg = matrix.matrix_turquoise_5 },                              -- (unstable) TODO: docs
        TSVariable = { fg = matrix.matrix_green_1, style = "bold" },                   -- Any variable name that does not have another highlight.
        TSVariableBuiltin = { fg = matrix.matrix_green_1, style = "bold" },
        TSBoolean = { fg = matrix.matrix_turquoise_1, style = "bold" },                -- For booleans.
        TSConstBuiltin = { fg = matrix.matrix_green_4, style = "bold" },               -- For constant that are built in the language: `nil` in Lua.
        TSConstMacro = { fg = matrix.matrix_green_4, style = "bold" },                 -- For constants that are defined by macros: `NULL` in C.
        TSError = { fg = matrix.matrix_turquoise_3 },                                  -- For syntax/parser errors.
        TSException = { fg = matrix.matrix_turquoise_5 },                              -- For exception related keywords.
        TSFuncMacro = { fg = matrix.matrix_green_4 },                                  -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
        TSInclude = { fg = matrix.matrix_turquoise_1 },                                -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
        TSLabel = { fg = matrix.matrix_turquoise_5 },                                  -- For labels: `label:` in C and `:label:` in Lua.
        TSOperator = { fg = matrix.matrix_turquoise_1 },                               -- For any operator: `+`, but also `->` and `*` in C.
        TSParameter = { fg = matrix.matrix_turquoise_2 },                              -- For parameters of a function.
        TSParameterReference = { fg = matrix.matrix_turquoise_2 },                     -- For references to parameters of a function.
        TSPunctDelimiter = { fg = matrix.matrix_green_5 },                             -- For delimiters ie: `.`
        TSPunctBracket = { fg = matrix.matrix_green_5 },                               -- For brackets and parens.
        TSPunctSpecial = { fg = matrix.matrix_green_5 },                               -- For special punctutation that does not fall in the catagories before.
        TSSymbol = { fg = matrix.matrix_turquoise_5 },                                 -- For identifiers referring to symbols or atoms.
        TSType = { fg = matrix.matrix_turquoise_1 },                                   -- For types.
        TSTypeBuiltin = { fg = matrix.matrix_turquoise_1 },                            -- For builtin types.
        TSTag = { fg = matrix.matrix_green_1 },                                        -- Tags like html tag names.
        TSTagDelimiter = { fg = matrix.matrix_turquoise_5 },                           -- Tag delimiter like `<` `>` `/`
        TSText = { fg = matrix.matrix_green_1 },                                       -- For strings considematrix11_gui text in a markup language.
        TSTextReference = { fg = matrix.matrix_turquoise_5 },                          -- FIXME
        TSEmphasis = { fg = matrix.matrix_turquoise_2 },                               -- For text to be represented with emphasis.
        TSUnderline = { fg = matrix.matrix_green_1, bg = matrix.none, style = "underline" }, -- For text to be represented with an underline.
        TSTitle = { fg = matrix.matrix_turquoise_2, bg = matrix.none, style = "bold" }, -- Text that is part of a title.
        TSLiteral = { fg = matrix.matrix_green_1 },                                    -- Literal text.
        TSURI = { fg = matrix.matrix_turquoise_4 },                                    -- Any URI like a link or email.
        TSAnnotation = { fg = matrix.matrix_turquoise_3 },                             -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    }

    if vim.g.matrix_italic == false then
        -- Comments
        treesitter.TSComment = { fg = matrix.matrix_gray }
        -- Conditionals
        treesitter.TSConditional = { fg = matrix.matrix_turquoise_1 } -- For keywords related to conditionnals.
        -- Function names
        treesitter.TSFunction = { fg = matrix.matrix_green_5 }  -- For fuction (calls and definitions).
        treesitter.TSMethod = { fg = matrix.matrix_green_4 }    -- For method calls and definitions.
        treesitter.TSFuncBuiltin = { fg = matrix.matrix_green_5 }
        -- Namespaces and property accessors
        treesitter.TSNamespace = { fg = matrix.matrix_green_1 } -- For identifiers referring to modules and namespaces.
        treesitter.TSField = { fg = matrix.matrix_green_1 }  -- For fields in literals
        treesitter.TSProperty = { fg = matrix.matrix_turquoise_2 } -- Same as `TSField`
        -- Language keywords
        treesitter.TSKeyword = { fg = matrix.matrix_turquoise_1 } -- For keywords that don't fall in other categories.
        treesitter.TSKeywordFunction = { fg = matrix.matrix_green_5 }
        treesitter.TSKeywordReturn = { fg = matrix.matrix_green_5 }
        treesitter.TSKeywordOperator = { fg = matrix.matrix_green_5 }
        treesitter.TSRepeat = { fg = matrix.matrix_turquoise_1 } -- For keywords related to loops.
        -- Strings
        treesitter.TSString = { fg = matrix.matrix_turquoise_4 } -- For strings.
        treesitter.TSStringRegex = { fg = matrix.matrix_green_4 } -- For regexes.
        treesitter.TSStringEscape = { fg = matrix.matrix_turquoise_5 } -- For escape characters within a string.
        treesitter.TSCharacter = { fg = matrix.matrix_turquoise_4 } -- For characters.
    else
        -- Comments
        treesitter.TSComment = { fg = matrix.matrix_gray, style = "italic" }
        -- Conditionals
        treesitter.TSConditional = { fg = matrix.matrix_turquoise_1, style = "italic" } -- For keywords related to conditionnals.
        -- Function names
        treesitter.TSFunction = { fg = matrix.matrix_green_5, style = "italic" }  -- For fuction (calls and definitions).
        treesitter.TSMethod = { fg = matrix.matrix_green_4, style = "italic" }    -- For method calls and definitions.
        treesitter.TSFuncBuiltin = { fg = matrix.matrix_green_5, style = "italic" }
        -- Namespaces and property accessors
        treesitter.TSNamespace = { fg = matrix.matrix_green_1, style = "italic" } -- For identifiers referring to modules and namespaces.
        treesitter.TSField = { fg = matrix.matrix_green_1, style = "italic" }  -- For fields.
        treesitter.TSProperty = { fg = matrix.matrix_turquoise_2, style = "italic" } -- Same as `TSField`, but when accessing, not declaring.
        -- Language keywords
        treesitter.TSKeyword = { fg = matrix.matrix_turquoise_1, style = "italic" } -- For keywords that don't fall in other categories.
        treesitter.TSKeywordFunction = { fg = matrix.matrix_green_5, style = "italic" }
        treesitter.TSKeywordReturn = { fg = matrix.matrix_green_5, style = "italic" }
        treesitter.TSKeywordOperator = { fg = matrix.matrix_green_5, style = "italic" }
        treesitter.TSRepeat = { fg = matrix.matrix_turquoise_1, style = "italic" } -- For keywords related to loops.
        -- Strings
        treesitter.TSString = { fg = matrix.matrix_turquoise_4, style = "italic" } -- For strings.
        treesitter.TSStringRegex = { fg = matrix.matrix_green_4, style = "italic" } -- For regexes.
        treesitter.TSStringEscape = { fg = matrix.matrix_turquoise_5, style = "italic" } -- For escape characters within a string.
        treesitter.TSCharacter = { fg = matrix.matrix_turquoise_4, style = "italic" } -- For characters.
    end

    return treesitter
end

theme.loadLSP = function()
    -- Lsp highlight groups

    local lsp = {
        LspDiagnosticsDefaultError = { fg = matrix.matrix_turquoise_3 },                        -- used for "Error" diagnostic virtual text
        LspDiagnosticsSignError = { fg = matrix.matrix_turquoise_3 },                           -- used for "Error" diagnostic signs in sign column
        LspDiagnosticsFloatingError = { fg = matrix.matrix_turquoise_3 },                       -- used for "Error" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextError = { fg = matrix.matrix_turquoise_3 },                    -- Virtual text "Error"
        LspDiagnosticsUnderlineError = { style = "undercurl", sp = matrix.matrix_turquoise_3 }, -- used to underline "Error" diagnostics.
        LspDiagnosticsDefaultWarning = { fg = matrix.matrix_turquoise_5 },                      -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsSignWarning = { fg = matrix.matrix_turquoise_5 },                         -- used for "Warning" diagnostic signs in sign column
        LspDiagnosticsFloatingWarning = { fg = matrix.matrix_turquoise_5 },                     -- used for "Warning" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextWarning = { fg = matrix.matrix_turquoise_5 },                  -- Virtual text "Warning"
        LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = matrix.matrix_turquoise_5 }, -- used to underline "Warning" diagnostics.
        LspDiagnosticsDefaultInformation = { fg = matrix.matrix_turquoise_2 },                  -- used for "Information" diagnostic virtual text
        LspDiagnosticsSignInformation = { fg = matrix.matrix_turquoise_2 },                     -- used for "Information" diagnostic signs in sign column
        LspDiagnosticsFloatingInformation = { fg = matrix.matrix_turquoise_2 },                 -- used for "Information" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextInformation = { fg = matrix.matrix_turquoise_2 },              -- Virtual text "Information"
        LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = matrix.matrix_turquoise_2 }, -- used to underline "Information" diagnostics.
        LspDiagnosticsDefaultHint = { fg = matrix.matrix_turquoise_1 },                         -- used for "Hint" diagnostic virtual text
        LspDiagnosticsSignHint = { fg = matrix.matrix_turquoise_1 },                            -- used for "Hint" diagnostic signs in sign column
        LspDiagnosticsFloatingHint = { fg = matrix.matrix_turquoise_1 },                        -- used for "Hint" diagnostic messages in the diagnostics float
        LspDiagnosticsVirtualTextHint = { fg = matrix.matrix_turquoise_1 },                     -- Virtual text "Hint"
        LspDiagnosticsUnderlineHint = { style = "undercurl", sp = matrix.matrix_turquoise_2 },  -- used to underline "Hint" diagnostics.
        LspReferenceText = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },           -- used for highlighting "text" references
        LspReferenceRead = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },           -- used for highlighting "read" references
        LspReferenceWrite = { fg = matrix.matrix_green_1, bg = matrix.matrix_dark_2 },          -- used for highlighting "write" references

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

        -- LspTrouble
        LspTroubleText = { fg = matrix.matrix_green_1 },
        LspTroubleCount = { fg = matrix.matrix_turquoise_1, bg = matrix.matrix_turquoise_2 },
        LspTroubleNormal = { fg = matrix.matrix_green_1, bg = matrix.sidebar },

        -- Diff
        diffAdded = { fg = matrix.matrix_turquoise_4 },
        diffRemoved = { fg = matrix.matrix_turquoise_3 },
        diffChanged = { fg = matrix.matrix_turquoise_5 },
        diffOldFile = { fg = matrix.yelow },
        diffNewFile = { fg = matrix.matrix_light_1 },
        diffFile = { fg = matrix.matrix_green_4 },
        diffLine = { fg = matrix.matrix_green_7 },
        diffIndexLine = { fg = matrix.matrix_turquoise_1 },

        -- Neogit
        NeogitBranch = { fg = matrix.matrix_turquoise_2 },
        NeogitRemote = { fg = matrix.matrix_turquoise_1 },
        NeogitHunkHeader = { fg = matrix.matrix_green_5 },
        NeogitHunkHeaderHighlight = { fg = matrix.matrix_green_5, bg = matrix.matrix_dark_2 },
        NeogitDiffContextHighlight = { bg = matrix.matrix_dark_2 },
        NeogitDiffDeleteHighlight = { fg = matrix.matrix_turquoise_3, style = "reverse" },
        NeogitDiffAddHighlight = { fg = matrix.matrix_turquoise_4, style = "reverse" },

        -- GitGutter
        GitGutterAdd = { fg = matrix.matrix_turquoise_4 }, -- diff mode: Added line |diff.txt|
        GitGutterChange = { fg = matrix.matrix_turquoise_5 }, -- diff mode: Changed line |diff.txt|
        GitGutterDelete = { fg = matrix.matrix_turquoise_3 }, -- diff mode: Deleted line |diff.txt|

        -- GitSigns
        GitSignsAdd = { fg = matrix.matrix_turquoise_4 }, -- diff mode: Added line |diff.txt|
        GitSignsAddNr = { fg = matrix.matrix_turquoise_4 }, -- diff mode: Added line |diff.txt|
        GitSignsAddLn = { fg = matrix.matrix_turquoise_4 }, -- diff mode: Added line |diff.txt|
        GitSignsChange = { fg = matrix.matrix_turquoise_5 }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeNr = { fg = matrix.matrix_turquoise_5 }, -- diff mode: Changed line |diff.txt|
        GitSignsChangeLn = { fg = matrix.matrix_turquoise_5 }, -- diff mode: Changed line |diff.txt|
        GitSignsDelete = { fg = matrix.matrix_turquoise_3 }, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteNr = { fg = matrix.matrix_turquoise_3 }, -- diff mode: Deleted line |diff.txt|
        GitSignsDeleteLn = { fg = matrix.matrix_turquoise_3 }, -- diff mode: Deleted line |diff.txt|

        -- Telescope
        TelescopePromptBorder = { fg = matrix.matrix_green_5 },
        TelescopeResultsBorder = { fg = matrix.matrix_turquoise_1 },
        TelescopePreviewBorder = { fg = matrix.matrix_turquoise_4 },
        TelescopeSelectionCaret = { fg = matrix.matrix_turquoise_1 },
        TelescopeSelection = { fg = matrix.matrix_turquoise_1 },
        TelescopeMatching = { fg = matrix.matrix_green_5 },

        -- NvimTree
        NvimTreeRootFolder = { fg = matrix.matrix_green_4, style = "bold" },
        NvimTreeGitDirty = { fg = matrix.matrix_turquoise_5 },
        NvimTreeGitNew = { fg = matrix.matrix_turquoise_4 },
        NvimTreeImageFile = { fg = matrix.matrix_turquoise_5 },
        NvimTreeExecFile = { fg = matrix.matrix_turquoise_4 },
        NvimTreeSpecialFile = { fg = matrix.matrix_turquoise_1, style = "underline" },
        NvimTreeFolderName = { fg = matrix.matrix_turquoise_2 },
        NvimTreeEmptyFolderName = { fg = matrix.matrix_dark_2 },
        NvimTreeFolderIcon = { fg = matrix.matrix_green_1 },
        NvimTreeIndentMarker = { fg = matrix.matrix_dark_2 },
        LspDiagnosticsError = { fg = matrix.matrix_turquoise_3 },
        LspDiagnosticsWarning = { fg = matrix.matrix_turquoise_5 },
        LspDiagnosticsInformation = { fg = matrix.matrix_turquoise_2 },
        LspDiagnosticsHint = { fg = matrix.matrix_turquoise_1 },

        -- WhichKey
        WhichKey = { fg = matrix.matrix_green_1, style = "bold" },
        WhichKeyGroup = { fg = matrix.matrix_green_1 },
        WhichKeyDesc = { fg = matrix.matrix_green_4, style = "italic" },
        WhichKeySeperator = { fg = matrix.matrix_green_1 },
        WhichKeyFloating = { bg = matrix.float },
        WhichKeyFloat = { bg = matrix.float },

        -- LspSaga
        DiagnosticError = { fg = matrix.matrix_turquoise_3 },
        DiagnosticWarning = { fg = matrix.matrix_turquoise_5 },
        DiagnosticInformation = { fg = matrix.matrix_turquoise_2 },
        DiagnosticHint = { fg = matrix.matrix_turquoise_1 },
        DiagnosticTruncateLine = { fg = matrix.matrix_green_1 },
        LspFloatWinNormal = { bg = matrix.matrix_green_6 },
        LspFloatWinBorder = { fg = matrix.matrix_turquoise_1 },
        LspSagaBorderTitle = { fg = matrix.matrix_green_5 },
        LspSagaHoverBorder = { fg = matrix.matrix_turquoise_2 },
        LspSagaRenameBorder = { fg = matrix.matrix_turquoise_4 },
        LspSagaDefPreviewBorder = { fg = matrix.matrix_turquoise_4 },
        LspSagaCodeActionBorder = { fg = matrix.matrix_green_4 },
        LspSagaFinderSelection = { fg = matrix.matrix_turquoise_4 },
        LspSagaCodeActionTitle = { fg = matrix.matrix_turquoise_2 },
        LspSagaCodeActionContent = { fg = matrix.matrix_turquoise_1 },
        LspSagaSignatureHelpBorder = { fg = matrix.matrix_light_2 },
        ReferencesCount = { fg = matrix.matrix_turquoise_1 },
        DefinitionCount = { fg = matrix.matrix_turquoise_1 },
        DefinitionIcon = { fg = matrix.matrix_green_4 },
        ReferencesIcon = { fg = matrix.matrix_green_4 },
        TargetWord = { fg = matrix.matrix_green_5 },

        -- Sneak
        Sneak = { fg = matrix.matrix_dark_1, bg = matrix.matrix_green_1 },
        SneakScope = { bg = matrix.matrix_dark_2 },

        -- Cmp
        CmpItemKind = { fg = matrix.matrix_turquoise_5 },
        CmpItemAbbrMatch = { fg = matrix.matrix_green_2, style = "bold" },
        CmpItemAbbrMatchFuzzy = { fg = matrix.matrix_green_2, style = "bold" },
        CmpItemAbbr = { fg = matrix.matrix_green_1 },
        CmpItemMenu = { fg = matrix.matrix_turquoise_4 },

        -- Indent Blankline
        IndentBlanklineChar = { fg = matrix.matrix_green_7 },
        IndentBlanklineContextChar = { fg = matrix.matrix_turquoise_2 },

        -- Illuminate
        illuminatedWord = { bg = matrix.matrix_green_7 },
        illuminatedCurWord = { bg = matrix.matrix_green_7 },

        -- nvim-dap
        DapBreakpoint = { fg = matrix.matrix_turquoise_4 },
        DapStopped = { fg = matrix.matrix_turquoise_5 },

        -- nvim-dap-ui
        DapUIVariable = { fg = matrix.matrix_green_1 },
        DapUIScope = { fg = matrix.matrix_green_5 },
        DapUIType = { fg = matrix.matrix_turquoise_1 },
        DapUIValue = { fg = matrix.matrix_green_1 },
        DapUIModifiedValue = { fg = matrix.matrix_green_5 },
        DapUIDecoration = { fg = matrix.matrix_green_5 },
        DapUIThread = { fg = matrix.matrix_green_5 },
        DapUIStoppedThread = { fg = matrix.matrix_green_5 },
        DapUIFrameName = { fg = matrix.matrix_green_1 },
        DapUISource = { fg = matrix.matrix_turquoise_1 },
        DapUILineNumber = { fg = matrix.matrix_green_5 },
        DapUIFloatBorder = { fg = matrix.matrix_green_5 },
        DapUIWatchesEmpty = { fg = matrix.matrix_turquoise_3 },
        DapUIWatchesValue = { fg = matrix.matrix_green_5 },
        DapUIWatchesError = { fg = matrix.matrix_turquoise_3 },
        DapUIBreakpointsPath = { fg = matrix.matrix_green_5 },
        DapUIBreakpointsInfo = { fg = matrix.matrix_green_5 },
        DapUIBreakpointsCurrentLine = { fg = matrix.matrix_green_5 },
        DapUIBreakpointsLine = { fg = matrix.matrix_green_5 },

        -- Hop
        HopNextKey = { fg = matrix.matrix_green_1, style = "bold" },
        HopNextKey1 = { fg = matrix.matrix_green_5, style = "bold" },
        HopNextKey2 = { fg = matrix.matrix_green_1 },
        HopUnmatched = { fg = matrix.matrix_green_7 },

        -- Fern
        FernBranchText = { fg = matrix.matrix_gray },

        -- nvim-ts-rainbow
        rainbowcol1 = { fg = matrix.matrix_turquoise_5 },
        rainbowcol2 = { fg = matrix.matrix_light_2 },
        rainbowcol3 = { fg = matrix.matrix_turquoise_3 },
        rainbowcol4 = { fg = matrix.matrix_green_4 },
        rainbowcol5 = { fg = matrix.matrix_green_5 },
        rainbowcol6 = { fg = matrix.matrix_turquoise_5 },
        rainbowcol7 = { fg = matrix.matrix_light_2 },

        -- lightspeed
        LightspeedLabel = { fg = matrix.matrix_green_5, style = "bold" },
        LightspeedLabelOverlapped = { fg = matrix.matrix_green_5, style = "bold,underline" },
        LightspeedLabelDistant = { fg = matrix.matrix_turquoise_5, style = "bold" },
        LightspeedLabelDistantOverlapped = { fg = matrix.matrix_turquoise_5, style = "bold,underline" },
        LightspeedShortcut = { fg = matrix.matrix_turquoise_2, style = "bold" },
        LightspeedShortcutOverlapped = { fg = matrix.matrix_turquoise_2, style = "bold,underline" },
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
