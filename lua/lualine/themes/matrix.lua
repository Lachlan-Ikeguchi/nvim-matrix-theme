local colours = require("matrix.colours")

local matrix = {}

matrix.normal = {
	a = { fg = colours.matrix_dark_1, bg = colours.matrix_amber },
	b = { fg = colours.matrix_green_6, bg = colours.matrix_green_2 },
	c = { fg = colours.matrix_green_7, bg = colours.matrix_dark_1 },
}

matrix.insert = {
	a = { fg = colours.matrix_dark_1, bg = colours.matrix_green_7 },
	b = { fg = colours.matrix_green_5, bg = colours.matrix_gray },
}

matrix.visual = {
	a = { fg = colours.matrix_dark_2, bg = colours.matrix_amber },
	b = { fg = colours.matrix_green_7, bg = colours.matrix_red },
}

matrix.replace = {
	a = { fg = colours.matrix_dark_2, bg = colours.matrix_turquoise_3 },
	b = { fg = colours.matrix_green_7, bg = colours.matrix_red },
}

matrix.command = {
	a = { fg = colours.matrix_dark_2, bg = colours.matrix_turquoise_1, gui = "bold" },
	b = { fg = colours.matrix_green_7, bg = colours.matrix_red },
}

matrix.inactive = {
	a = { fg = colours.matrix_green_7, bg = colours.matrix_dark_2, gui = "bold" },
	b = { fg = colours.matrix_green_7, bg = colours.matrix_dark_2 },
	c = { fg = colours.matrix_green_7, bg = colours.matrix_dark_1 },
}

return matrix
