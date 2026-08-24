vim.pack.add({
    "gh:OXY2DEV/markview.nvim",
})

vim.api.nvim_set_keymap("n", "<leader>md", "<CMD>Markview<CR>", { desc = "Toggle `markview` globally" })
