return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/trouble.nvim",
            "RRethy/vim-illuminate",
            "williamboman/mason-lspconfig.nvim",
            { "williamboman/mason.nvim", config = true },
        },
        event = "BufReadPre",
        config = function()
            require("r3x.plugins.lsp.config")
            require("r3x.plugins.lsp.handlers")
        end,
    },
    -- code formatters
    {
        "nvimtools/none-ls.nvim",
        event = "LspAttach",
        config = function()
            local nls = require("null-ls")

            nls.setup({
                debug = false,
                sources = {
                    nls.builtins.formatting.stylua,
                    nls.builtins.diagnostics.yamllint.with({
                        args = require("r3x.plugins.lsp.lang.yamllint"),
                    }),
                    nls.builtins.formatting.prettierd.with({
                        disabled_filetypes = { "markdown", "yaml" },
                    }),
                },
            })
        end,
    },
    -- Lsp notifications
    {
        "j-hui/fidget.nvim",
        opts = {},
    },
}
