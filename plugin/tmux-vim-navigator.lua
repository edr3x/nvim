vim.pack.add({
    "gh:alexghergh/nvim-tmux-navigation",
})

require("nvim-tmux-navigation").setup({
    disable_when_zoomed = true,
})

vim.keymap.set("n", "<C-h>", function()
    require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
end)

vim.keymap.set("n", "<C-j>", function()
    require("nvim-tmux-navigation").NvimTmuxNavigateDown()
end)

vim.keymap.set("n", "<C-k>", function()
    require("nvim-tmux-navigation").NvimTmuxNavigateUp()
end)

vim.keymap.set("n", "<C-l>", function()
    require("nvim-tmux-navigation").NvimTmuxNavigateRight()
end)
