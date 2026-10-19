local matrix = {
    -- Monochrome: 5 palette gradient from #ffffff to #000000 
    matrix_light_1 = "#ffffff",
    matrix_light_2 = "#bfbfbf",
    matrix_gray = "#808080",
    matrix_dark_1 = "#404040",
    matrix_dark_2 = "#000000",
    -- Red
    matrix_red = "#ff5050",
    -- Amber
    matrix_amber = "#ffbf00",
    -- Green: 8 palette gradient from #00f000 to #003000
    matrix_green_1 = "#00f000",
    matrix_green_2 = "#00d500",
    matrix_green_3 = "#00b900",
    matrix_green_4 = "#009e00",
    matrix_green_5 = "#008200",
    matrix_green_6 = "#006700",
    matrix_green_7 = "#004b00",
    matrix_green_8 = "#003000",
    -- Turquoise: 3 palette gradient from #00d0d0 to #009090
    matrix_turquoise_1 = "#00d0d0",
    matrix_turquoise_2 = "#00b0b0",
    matrix_turquoise_3 = "#009090",
    none = "NONE",
}


-- Enable contrast sidebars, floating windows and popup menus
if vim.g.matrix_contrast then
    matrix.sidebar = matrix.matrix_dark_1
    matrix.float = matrix.matrix_dark_1
else
    matrix.sidebar = matrix.matrix_dark_2
    matrix.float = matrix.matrix_dark_2
end

if vim.g.matrix_cursorline_transparent then
    matrix.cursorlinefg = matrix.matrix_dark_2
else
    matrix.cursorlinefg = matrix.matrix_dark_1
end

return matrix
