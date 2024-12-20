return {
    "folke/which-key.nvim",
    event = "BufReadPre",
    config = function()
        -- disable hints for certain operators
        local presets = require("which-key.plugins.presets")
        presets.operators["v"] = nil
        presets.operators["c"] = nil
        presets.operators["d"] = nil
        presets.operators["y"] = nil

        local wk = require("which-key")

        wk.setup({})

        wk.add({
            { "<leader>1", hidden = true },
            { "<leader>2", hidden = true },
            { "<leader>3", hidden = true },
            { "<leader>4", hidden = true },
            { "<leader>5", hidden = true },
            { "<leader>b", group = "Buffer" },
            { "<leader>c", group = "Code Actions" },
            { "<leader>d", group = "LSP diganostics" },
            { "<leader>f", group = "Telescope" },
            { "<leader>g", group = "Git" },
            { "<leader>l", group = "LSP" },
            { "<leader>m", group = "Markdown" },
            { "<leader>s", group = "Search and replace current highlight" },
        })
    end,
}
