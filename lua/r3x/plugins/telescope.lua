return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
        {
            "<leader>fg",
            function()
                require("r3x.extensions.telescope-multigrep").setup()
            end,
            desc = "Find texts",
        },
    },
    opts = function()
        require("telescope").load_extension("fzf")
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
            extensions = {
                fzf = {},
            },
        }
    end,
}
