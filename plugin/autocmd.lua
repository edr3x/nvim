vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({
            higroup = "IncSearch", -- see `:highlight` for more options
            timeout = 200,
        })
    end,
})

vim.cmd([[autocmd FileType * set formatoptions-=ro]])

-- remove empty lines from end of the file
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        local last_line = vim.fn.line("$")
        while last_line > 1 and vim.fn.getline(last_line):match("^%s*$") do
            vim.api.nvim_buf_set_lines(0, last_line - 1, last_line, false, {})
            last_line = last_line - 1
        end
    end,
})
