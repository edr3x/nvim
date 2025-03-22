return {
    "leath-dub/snipe.nvim",
    keys = {
        { "<leader>o", ":lua require('snipe').open_buffer_menu()<cr>", desc = "Open Snipe buffer menu" },
    },
    opts = {
        ui = {
            preselect_current = true,
            text_align = "file-first",
            open_win_override = { border = "rounded" },
        },
    },
}
