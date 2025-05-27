return {
    priority = 1,
    enabled = true,
    scope = { char = "┊" },
    indent = { char = "┊" },
    animate = { enabled = false },
    filter = function(buf)
        return vim.g.snacks_indent ~= false
            and vim.b[buf].snacks_indent ~= false
            and vim.bo[buf].buftype == ""
            and vim.bo.filetype == "yaml"
    end,
}
