local colors = require("matrix.colors")

local matrix = {}

matrix.normal = {
	a = { fg = colors.green_1, bg = colors.green_6, gui = "bold" },
	b = { fg = colors.green_2, bg = colors.green_7 },
	c = { fg = colors.green_3, bg = colors.green_8 },
}

matrix.insert = {
	a = { fg = colors.green_1, bg = colors.turquoise_3, gui = "bold" },
	b = { fg = colors.green_2, bg = colors.green_7 },
	c = { fg = colors.green_3, bg = colors.green_8 },
}

matrix.visual = {
	a = { fg = colors.green_1, bg = colors.mono_2, gui = "bold" },
	b = { fg = colors.green_2, bg = colors.green_7 },
	c = { fg = colors.green_3, bg = colors.green_8 },
}

matrix.replace = {
	a = { fg = colors.green_1, bg = colors.amber, gui = "bold" },
	b = { fg = colors.green_2, bg = colors.green_7 },
	c = { fg = colors.green_3, bg = colors.green_8 },
}

matrix.command = {
	a = { fg = colors.mono_5, bg = colors.red, gui = "bold" },
	b = { fg = colors.green_2, bg = colors.green_7 },
	c = { fg = colors.green_3, bg = colors.green_8 },
}

matrix.inactive = {
	a = { fg = colors.green_1, bg = colors.green_6, gui = "bold" },
	b = { fg = colors.green_2, bg = colors.green_7 },
	c = { fg = colors.green_3, bg = colors.green_8 },
}

return matrix
