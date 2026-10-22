local colors = require("matrix.colors")

local matrix = {}

matrix.normal = {
	a = { fg = colors.green_1, bg = colors.green_4, gui = "bold" },
	b = { fg = colors.green_2, bg = colors.green_5 },
	c = { fg = colors.green_3, bg = colors.green_6 },
}

matrix.insert = {
	a = { fg = colors.mono_5, bg = colors.turquoise_3, gui = "bold" },
	b = { fg = colors.green_2, bg = colors.green_5 },
	c = { fg = colors.green_3, bg = colors.green_6 },
}

matrix.visual = {
	a = { fg = colors.mono_5, bg = colors.mono_2, gui = "bold" },
	b = { fg = colors.green_2, bg = colors.green_5 },
	c = { fg = colors.green_3, bg = colors.green_6 },
}

matrix.replace = {
	a = { fg = colors.mono_5, bg = colors.amber, gui = "bold" },
	b = { fg = colors.green_2, bg = colors.green_5 },
	c = { fg = colors.green_3, bg = colors.green_6 },
}

matrix.command = {
	a = { fg = colors.mono_5, bg = colors.red, gui = "bold" },
	b = { fg = colors.green_2, bg = colors.green_5 },
	c = { fg = colors.green_3, bg = colors.green_6 },
}

matrix.inactive = {
	a = { fg = colors.green_1, bg = colors.green_4, gui = "bold" },
	b = { fg = colors.green_2, bg = colors.green_5 },
	c = { fg = colors.green_3, bg = colors.green_6 },
}

return matrix
