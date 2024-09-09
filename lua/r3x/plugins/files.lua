return {
    "echasnovski/mini.files",
    version = "*",
    keys = {
        { "<leader>ntt", "<cmd>lua MiniFiles.open()<CR>", desc = "Open Mini file tree" },
    },
    opts = {
        windows = {
            preview = true,
            width_preview = 60,
        },
    },
}
