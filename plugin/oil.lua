vim.pack.add({
    "gh:stevearc/oil.nvim",
    "gh:nvim-tree/nvim-web-devicons",
})

require("oil").setup({
    delete_to_trash = true,
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    view_options = { show_hidden = true },
    keymaps = {
        ["<C-s>"] = false,
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<A-d>"] = "actions.close",
        ["<A-w>"] = "actions.preview",
        ["<C-x>"] = "actions.select_split",
        ["<C-|>"] = "actions.select_vsplit",
    },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.api.nvim_create_user_command("E", "Oil", { desc = "Open Oil instead of NetRW" })
