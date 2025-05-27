return {
    "saghen/blink.cmp",
    event = "LspAttach",
    build = "...",
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        cmdline = { enabled = false },
        fuzzy = {
            implementation = "prefer_rust",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
        signature = {
            enabled = true,
            window = { border = "rounded" },
        },
        completion = {
            documentation = {
                auto_show = true,
                window = { border = "rounded" },
            },
            menu = { border = "rounded" },
        },
        appearance = {
            nerd_font_variant = "normal",
            kind_icons = require("utils.kinds").icons,
        },
    },
}
