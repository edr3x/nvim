return {
    "edr3x/barbecue.nvim",
    event = "BufReadPre",
    dependencies = {
        "SmiteshP/nvim-navic",
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        {
            "<leader>bt",
            function()
                require("barbecue.ui").toggle()
            end,
            desc = "Toggle Barbecue",
        },
    },
    opts = {
        kinds = require("r3x.utils.kinds").icons,
    },
}
