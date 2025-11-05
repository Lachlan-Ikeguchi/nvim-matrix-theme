local matrix = {
    matrix_dark_1 = "#000000", -- Monochrome: 5 palette gradient from #000000 to #ffffff
    matrix_dark_2 = "#404040",
    matrix_gray = "#808080",
    matrix_light_1 = "#bfbfbf",
    matrix_light_2 = "#ffffff",
    matrix_green_1 = "#006400", -- Green: 7 palette gradient from #006400 to #00ff00
    matrix_green_2 = "#007e00",
    matrix_green_3 = "#009800",
    matrix_green_4 = "#00b200",
    matrix_green_5 = "#00cb00",
    matrix_green_6 = "#00e500",
    matrix_green_7 = "#00ff00",
    matrix_turquoise_1 = "#004040", -- Turquoise: 5 palette gradient from #004040 to #009090
    matrix_turquoise_2 = "#005454",
    matrix_turquoise_3 = "#006868",
    matrix_turquoise_4 = "#007c7c",
    matrix_turquoise_5 = "#009090",
    none = "NONE",
}


-- Enable contrast sidebars, floating windows and popup menus
if vim.g.matrix_contrast then
    matrix.sidebar = matrix.matrix_dark_2
    matrix.float = matrix.matrix_dark_2
else
    matrix.sidebar = matrix.matrix_dark_1
    matrix.float = matrix.matrix_dark_1
end

if vim.g.matrix_cursorline_transparent then
    matrix.cursorlinefg = matrix.matrix_dark_1
else
    matrix.cursorlinefg = matrix.matrix_dark_2
end

return matrix
