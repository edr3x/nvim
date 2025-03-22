return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "folke/which-key.nvim",
        event = "BufReadPre",
        opts = {},
    },
    {
        "towolf/vim-helm",
        ft = "yaml",
    },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
        },
    },
}
