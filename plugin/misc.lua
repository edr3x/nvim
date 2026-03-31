vim.pack.add({
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/mbbill/undotree",
})

require("which-key").setup({})

vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Undotree" })
