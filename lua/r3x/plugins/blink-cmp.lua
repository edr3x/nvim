return {
    "saghen/blink.cmp",
    event = "LspAttach",
    version = "*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        cmdline = { enabled = false },
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
            kind_icons = require("r3x.utils.kinds").icons,
        },
    },
}
