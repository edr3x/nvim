return {
    "folke/snacks.nvim",
    dependencies = {
        {
            "folke/persistence.nvim",
            event = "BufReadPre",
            opts = {},
        },
    },
    priority = 1000,
    lazy = false,
    keys = {
        { "<leader>ntt", "<cmd>lua Snacks.explorer()<CR>", desc = "File Explorer" },
        { "<leader>bd", "<cmd>lua Snacks.bufdelete()<CR>", desc = "Delete buffer" },
        { "<leader>ff", "<cmd>lua Snacks.picker.files()<CR>", desc = "Find all files" },
        { "<leader>gs", "<cmd>lua Snacks.picker.git_status()<CR>", desc = "Git status" },
        { "<leader>fr", "<cmd>lua Snacks.picker.resume()<CR>", desc = "Resume last search" },
        { "<leader>fb", "<cmd>lua Snacks.picker.buffers()<CR>", desc = "List Opened Buffers" },
        { "<leader>fs", "<cmd>lua Snacks.picker.lsp_symbols() <CR>", desc = "List lsp symbols" },
        { "<leader>ba", "<cmd>lua Snacks.bufdelete.other()<CR>", desc = "Delete all other buffer" },
    },
    opts = {
        input = { enabled = true },
        image = { enabled = false },
        bigfile = { enabled = true },
        indent = require("r3x.plugins.snacks.indent"),
        picker = require("r3x.plugins.snacks.picker"),
        dashboard = require("r3x.plugins.snacks.dashboard"),
    },
}
