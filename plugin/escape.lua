vim.pack.add({ "https://github.com/edr3x/better-escape.nvim" })

require("better_escape").setup({
    mapping = { "jk", "kj", "JK", "KJ", "jK", "kJ", "Jk", "Kj" },
    timeout = 120,
    clear_empty_lines = false,
    keys = "<Esc>",
})
