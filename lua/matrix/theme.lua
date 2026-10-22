local matrix = require("matrix.colors")

local theme = {}

theme.loadSyntax = function()
	-- Syntax highlight groups
	local syntax = {
		-- Comments
		Comment = { fg = matrix.mono_3, style = "italic" }, -- comments
		SpecialComment = { fg = matrix.turquoise_2 }, -- special things inside a comment

		-- Errors
		Error = { fg = matrix.red, style = "bold,italic" }, -- any erroneous construct

		-- Warnings
		Todo = { fg = matrix.amber, style = "bold,italic" }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- Pre-processors
		PreProc = { fg = matrix.turquoise_2 }, -- generic preprocessor
		PreCondit = { fg = matrix.turquoise_2 }, -- preprocessor #if, #else, #endif, etc.
		Include = { fg = matrix.turquoise_2 }, -- preprocessor #include
		Define = { fg = matrix.turquoise_2 }, -- preprocessor #define
		Macro = { fg = matrix.turquoise_2 }, -- same as Define

		-- Headings
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

		-- Links
		Underlined = { fg = matrix.turquoise_1, style = "underline" }, -- text that stands out, HTML links
		htmlLink = { fg = matrix.turquoise_1, style = "underline" },
		Tag = { fg = matrix.turquoise_3 }, -- you can use CTRL-] on this

		-- Types
		Type = { fg = matrix.green_1, style = "bold" }, -- int, long, char, etc.
		Typedef = { fg = matrix.green_1, style = "bold" }, -- a typedef
		Structure = { fg = matrix.green_1, style = "bold" }, -- struct, union, enum, etc.

		-- Functions
		Function = { fg = matrix.green_1, style = "italic" }, -- any function name

		-- Keywords
		Keyword = { fg = matrix.green_2, style = "bold" }, -- for, do, while, etc.
		Statement = { fg = matrix.green_2, style = "bold" }, -- any statement
		Conditional = { fg = matrix.green_2, style = "bold" }, -- if, then, else, endif, switch, etc.
		Repeat = { fg = matrix.green_2, style = "bold" }, -- any other keyword
		Label = { fg = matrix.green_2, style = "bold" }, -- case, default, etc.
		Exception = { fg = matrix.green_2, style = "bold" }, -- try, catch, throw
		StorageClass = { fg = matrix.green_2, style = "bold" }, -- static, register, volatile, etc.

		-- Variables
		Identifier = { fg = matrix.green_2, style = "italic" }, -- any variable name

		-- Values
		String = { fg = matrix.green_3, style = "italic" }, -- any string
		Character = { fg = matrix.green_3, style = "italic" }, -- any character constant: 'c', '\n'
		Float = { fg = matrix.green_3, style = "italic" }, -- a floating point constant: 2.3e10
		Number = { fg = matrix.green_3, style = "italic" }, -- a number constant: 5
		Boolean = { fg = matrix.green_3, style = "italic" }, -- a boolean constant: TRUE, false
		Constant = { fg = matrix.green_3, style = "italic" }, -- any constant

		-- Special Chars
		SpecialChar = { fg = matrix.mono_1 }, -- special character in a constant

		-- Delimiters
		Delimiter = { fg = matrix.green_3, style = "bold" }, -- character that needs attention like , or .

		-- Operators
		Operator = { fg = matrix.green_3 }, -- sizeof, "+", "*", etc.

		-- Special
		Special = { fg = matrix.green_2 }, -- any special symbol

		-- Conceal
		Conceal = { fg = matrix.none, bg = matrix.mono_5 },
		Ignore = { fg = matrix.mono_4 }, -- left blank, hidden

		-- Debug
		Debug = { fg = matrix.turquoise_3 }, -- debugging statements
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
		FloatShadow = { fg = matrix.green_1, bg = matrix.green_5 },
		FloatShadowThrough = { fg = matrix.green_1, bg = matrix.none },

		-- Errors
		ErrorMsg = { fg = matrix.red, style = "bold,italic" },

		-- Warnings
		Warnings = { fg = matrix.amber, style = "bold,italic" },
		WarningMsg = { fg = matrix.amber, style = "bold,italic" },

		-- Health
		healthError = { fg = matrix.red, style = "bold,italic" },
		healthWarning = { fg = matrix.amber, style = "bold,italic" },
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
		TablineSel = { fg = matrix.green_1, bg = matrix.green_5 },
		Tabline = { fg = matrix.green_2, bg = matrix.green_6 },

		-- Search
		MatchParen = { fg = matrix.amber, style = "bold" },
		IncSearch = { fg = matrix.mono_5, bg = matrix.red },
		Search = { fg = matrix.mono_5, bg = matrix.amber },

		-- Visual Mode
		Visual = { fg = matrix.none, bg = matrix.mono_4 },
		VisualNOS = { fg = matrix.none, bg = matrix.mono_4 },

		-- Popup Menu
		PmenuSel = { fg = matrix.green_1, bg = matrix.green_5 },
		Pmenu = { fg = matrix.green_3, bg = matrix.green_6 },
		PmenuSbar = { fg = matrix.green_1, bg = matrix.green_3 },
		PmenuThumb = { fg = matrix.green_2, bg = matrix.green_6 },
		PmenuBorder = { fg = matrix.green_1, bg = matrix.green_6 },
		PmenuShadow = { fg = matrix.green_1, bg = matrix.green_5 },

		-- Status Line
		StatusLine = { fg = matrix.green_6, bg = matrix.green_1 },
		StatusLineNC = { fg = matrix.green_6, bg = matrix.mono_4 },
		StatusLineTerm = { fg = matrix.green_6, bg = matrix.green_1 },
		StatusLineTermNC = { fg = matrix.green_6, bg = matrix.mono_4 },

		-- Messages
		Directory = { fg = matrix.green_2, bg = matrix.none }, -- directory names (and other special names in listings)
		ModeMsg = { fg = matrix.green_6 },
		MoreMsg = { fg = matrix.green_6 },
		Title = { fg = matrix.turquoise_2, style = "bold" },
		Question = { fg = matrix.turquoise_2 },

		-- QuickFix
		QuickFixLine = { fg = matrix.green_6, style = "reverse" },
		qfLineNr = { fg = matrix.green_6, style = "reverse" },

		-- Diff
        diffFile = { fg = matrix.mono_1 },
		diffIndexLine = { fg = matrix.mono_2 },
		diffOldFile = { fg = matrix.red },
		diffNewFile = { fg = matrix.amber },
		diffLine = { fg = matrix.mono_3 },
		diffAdded = { fg = matrix.green_1, style = "bold" },
		diffRemoved = { fg = matrix.red, style = "bold" },
		diffChanged = { fg = matrix.amber, style = "bold" },
		DiffAdd = { fg = matrix.green_1, style = "bold" },
		DiffDelete = { fg = matrix.red, style = "bold" },
		DiffChange = { fg = matrix.amber, style = "bold" },
		DiffText = { fg = matrix.mono_3 },

		-- Special Keys
		SpecialKey = { fg = matrix.green_6 },

		-- Toolbar
		ToolbarLine = { fg = matrix.green_6, bg = matrix.mono_4 },
		ToolbarButton = { fg = matrix.green_6, style = "bold" },

		-- Modes
		NormalMode = { fg = matrix.green_6, style = "reverse" },
		InsertMode = { fg = matrix.turquoise_2, style = "reverse" },
		ReplaceMode = { fg = matrix.turquoise_3, style = "reverse" },
		VisualMode = { fg = matrix.green_6, style = "reverse" },
		CommandMode = { fg = matrix.green_6, style = "reverse" },

		-- Spell
		SpellBad = { fg = matrix.turquoise_3, style = "italic,undercurl" },
		SpellCap = { fg = matrix.green_2, style = "italic,undercurl" },
		SpellLocal = { fg = matrix.green_2, style = "italic,undercurl" },
		SpellRare = { fg = matrix.green_6, style = "italic,undercurl" },

		-- Completion
		WildMenu = { fg = matrix.mono_2, style = "bold" },

		-- Dim
		EndOfBuffer = { fg = matrix.mono_4 },
		LineNr = { fg = matrix.mono_4 },
		NonText = { fg = matrix.mono_4 },
	}

	editor.Normal = { fg = matrix.green_2, bg = matrix.none }
	editor.SignColumn = { fg = matrix.green_2, bg = matrix.none }

	editor.VertSplit = { fg = matrix.green_2 }
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
	--   keywords=green_2 bold, variables=green_2 italic, fields=green_2,
	--   values=green_3 italic (special chars=mono_1), delimiters=green_3 bold,
	--   operators=green_3, comments=mono_3 italic, errors=red bold,italic.
	local treesitter = {
		-- Comments
		["@comment"] = { fg = matrix.mono_3, style = "italic" },

		-- Errors
		["@error"] = { fg = matrix.red, style = "bold,italic" }, -- For syntax/parser errors.

		-- Pre-processors
		["@preproc"] = { fg = matrix.turquoise_2 }, -- pre-processor directives
		["@keyword.directive"] = { fg = matrix.turquoise_2 }, -- modern pre-processor capture
		["@attribute"] = { fg = matrix.turquoise_2 }, -- attributes/annotations (pre-processor / macro)
		["@constant.macro"] = { fg = matrix.turquoise_2 }, -- macro constants
		["@function.macro"] = { fg = matrix.turquoise_2 }, -- function-like macros

		-- Headings
		["@markup.heading.1"] = { fg = matrix.turquoise_1, style = "bold" }, -- headings
		["@markup.heading.2"] = { fg = matrix.turquoise_1 },
		["@markup.heading.3"] = { fg = matrix.turquoise_1, style = "italic" },
		["@markup.heading.4"] = { fg = matrix.turquoise_3, style = "bold" },
		["@markup.heading.5"] = { fg = matrix.turquoise_3 },
		["@markup.heading.6"] = { fg = matrix.turquoise_3, style = "italic" },
		["@markup.heading"] = { fg = matrix.turquoise_1, style = "bold" }, -- unnumbered headings fallback

		-- Links
		["@markup.link"] = { fg = matrix.turquoise_1 },
		["@markup.underline"] = { fg = matrix.turquoise_1, style = "underline" },
		["@markup.link.url"] = { fg = matrix.turquoise_2 }, -- highlighted links
		["@tag"] = { fg = matrix.turquoise_3 }, -- tags
		["@tag.delimiter"] = { fg = matrix.turquoise_3 },

		-- Types
		["@type"] = { fg = matrix.green_1, style = "bold" }, -- types
		["@type.builtin"] = { fg = matrix.green_1, style = "bold" },
		["@constructor"] = { fg = matrix.green_1, style = "bold" }, -- structs

		-- Functions
		["@function"] = { fg = matrix.green_1, style = "italic" }, -- functions
		["@function.builtin"] = { fg = matrix.green_1, style = "italic" },
		["@function.method"] = { fg = matrix.green_1, style = "italic" },

		-- Namespaces
		["@module"] = { fg = matrix.green_1 }, -- namespaces/modules

		-- Keywords
		["@keyword"] = { fg = matrix.green_2, style = "bold" }, -- keywords
		["@keyword.function"] = { fg = matrix.green_2, style = "bold" },
		["@keyword.return"] = { fg = matrix.green_2, style = "bold" },
		["@keyword.import"] = { fg = matrix.green_2, style = "bold" },
		["@keyword.repeat"] = { fg = matrix.green_2, style = "bold" },
		["@keyword.exception"] = { fg = matrix.green_2, style = "bold" },
		["@keyword.conditional"] = { fg = matrix.green_2, style = "bold" }, -- conditionals
		["@label"] = { fg = matrix.green_2, style = "bold" },

		-- Variables
		["@variable"] = { fg = matrix.green_2, style = "italic" }, -- variables
		["@variable.builtin"] = { fg = matrix.green_2, style = "italic" }, -- self, this, etc.
		["@variable.parameter"] = { fg = matrix.green_2, style = "italic" }, -- parameters
		["@string.special.symbol"] = { fg = matrix.green_2 }, -- identifiers referring to symbols or atoms

		-- Fields
		["@variable.member"] = { fg = matrix.green_2 }, -- fields
		["@property"] = { fg = matrix.green_2 }, -- fields

		-- Values
		["@string"] = { fg = matrix.green_3, style = "italic" }, -- values
		["@character"] = { fg = matrix.green_3, style = "italic" },
		["@string.regexp"] = { fg = matrix.green_3, style = "italic" },
		["@number"] = { fg = matrix.green_3, style = "italic" },
		["@number.float"] = { fg = matrix.green_3, style = "italic" },
		["@boolean"] = { fg = matrix.green_3, style = "italic" },
		["@constant"] = { fg = matrix.green_3, style = "italic" }, -- constants
		["@constant.builtin"] = { fg = matrix.green_3, style = "italic" },

		-- Special Chars
		["@string.escape"] = { fg = matrix.mono_1 }, -- special chars in values
		["@string.special"] = { fg = matrix.mono_1 }, -- special chars in values
		["@character.special"] = { fg = matrix.mono_1 }, -- special chars in values

		-- Delimiters
		["@punctuation.delimiter"] = { fg = matrix.green_3, style = "bold" }, -- delimiters
		["@punctuation.bracket"] = { fg = matrix.green_3, style = "bold" }, -- delimiters
		["@punctuation.special"] = { fg = matrix.green_3, style = "bold" }, -- delimiters

		-- Operators
		["@operator"] = { fg = matrix.green_3 }, -- operators
		["@keyword.operator"] = { fg = matrix.green_3 }, -- sizeof and friends

		-- Default colour (normal text) for anything not otherwise specified
		["@markup"] = { fg = matrix.green_2 },
		["@markup.raw"] = { fg = matrix.green_2 },
	}

	return treesitter
end

theme.loadLSP = function()
	-- Lsp highlight groups
	local lsp = {
		-- Errors
		LspDiagnosticsDefaultError = { fg = matrix.red }, -- used for "Error" diagnostic virtual text
		LspDiagnosticsSignError = { fg = matrix.red }, -- used for "Error" diagnostic signs in sign column
		LspDiagnosticsFloatingError = { fg = matrix.red }, -- used for "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextError = { fg = matrix.red }, -- Virtual text "Error"
		LspDiagnosticsUnderlineError = { style = "underline", sp = matrix.red }, -- used to underline "Error" diagnostics.
		DiagnosticError = { link = "LspDiagnosticsDefaultError" },
		DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
		DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
		DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
		DiagnosticSignError = { link = "LspDiagnosticsSignError" },

		-- Warnings
		LspDiagnosticsDefaultWarning = { fg = matrix.amber }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsSignWarning = { fg = matrix.amber }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsFloatingWarning = { fg = matrix.amber }, -- used for "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextWarning = { fg = matrix.amber }, -- Virtual text "Warning"
		LspDiagnosticsUnderlineWarning = { style = "underline", sp = matrix.amber }, -- used to underline "Warning" diagnostics.
		DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
		DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
		DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
		DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
		DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },

		-- Information
		LspDiagnosticsDefaultInformation = { fg = matrix.turquoise_2 }, -- used for "Information" diagnostic virtual text
		LspDiagnosticsSignInformation = { fg = matrix.turquoise_2 }, -- used for "Information" diagnostic signs in sign column
		LspDiagnosticsFloatingInformation = { fg = matrix.turquoise_2 }, -- used for "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextInformation = { fg = matrix.turquoise_2 }, -- Virtual text "Information"
		LspDiagnosticsUnderlineInformation = { style = "underline", sp = matrix.turquoise_2 }, -- used to underline "Information" diagnostics.
		DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
		DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
		DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
		DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
		DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },

		-- Hints
		LspDiagnosticsDefaultHint = { fg = matrix.green_6 }, -- used for "Hint" diagnostic virtual text
		LspDiagnosticsSignHint = { fg = matrix.green_6 }, -- used for "Hint" diagnostic signs in sign column
		LspDiagnosticsFloatingHint = { fg = matrix.green_6 }, -- used for "Hint" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextHint = { fg = matrix.green_6 }, -- Virtual text "Hint"
		LspDiagnosticsUnderlineHint = { style = "underline", sp = matrix.green_6 }, -- used to underline "Hint" diagnostics.
		DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
		DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
		DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
		DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
		DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },

		-- References
		LspReferenceText = { fg = matrix.green_6, bg = matrix.mono_4 }, -- used for highlighting "text" references
		LspReferenceRead = { fg = matrix.green_6, bg = matrix.mono_4 }, -- used for highlighting "read" references
		LspReferenceWrite = { fg = matrix.green_6, bg = matrix.mono_4 }, -- used for highlighting "write" references
	}

	return lsp
end

theme.loadPlugins = function()
	-- Plugins highlight groups
	local plugins = {
		-- GitSigns
		GitSignsAdd = { fg = matrix.green_1 },
		GitSignsAddNr = { fg = matrix.green_1 },
		GitSignsAddLn = { fg = matrix.green_1 },
		GitSignsChange = { fg = matrix.amber },
		GitSignsChangeNr = { fg = matrix.amber },
		GitSignsChangeLn = { fg = matrix.amber },
		GitSignsDelete = { fg = matrix.red },
		GitSignsDeleteNr = { fg = matrix.red },
		GitSignsDeleteLn = { fg = matrix.red },

		-- Telescope
		TelescopePromptBorder = { fg = matrix.green_2 },
		TelescopeResultsBorder = { fg = matrix.green_6 },
		TelescopePreviewBorder = { fg = matrix.turquoise_2 },
		TelescopeSelectionCaret = { fg = matrix.green_6 },
		TelescopeSelection = { fg = matrix.green_6 },
		TelescopeMatching = { fg = matrix.green_2 },

		-- Cmp
		CmpItemKind = { fg = matrix.turquoise_1 },
		CmpItemAbbrMatch = { fg = matrix.green_1, style = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = matrix.green_1, style = "bold" },
		CmpItemAbbr = { fg = matrix.green_3 },
		CmpItemMenu = { fg = matrix.amber },

		-- Indent Blankline
		IblIndent = { fg = matrix.green_5 },
		IblScope = { fg = matrix.green_1 },
	}

	return plugins
end

return theme
