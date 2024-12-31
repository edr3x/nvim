return {
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git" },
    },
    -- {
    --     "github/copilot.vim",
    -- },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
        },
    },
    {
        "stevearc/dressing.nvim",
        event = "BufReadPre",
        config = true,
    },
}
