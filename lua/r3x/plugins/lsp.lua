return {
    -- Lsp notifications
    {
        "j-hui/fidget.nvim",
        event = "BufReadPre",
        opts = {},
    },
    -- Lsp installer and loader
    {
        "williamboman/mason.nvim",
        event = "BufReadPre",
        config = true,
    },
    -- Token Illuminate
    { "RRethy/vim-illuminate" },
}
