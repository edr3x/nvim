local M = {}

M.transparent = function()
    local colors = {
        bg = "NONE",
        fg = "#B0BEC5",
        fg2 = "#3e445e",
        orange = "#e78a4e",
        highlight = "#89DDFF",
    }
    return {
        normal = {
            a = { fg = colors.highlight, bg = colors.bg, gui = "bold" },
            b = { fg = colors.orange, bg = colors.bg },
            c = { fg = colors.color2, bg = colors.bg },
        },
        insert = {
            a = { fg = colors.highlight, bg = colors.bg, gui = "bold" },
            b = { fg = colors.orange, bg = colors.bg },
        },
        visual = {
            a = { fg = colors.highlight, bg = colors.bg, gui = "bold" },
            b = { fg = colors.orange, bg = colors.bg },
        },
        replace = {
            a = { fg = colors.highlight, bg = colors.bg, gui = "bold" },
            b = { fg = colors.orange, bg = colors.bg },
        },
        inactive = {
            c = { fg = colors.fg2, bg = colors.bg },
            a = { fg = colors.fg2, bg = colors.bg, gui = "bold" },
            b = { fg = colors.fg2, bg = colors.bg },
        },
    }
end

return M
