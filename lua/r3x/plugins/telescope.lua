return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    cmd = { "Telescope find_files" },
    keys = {
        { "<leader>fa", "<cmd>Telescope find_files<CR>", desc = "Find sll files" },
        { "<leader>ff", "<cmd>Telescope git_files<CR>", desc = "Find git tracked files" },
        { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Help tags" },
        { "<leader>fr", "<cmd>Telescope resume<CR>", desc = "Resume last search" },
        { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "List Opened Buffers" },
        { "<leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "List buffer diagnostics" },
        { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "Git status" },
        { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Git status" },
        { "<leader>gt", "<cmd>Telescope git_branches<CR>", desc = "Git branches" },
        { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "List lsp symbols" },
        {
            "<leader>fg",
            function()
                require("r3x.extensions.telescope").setup()
            end,
            desc = "Find texts",
        },
    },
    opts = function()
        require("telescope").load_extension("fzf")
        local trouble = require("trouble.sources.telescope")
        local delta = require("telescope.previewers").new_termopen_previewer({
            get_command = function(entry)
                if entry.status == "??" or "A " then
                    return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value }
                end

                return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value .. "^!" }
            end,
        })

        return {
            defaults = {
                file_ignore_patterns = {
                    ".git/",
                    "node_modules",
                    "target",
                    "build",
                    "%.lock$",
                },
                color_devicons = true,
                mappings = {
                    n = {
                        ["dd"] = "delete_buffer",
                        ["<a-t>"] = trouble.open,
                    },
                    i = {
                        ["<a-t>"] = trouble.open,
                    },
                },
                prompt_prefix = "   ",
                initial_mode = "insert",
                selection_strategy = "reset",
                sorting_strategy = "ascending",
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.60,
                    },
                    vertical = {
                        mirror = false,
                    },
                    width = 0.90,
                    height = 0.85,
                    preview_cutoff = 0,
                },
                path_display = { "smart", shorten = { len = 3 } },
                dynamic_preview_title = true,
                wrap_results = true,
            },
            pickers = {
                find_files = { hidden = true },
                live_grep = {
                    additional_args = function()
                        return { "--hidden" }
                    end,
                },
                git_status = {
                    prompt_prefix = " 󰊢  ",
                    show_untracked = true,
                    initial_mode = "normal",
                    previewer = delta,
                },
                git_commits = {
                    prompt_prefix = " 󰊢  ",
                    initial_mode = "normal",
                    git_command = { "git", "log", "--all", "--pretty=%h %s (%cr)", "--", "." },
                    results_title = "git log (current buffer)",
                    previewer = delta,
                },
                git_bcommits = {
                    prompt_prefix = " 󰊢  ",
                    initial_mode = "normal",
                    git_command = { "git", "log", "--all", "--pretty=%h %s (%cr)" },
                    results_title = "git log",
                    previewer = delta,
                },
                git_branches = {
                    prompt_prefix = " 󰊢  ",
                    initial_mode = "normal",
                },
            },
            extensions = {
                fzf = {},
            },
        }
    end,
}
