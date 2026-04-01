vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({
            higroup = "IncSearch", -- see `:highlight` for more options
            timeout = 200,
        })
    end,
})

vim.cmd([[autocmd FileType * set formatoptions-=ro]])
