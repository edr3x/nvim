return {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
        -- stylua: ignore
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    },
}
