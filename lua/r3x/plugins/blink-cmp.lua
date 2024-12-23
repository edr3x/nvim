return {
    "saghen/blink.cmp",
    version = "*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        sources = {
            cmdline = { enabled = false },
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
    },
}
