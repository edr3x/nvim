return {
    "edr3x/barbecue.nvim",
    event = "LspAttach",
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
        kinds = require("utils.kinds").icons,
    },
}
