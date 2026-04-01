vim.pack.add({ "gh:lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
    preview_config = { border = "rounded" },
    signs = {
        add = { text = " +" },
        change = { text = " " },
        delete = { text = " " },
        untracked = { text = "┆" },
        topdelete = { text = " " },
        changedelete = { text = " " },
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local vmap = function(keys, func, desc)
            if desc then
                desc = "Git: " .. desc
            end
            local opts = { buffer = bufnr, noremap = true, silent = true, desc = desc }
            vim.keymap.set("v", keys, func, opts)
        end

        vmap("gs", function()
            gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Stage Selected")

        vmap("gz", function()
            gs.undo_stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Undo Staged")

        vmap("gr", function()
            gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, "Reset Selected")
    end,
})

vim.keymap.set("n", "gn", "<cmd>Gitsigns next_hunk<CR>")
vim.keymap.set("n", "gN", "<cmd>Gitsigns prev_hunk<CR>")
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>")
vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns toggle_deleted<CR>")
vim.keymap.set("n", "<leader>gw", "<cmd>Gitsigns toggle_word_diff<CR>")
vim.keymap.set("n", "<leader>go", "<cmd>Gitsigns<CR>", { desc = "Git Options" })
vim.keymap.set("n", "<leader>gl", "<cmd>Gitsigns toggle_current_line_blame<CR>")
