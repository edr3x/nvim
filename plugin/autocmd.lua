vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank({
            higroup = "IncSearch", -- see `:highlight` for more options
            timeout = 200,
        })
    end,
})

vim.cmd([[autocmd FileType * set formatoptions-=ro]])

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = "*",
    callback = function()
        if vim.bo.filetype == "yaml" or vim.bo.filetype == "yaml.helm-values" then
            require("snacks").indent.enable()
            return
        end
        require("snacks").indent.disable()
    end,
})
