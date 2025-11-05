local colors = require("matrix.colors")

local matrix = {}

matrix.normal = {
	a = { fg = colors.matrix_dark_2, bg = colors.matrix_amber },
	b = { fg = colors.matrix_green_2, bg = colors.matrix_green_6 },
	c = { fg = colors.matrix_green_1, bg = colors.matrix_dark_2 },
}

matrix.insert = {
	a = { fg = colors.matrix_dark_2, bg = colors.matrix_green_1 },
	b = { fg = colors.matrix_green_3, bg = colors.matrix_gray },
}

matrix.visual = {
	a = { fg = colors.matrix_dark_1, bg = colors.matrix_amber },
	b = { fg = colors.matrix_green_1, bg = colors.matrix_red },
}

matrix.replace = {
	a = { fg = colors.matrix_dark_1, bg = colors.matrix_turquoise_1 },
	b = { fg = colors.matrix_green_1, bg = colors.matrix_red },
}

matrix.command = {
	a = { fg = colors.matrix_dark_1, bg = colors.matrix_turquoise_3, gui = "bold" },
	b = { fg = colors.matrix_green_1, bg = colors.matrix_red },
}

matrix.inactive = {
	a = { fg = colors.matrix_green_1, bg = colors.matrix_dark_1, gui = "bold" },
	b = { fg = colors.matrix_green_1, bg = colors.matrix_dark_1 },
	c = { fg = colors.matrix_green_1, bg = colors.matrix_dark_2 },
}

return matrix
