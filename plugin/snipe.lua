vim.pack.add({ "https://github.com/leath-dub/snipe.nvim" })

require("snipe").setup({
    ui = {
        preselect_current = true,
        text_align = "file-first",
        open_win_override = { border = "rounded" },
    },
})

vim.keymap.set("n", "<leader>o", function()
    require("snipe").open_buffer_menu()
end, { desc = "Open Snipe buffer menu" })
