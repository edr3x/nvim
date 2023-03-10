return {
    {
        'tpope/vim-commentary',
        event = "BufReadPre",
    },
    {
        'github/copilot.vim',
        event = "InsertEnter",
    },
    {
        'andweeb/presence.nvim',
        event = "BufReadPre",
    },
    {
        "folke/persistence.nvim",
        lazy = false,
        opts = {},
    },
    {
        'mbbill/undotree',
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
        },
    },
    {
        'tpope/vim-fugitive',
        cmd = { 'G', 'Git' },
    },
    {
        'ThePrimeagen/vim-be-good',
        cmd = "VimBeGood",
    },
    {
        'Eandrju/cellular-automaton.nvim',
        cmd = "CellularAutomaton",
    },
    {
        'ggandor/leap.nvim',
        cmd = "Leap",
        config = function()
            require("leap").add_default_mappings()
        end
    }
}
