vim.pack.add({
    {
        src = "gh:saghen/blink.cmp",
        version = vim.version.range("1.*"),
    },
})

require("blink.cmp").setup({
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
        kind_icons = require("utils.icons").kind,
    },
})
