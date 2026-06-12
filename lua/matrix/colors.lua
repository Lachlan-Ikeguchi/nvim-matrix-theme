local matrix = {
    -- Monochrome: 5 palette gradient from #ffffff to #000000 
    matrix_light_1 = "#ffffff", -- variables, special characters
    matrix_light_2 = "#bfbfbf", -- pre-processor / macro
    matrix_gray = "#808080",    -- comments
    matrix_dark_1 = "#404040",
    matrix_dark_2 = "#000000",  -- background
    -- Red
    matrix_red = "#ff0000",     -- error, deleted (git)
    -- Amber
    matrix_amber = "#ffbf00",   -- caution, todo, changed (git)
    -- Green: 7 palette gradient from #00ff00 to #003200 
    matrix_green_1 = "#00ff00", -- values
    matrix_green_2 = "#00dd00", -- delimiters, added (git), default color
    matrix_green_3 = "#00bb00", -- types
    matrix_green_4 = "#009a00", -- structs
    matrix_green_5 = "#007800", -- operators
    matrix_green_6 = "#005600", -- key-word
    matrix_green_7 = "#003200", -- conditional
    -- Turquoise: 3 palette gradient from #009090 to #004040
    -- heading steps
    matrix_turquoise_1 = "#009090", -- constant
    matrix_turquoise_2 = "#006868", -- highlight
    matrix_turquoise_3 = "#004040", -- functions
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
