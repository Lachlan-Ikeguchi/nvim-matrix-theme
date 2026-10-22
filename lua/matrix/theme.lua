local matrix = require("matrix.colors")

local theme = {}

theme.loadSyntax = function()
	-- Syntax highlight groups
	local syntax = {
		-- Monochrome
		SpecialChar = { fg = matrix.mono_1 }, -- special character in a constant
		Comment = { fg = matrix.mono_3, style = "italic" }, -- comments
		Ignore = { fg = matrix.mono_4 }, -- left blank, hidden
		Conceal = { fg = matrix.none, bg = matrix.mono_5 },

		-- Red
		Error = { fg = matrix.red, style = "bold,underline" }, -- any erroneous construct

		-- Amber
		Todo = { fg = matrix.amber, style = "bold,italic" }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- Turquoise
		PreProc = { fg = matrix.turquoise_2 }, -- generic preprocessor
		PreCondit = { fg = matrix.turquoise_2 }, -- preprocessor #if, #else, #endif, etc.
		Include = { fg = matrix.turquoise_2 }, -- preprocessor #include
		Define = { fg = matrix.turquoise_2 }, -- preprocessor #define
		Macro = { fg = matrix.turquoise_2 }, -- same as Define

		-- Green
		Type = { fg = matrix.green_1, style = "bold" }, -- int, long, char, etc.
		Typedef = { fg = matrix.green_1, style = "bold" }, -- a typedef
		Structure = { fg = matrix.green_1, style = "bold" }, -- struct, union, enum, etc.
		Function = { fg = matrix.green_1, style = "italic" }, -- any function name
		Keyword = { fg = matrix.green_1, style = "bold" }, -- for, do, while, etc.
		Statement = { fg = matrix.green_1, style = "bold" }, -- any statement
		Conditional = { fg = matrix.green_1, style = "bold" }, -- if, then, else, endif, switch, etc.
		Repeat = { fg = matrix.green_1, style = "bold" }, -- any other keyword
		Label = { fg = matrix.green_1, style = "bold" }, -- case, default, etc.
		Exception = { fg = matrix.green_1, style = "bold" }, -- try, catch, throw
		StorageClass = { fg = matrix.green_1, style = "bold" }, -- static, register, volatile, etc.
		Identifier = { fg = matrix.green_1 }, -- any variable name
		String = { fg = matrix.green_1, style = "italic" }, -- any string
		Character = { fg = matrix.green_1, style = "italic" }, -- any character constant: 'c', '\n'
		Float = { fg = matrix.green_1, style = "italic" }, -- a floating point constant: 2.3e10
		Number = { fg = matrix.green_1, style = "italic" }, -- a number constant: 5
		Boolean = { fg = matrix.green_1, style = "italic" }, -- a boolean constant: TRUE, false
		Constant = { fg = matrix.green_1, style = "italic" }, -- any constant
		Delimiter = { fg = matrix.green_2, style = "bold" }, -- character that needs attention like , or .
		Special = { fg = matrix.green_1 }, -- any special symbol
		Operator = { fg = matrix.green_2 }, -- sizeof, "+", "*", etc.

		-- Turquoise
		Underlined = { fg = matrix.turquoise_1, style = "underline" }, -- text that stands out, HTML links
		SpecialComment = { fg = matrix.turquoise_2 }, -- special things inside a comment
		Debug = { fg = matrix.turquoise_3 }, -- debugging statements
		Tag = { fg = matrix.turquoise_3 }, -- you can use CTRL-] on this

		htmlLink = { fg = matrix.turquoise_1, style = "underline" },

		htmlH1 = { fg = matrix.turquoise_1, style = "bold" },
		htmlH2 = { fg = matrix.turquoise_1 },
		htmlH3 = { fg = matrix.turquoise_1, style = "italic" },
		htmlH4 = { fg = matrix.turquoise_3, style = "bold" },
		htmlH5 = { fg = matrix.turquoise_3 },
		htmlH6 = { fg = matrix.turquoise_3, style = "italic" },

		markdownH1 = { fg = matrix.turquoise_1, style = "bold" },
		markdownH2 = { fg = matrix.turquoise_1 },
		markdownH3 = { fg = matrix.turquoise_1, style = "italic" },
		markdownH4 = { fg = matrix.turquoise_3, style = "bold" },
		markdownH5 = { fg = matrix.turquoise_3 },
		markdownH6 = { fg = matrix.turquoise_3, style = "italic" },

		markdownH1Delimiter = { fg = matrix.turquoise_1, style = "bold" },
		markdownH2Delimiter = { fg = matrix.turquoise_1 },
		markdownH3Delimiter = { fg = matrix.turquoise_1, style = "italic" },
		markdownH4Delimiter = { fg = matrix.turquoise_3, style = "bold" },
		markdownH5Delimiter = { fg = matrix.turquoise_3 },
		markdownH6Delimiter = { fg = matrix.turquoise_3, style = "italic" },
	}
	return syntax
end

theme.loadEditor = function()
	-- Editor highlight groups

	local editor = {
		-- Folding
		Folded = { fg = matrix.mono_4, style = "italic" },
		FoldColumn = { fg = matrix.mono_4 },

		-- Floating
		NormalFloat = { fg = matrix.green_1, bg = matrix.green_6 },
		FloatBorder = { fg = matrix.green_1, bg = matrix.green_6 },

		-- Errors
		ErrorMsg = { fg = matrix.red },

		-- Warnings
		Warnings = { fg = matrix.amber },
		WarningMsg = { fg = matrix.amber },

		-- Health
		healthError = { fg = matrix.red },
		healthWarning = { fg = matrix.amber },
		healthSuccess = { fg = matrix.green_1 },

		-- Dashboard
		DashboardShortCut = { fg = matrix.green_2 },
		DashboardHeader = { fg = matrix.green_6 },
		DashboardCenter = { fg = matrix.green_2 },
		DashboardFooter = { fg = matrix.turquoise_2, style = "italic" },

        -- Cursor
		Cursor = { fg = matrix.green_1, style = "reverse" }, -- the character under the cursor
		CursorIM = { fg = matrix.green_1, style = "reverse" }, -- like Cursor, but used when in IME mode
		CursorLineNr = { fg = matrix.none, bg = matrix.none },
		CursorColumn = { fg = matrix.none, bg = matrix.none },
		CursorLine = { fg = matrix.none, bg = matrix.none },

		-- BufferLine
		BufferLineIndicatorSelected = { fg = matrix.mono_5 },
		BufferLineFill = { bg = matrix.mono_5 },

        -- Tabs
		TabLineFill = { fg = matrix.green_1, bg = matrix.none },
		TablineSel = { fg = matrix.green_1, bg = matrix.green_6 },
		Tabline = { fg = matrix.green_1, bg = matrix.green_6 },

        -- Search
		MatchParen = { fg = matrix.amber, style = "bold" },
		IncSearch = { fg = matrix.mono_5, bg = matrix.red },
		Search = { fg = matrix.mono_5, bg = matrix.amber,},

        -- Visual Mode
		Visual = { fg = matrix.none, bg = matrix.mono_4 },
		VisualNOS = { fg = matrix.none, bg = matrix.mono_4 },

		Directory = { fg = matrix.green_2, bg = matrix.none }, -- directory names (and other special names in listings)
		ModeMsg = { fg = matrix.green_6 },
		MoreMsg = { fg = matrix.green_6 },
		Pmenu = { fg = matrix.green_6, bg = matrix.green_1 },
		PmenuSel = { fg = matrix.green_6, bg = matrix.red },
		PmenuSbar = { fg = matrix.green_6, bg = matrix.green_1 },
		PmenuThumb = { fg = matrix.green_6, bg = matrix.green_6 },
		QuickFixLine = { fg = matrix.green_6, style = "reverse" },
		qfLineNr = { fg = matrix.green_6, style = "reverse" },
		SpecialKey = { fg = matrix.green_6 },
		StatusLine = { fg = matrix.green_6, bg = matrix.green_1 },
		StatusLineNC = { fg = matrix.green_6, bg = matrix.mono_4 },
		StatusLineTerm = { fg = matrix.green_6, bg = matrix.green_1 },
		StatusLineTermNC = { fg = matrix.green_6, bg = matrix.mono_4 },
		ToolbarLine = { fg = matrix.green_6, bg = matrix.mono_4 },
		ToolbarButton = { fg = matrix.green_6, style = "bold" },
		NormalMode = { fg = matrix.green_6, style = "reverse" },
		InsertMode = { fg = matrix.turquoise_2, style = "reverse" },
		ReplaceMode = { fg = matrix.turquoise_3, style = "reverse" },
		VisualMode = { fg = matrix.green_6, style = "reverse" },
		CommandMode = { fg = matrix.green_6, style = "reverse" },
		Title = { fg = matrix.turquoise_2, style = "bold" },
		Question = { fg = matrix.turquoise_2 },
		SpellBad = { fg = matrix.turquoise_3, style = "italic,undercurl" },
		SpellCap = { fg = matrix.green_2, style = "italic,undercurl" },
		SpellLocal = { fg = matrix.green_2, style = "italic,undercurl" },
		SpellRare = { fg = matrix.green_6, style = "italic,undercurl" },
		WildMenu = { fg = matrix.mono_2, style = "bold" },
		EndOfBuffer = { fg = matrix.mono_4 },
		LineNr = { fg = matrix.mono_4 },
		NonText = { fg = matrix.mono_4 },
	}

	editor.Normal = { fg = matrix.green_1, bg = matrix.none }
	editor.SignColumn = { fg = matrix.green_1, bg = matrix.none }

	editor.VertSplit = { fg = matrix.green_1 }
	return editor
end

theme.loadTerminal = function()
	vim.g.terminal_color_0 = matrix.green_2
	vim.g.terminal_color_1 = matrix.green_2
	vim.g.terminal_color_2 = matrix.green_2
	vim.g.terminal_color_3 = matrix.green_2
	vim.g.terminal_color_4 = matrix.green_1
	vim.g.terminal_color_5 = matrix.green_1
	vim.g.terminal_color_6 = matrix.green_1
	vim.g.terminal_color_7 = matrix.green_1
	vim.g.terminal_color_8 = matrix.green_2
	vim.g.terminal_color_9 = matrix.green_2
	vim.g.terminal_color_10 = matrix.green_2
	vim.g.terminal_color_11 = matrix.green_2
	vim.g.terminal_color_12 = matrix.green_1
	vim.g.terminal_color_13 = matrix.green_1
	vim.g.terminal_color_14 = matrix.green_1
	vim.g.terminal_color_15 = matrix.green_1
end

theme.loadTreeSitter = function()
	-- TreeSitter highlight groups using modern capture-based names
	-- ("@keyword", "@string", ...). Colours follow the documented syntax
	-- roles in README.md, mirroring loadSyntax:
	--   pre-processors=turquoise_2,
	--   headings: 1=turquoise_1 bold, 2=turquoise_1, 3=turquoise_1 italic,
	--   4=turquoise_3 bold, 5=turquoise_3, 6=turquoise_3 italic,
	--   types=green_1 bold, functions=green_1 italic, namespaces=green_1,
	--   keywords=green_2 bold, values=green_2 italic (special chars=mono_1),
	--   variables=green_2, fields=green_3 italic, delimiters=green_3 bold,
	--   operators=green_3, comments=mono_3, errors=red.
	local treesitter = {
		-- Monochrome
		["@comment"] = { fg = matrix.mono_3, style = "italic" }, -- comments

		-- Red
		["@error"] = { fg = matrix.red }, -- For syntax/parser errors.

		-- Amber
		-- (none: amber is for warnings/todo, not syntax)

		-- Turquoise (pre-processors and headings)
		["@preproc"] = { fg = matrix.turquoise_2 }, -- pre-processor directives
		["@keyword.directive"] = { fg = matrix.turquoise_2 }, -- modern pre-processor capture
		["@attribute"] = { fg = matrix.turquoise_2 }, -- attributes/annotations (pre-processor / macro)
		["@constant.macro"] = { fg = matrix.turquoise_2 }, -- macro constants
		["@function.macro"] = { fg = matrix.turquoise_2 }, -- function-like macros
		["@markup.heading.1"] = { fg = matrix.turquoise_1, style = "bold" }, -- headings
		["@markup.heading.2"] = { fg = matrix.turquoise_1 },
		["@markup.heading.3"] = { fg = matrix.turquoise_1, style = "italic" },
		["@markup.heading.4"] = { fg = matrix.turquoise_3, style = "bold" },
		["@markup.heading.5"] = { fg = matrix.turquoise_3 },
		["@markup.heading.6"] = { fg = matrix.turquoise_3, style = "italic" },
		["@markup.heading"] = { fg = matrix.turquoise_1, style = "bold" }, -- unnumbered headings fallback
		["@markup.link"] = { fg = matrix.turquoise_1 },
		["@markup.underline"] = { fg = matrix.turquoise_1, style = "underline" },
		["@markup.link.url"] = { fg = matrix.turquoise_2 }, -- highlighted links
		["@tag"] = { fg = matrix.turquoise_3 }, -- tags
		["@tag.delimiter"] = { fg = matrix.turquoise_3 },

		-- Green
		["@type"] = { fg = matrix.green_1, style = "bold" }, -- types
		["@type.builtin"] = { fg = matrix.green_1, style = "bold" },
		["@constructor"] = { fg = matrix.green_1, style = "bold" }, -- structs
		["@function"] = { fg = matrix.green_1, style = "italic" }, -- functions
		["@function.builtin"] = { fg = matrix.green_1, style = "italic" },
		["@function.method"] = { fg = matrix.green_1, style = "italic" },
		["@keyword"] = { fg = matrix.green_1, style = "bold" }, -- keywords
		["@keyword.function"] = { fg = matrix.green_1, style = "bold" },
		["@keyword.return"] = { fg = matrix.green_1, style = "bold" },
		["@keyword.import"] = { fg = matrix.green_1, style = "bold" },
		["@keyword.repeat"] = { fg = matrix.green_1, style = "bold" },
		["@keyword.exception"] = { fg = matrix.green_1, style = "bold" },
		["@keyword.conditional"] = { fg = matrix.green_1, style = "bold" }, -- conditionals
		["@label"] = { fg = matrix.green_1, style = "bold" },
		["@variable"] = { fg = matrix.green_1 }, -- variables
		["@variable.builtin"] = { fg = matrix.green_1 }, -- self, this, etc.
		["@variable.parameter"] = { fg = matrix.green_1 }, -- parameters
		["@module"] = { fg = matrix.green_1 }, -- namespaces/modules
		["@variable.member"] = { fg = matrix.green_2, style = "italic" }, -- fields
		["@property"] = { fg = matrix.green_2, style = "italic" }, -- fields
		["@string.special.symbol"] = { fg = matrix.green_1 }, -- identifiers referring to symbols or atoms
		["@string"] = { fg = matrix.green_1, style = "italic" }, -- values
		["@character"] = { fg = matrix.green_1, style = "italic" },
		["@string.regexp"] = { fg = matrix.green_1, style = "italic" },
		["@string.escape"] = { fg = matrix.mono_1 }, -- special chars in values
		["@string.special"] = { fg = matrix.mono_1 }, -- special chars in values
		["@character.special"] = { fg = matrix.mono_1 }, -- special chars in values
		["@number"] = { fg = matrix.green_1, style = "italic" },
		["@number.float"] = { fg = matrix.green_1, style = "italic" },
		["@boolean"] = { fg = matrix.green_1, style = "italic" },
		["@constant"] = { fg = matrix.green_1, style = "italic" }, -- constants
		["@constant.builtin"] = { fg = matrix.green_1, style = "italic" },
		["@punctuation.delimiter"] = { fg = matrix.green_2, style = "bold" }, -- delimiters
		["@punctuation.bracket"] = { fg = matrix.green_2, style = "bold" }, -- delimiters
		["@punctuation.special"] = { fg = matrix.green_2, style = "bold" }, -- delimiters
		["@operator"] = { fg = matrix.green_2 }, -- operators
		["@keyword.operator"] = { fg = matrix.green_2 }, -- sizeof and friends

		-- Default colour for anything not otherwise specified
		["@markup"] = { fg = matrix.green_1 },
		["@markup.raw"] = { fg = matrix.green_1 },
	}

	return treesitter
end

theme.loadLSP = function()
	-- Lsp highlight groups
	local lsp = {
		-- Monochrome

		-- Red / Amber / Green / Turquoise grouped for clarity

		-- Red (errors)
		LspDiagnosticsDefaultError = { fg = matrix.red }, -- used for "Error" diagnostic virtual text
		LspDiagnosticsSignError = { fg = matrix.red }, -- used for "Error" diagnostic signs in sign column
		LspDiagnosticsFloatingError = { fg = matrix.red }, -- used for "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextError = { fg = matrix.red }, -- Virtual text "Error"
		LspDiagnosticsUnderlineError = { style = "underline", sp = matrix.red }, -- used to underline "Error" diagnostics.

		-- Amber (warnings)
		LspDiagnosticsDefaultWarning = { fg = matrix.amber }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsSignWarning = { fg = matrix.amber }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsFloatingWarning = { fg = matrix.amber }, -- used for "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextWarning = { fg = matrix.amber }, -- Virtual text "Warning"
		LspDiagnosticsUnderlineWarning = { style = "underline", sp = matrix.amber }, -- used to underline "Warning" diagnostics.

		-- Turquoise (information)
		LspDiagnosticsDefaultInformation = { fg = matrix.turquoise_2 }, -- used for "Information" diagnostic virtual text
		LspDiagnosticsSignInformation = { fg = matrix.turquoise_2 }, -- used for "Information" diagnostic signs in sign column
		LspDiagnosticsFloatingInformation = { fg = matrix.turquoise_2 }, -- used for "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextInformation = { fg = matrix.turquoise_2 }, -- Virtual text "Information"
		LspDiagnosticsUnderlineInformation = { style = "underline", sp = matrix.turquoise_2 }, -- used to underline "Information" diagnostics.

		-- Green (hints / references)
		LspDiagnosticsDefaultHint = { fg = matrix.green_6 }, -- used for "Hint" diagnostic virtual text
		LspDiagnosticsSignHint = { fg = matrix.green_6 }, -- used for "Hint" diagnostic signs in sign column
		LspDiagnosticsFloatingHint = { fg = matrix.green_6 }, -- used for "Hint" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextHint = { fg = matrix.green_6 }, -- Virtual text "Hint"
		LspDiagnosticsUnderlineHint = { style = "underline", sp = matrix.green_6 }, -- used to underline "Hint" diagnostics.
		LspReferenceText = { fg = matrix.green_6, bg = matrix.mono_4 }, -- used for highlighting "text" references
		LspReferenceRead = { fg = matrix.green_6, bg = matrix.mono_4 }, -- used for highlighting "read" references
		LspReferenceWrite = { fg = matrix.green_6, bg = matrix.mono_4 }, -- used for highlighting "write" references

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
		diffIndexLine = { fg = matrix.green_6 },
		diffFile = { fg = matrix.green_2 },
		diffLine = { fg = matrix.green_6 },
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
		TelescopePromptBorder = { fg = matrix.green_2 },
		TelescopeResultsBorder = { fg = matrix.green_6 },
		TelescopePreviewBorder = { fg = matrix.turquoise_2 },
		TelescopeSelectionCaret = { fg = matrix.green_6 },
		TelescopeSelection = { fg = matrix.green_6 },
		TelescopeMatching = { fg = matrix.green_2 },

		-- Cmp
		CmpItemKind = { fg = matrix.turquoise_1 },
		CmpItemAbbrMatch = { fg = matrix.green_4, style = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = matrix.green_4, style = "bold" },
		CmpItemAbbr = { fg = matrix.green_6 },
		CmpItemMenu = { fg = matrix.turquoise_2 },

		-- Indent Blankline
		IblIndent = { fg = matrix.green_2 },
		IblScope = { fg = matrix.green_1 },
	}

	return plugins
end

return theme
