local matrix = {
    -- Monochrome: 5 palette gradient from #000000 to #ffffff
    matrix_dark_1 = "#000000",  -- background
    matrix_dark_2 = "#404040",
    matrix_gray = "#808080",    -- comments
    matrix_light_1 = "#bfbfbf",
    matrix_light_2 = "#ffffff", -- variables
    -- Red
    matrix_red = "#ff0000",     -- error, deleted (git)
    -- Amber
    matrix_amber = "#ffbf00",   -- caution, todo, changed (git)
    -- Green: 7 palette gradient from #003200 to #00ff00
    matrix_green_1 = "#003200", -- conditional
    matrix_green_2 = "#005600", -- key-word
    matrix_green_3 = "#007800", -- operators
    matrix_green_4 = "#009a00", -- structs
    matrix_green_5 = "#00bb00", -- types
    matrix_green_6 = "#00dd00", -- delimiters, added (git)
    matrix_green_7 = "#00ff00", -- values
    -- Turquoise: 3 palette gradient from #004040 to #009090
    -- heading steps
    matrix_turquoise_1 = "#004040", -- functions
    matrix_turquoise_2 = "#006868", -- highlight
    matrix_turquoise_3 = "#009090", -- links
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
