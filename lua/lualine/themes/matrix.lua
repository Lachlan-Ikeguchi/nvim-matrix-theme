local colors = require("matrix.colors")

local matrix = {}

matrix.normal = {
	a = { fg = colors.matrix_green_3, bg = colors.matrix_green_6, gui = "bold" },
	b = { fg = colors.matrix_green_2, bg = colors.matrix_green_7 },
	c = { fg = colors.matrix_green_1, bg = colors.matrix_green_8 },
}

matrix.insert = {
	a = { fg = colors.matrix_green_3, bg = colors.matrix_turquoise_1, gui = "bold" },
	b = { fg = colors.matrix_green_2, bg = colors.matrix_green_7 },
	c = { fg = colors.matrix_green_1, bg = colors.matrix_green_8 },
}

matrix.visual = {
	a = { fg = colors.matrix_green_3, bg = colors.matrix_light_2, gui = "bold" },
	b = { fg = colors.matrix_green_2, bg = colors.matrix_green_7 },
	c = { fg = colors.matrix_green_1, bg = colors.matrix_green_8 },
}

matrix.replace = {
	a = { fg = colors.matrix_green_3, bg = colors.matrix_amber, gui = "bold" },
	b = { fg = colors.matrix_green_2, bg = colors.matrix_green_7 },
	c = { fg = colors.matrix_green_1, bg = colors.matrix_green_8 },
}

matrix.command = {
	a = { fg = colors.matrix_green_3, bg = colors.matrix_red, gui = "bold" },
	b = { fg = colors.matrix_green_2, bg = colors.matrix_green_7 },
	c = { fg = colors.matrix_green_1, bg = colors.matrix_green_8 },
}

matrix.inactive = {
	a = { fg = colors.matrix_green_3, bg = colors.matrix_green_6, gui = "bold" },
	b = { fg = colors.matrix_green_2, bg = colors.matrix_green_7 },
	c = { fg = colors.matrix_green_1, bg = colors.matrix_green_8 },
}

return matrix
