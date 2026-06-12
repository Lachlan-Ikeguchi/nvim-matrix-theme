local colors = require("matrix.colors")

local matrix = {}

matrix.normal = {
	a = { fg = colors.matrix_dark_1, bg = colors.matrix_amber },
	b = { fg = colors.matrix_green_6, bg = colors.matrix_green_2 },
	c = { fg = colors.matrix_green_7, bg = colors.matrix_dark_1 },
}

matrix.insert = {
	a = { fg = colors.matrix_dark_1, bg = colors.matrix_green_7 },
	b = { fg = colors.matrix_green_5, bg = colors.matrix_gray },
}

matrix.visual = {
	a = { fg = colors.matrix_dark_2, bg = colors.matrix_amber },
	b = { fg = colors.matrix_green_7, bg = colors.matrix_red },
}

matrix.replace = {
	a = { fg = colors.matrix_dark_2, bg = colors.matrix_turquoise_3 },
	b = { fg = colors.matrix_green_7, bg = colors.matrix_red },
}

matrix.command = {
	a = { fg = colors.matrix_dark_2, bg = colors.matrix_turquoise_1, gui = "bold" },
	b = { fg = colors.matrix_green_7, bg = colors.matrix_red },
}

matrix.inactive = {
	a = { fg = colors.matrix_green_7, bg = colors.matrix_dark_2, gui = "bold" },
	b = { fg = colors.matrix_green_7, bg = colors.matrix_dark_2 },
	c = { fg = colors.matrix_green_7, bg = colors.matrix_dark_1 },
}

return matrix
