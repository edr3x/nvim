return {
    "leath-dub/snipe.nvim",
    keys = {
        {
            "<leader>o",
            function()
                require("snipe").open_buffer_menu()
            end,
            silent = true,
            desc = "Open Snipe buffer menu",
        },
    },
    opts = {
        ui = {
            preselect_current = true,
            text_align = "file-first",
            open_win_override = { border = "rounded" },
        },
    },
}
