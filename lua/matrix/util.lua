local util = {}
local matrix = require("matrix.theme")

-- Go trough the table and highlight the group with the colour values
util.highlight = function(group, colour)
	local style = colour.style and "gui=" .. colour.style or "gui=NONE"
	local fg = colour.fg and "guifg=" .. colour.fg or "guifg=NONE"
	local bg = colour.bg and "guibg=" .. colour.bg or "guibg=NONE"
	local sp = colour.sp and "guisp=" .. colour.sp or ""

	local hl = "highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp

	vim.cmd(hl)
	if colour.link then
		vim.cmd("highlight! link " .. group .. " " .. colour.link)
	end
end

-- Only define matrix if it's the active colourscheme
function util.onColourScheme()
	if vim.g.colors_name ~= "matrix" then
		vim.cmd([[autocmd! matrix]])
		vim.cmd([[augroup! matrix]])
	end
end

-- Change the background for the terminal, packer and qf windows
util.contrast = function()
	vim.cmd([[augroup matrix]])
	vim.cmd([[  autocmd!]])
	vim.cmd([[  autocmd ColorScheme * lua require("matrix.util").onColourScheme()]])
	vim.cmd([[  autocmd TermOpen * setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]])
	vim.cmd([[  autocmd FileType packer setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]])
	vim.cmd([[  autocmd FileType qf setlocal winhighlight=Normal:NormalFloat,SignColumn:NormalFloat]])
	vim.cmd([[augroup end]])
end
-- Loads the colours from the dictionary Object (colourSet)
function util.loadColourSet(colourSet)
	for group, colours in pairs(colourSet) do
		util.highlight(group, colours)
	end
end
-- Load the theme
function util.load()
	-- Set the theme environment
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	-- vim.o.background = "dark"
	vim.o.termguicolors = true
	vim.g.colors_name = "matrix"

	-- load the most importaint parts of the theme
	local editor = matrix.loadEditor()
	local syntax = matrix.loadSyntax()
	local treesitter = matrix.loadTreeSitter()

	-- load editor highlights
	util.loadColourSet(editor)

	-- load syntax highlights
	util.loadColourSet(syntax)

	-- load treesitter highlights
	util.loadColourSet(treesitter)

	matrix.loadTerminal()

	-- imort tables for plugins and lsp
	local plugins = matrix.loadPlugins()
	local lsp = matrix.loadLSP()

	-- load plugin highlights
	util.loadColourSet(plugins)

	-- load lsp highlights
	util.loadColourSet(lsp)

	-- if contrast is enabled, apply it to sidebars and floating windows
	if vim.g.matrix_contrast == true then
		util.contrast()
	end
end

return util
