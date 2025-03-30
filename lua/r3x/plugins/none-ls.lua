return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "LspAttach",
    config = function()
        local nls = require("null-ls")
        nls.setup({
            debug = false,
            sources = {
                nls.builtins.formatting.stylua,
                nls.builtins.diagnostics.yamllint.with({
                    args = {
                        "-d",
                        [[
                                {
                                    extends: relaxed,
                                    rules: {
                                        line-length: disable,
                                        comments-indentation: disable,
                                        indentation: {
                                            spaces: 2
                                        }
                                    }
                                }
                            ]],
                        "--format",
                        "parsable",
                        "-",
                    },
                }),
                nls.builtins.formatting.prettierd.with({
                    disabled_filetypes = { "markdown", "yaml", "html" },
                }),
                -- nls.builtins.formatting.sql_formatter.with({
                --     command = { "sleek" },
                -- }),
            },
        })
    end,
}
