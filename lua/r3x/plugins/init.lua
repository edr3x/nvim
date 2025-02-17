return {
    {
        "tpope/vim-fugitive",
        cmd = { "G", "Git" },
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
