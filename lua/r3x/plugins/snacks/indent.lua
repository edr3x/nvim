return {
    priority = 1,
    enabled = true,
    scope = { char = "┊" },
    indent = { char = "┊" },
    animate = { enabled = false },
    filter = function(_)
        return vim.bo.filetype == "yaml"
    end,
}
